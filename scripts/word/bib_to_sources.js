// Convert a paper's .bib files to Word bibliography sources.
//   node scripts/word/bib_to_sources.js <estonia|latvia> <cited_keys.txt> <out_dir>
// Writes <out_dir>/sources_cited/<n>.xml (one <b:Source> per file, for
// Document.Bibliography.Sources.Add) and <out_dir>/Sources_all.xml, a Word
// master source list holding every entry of the paper's .bib files.
const fs = require('fs');
const path = require('path');
const { paper, loadEntries, delatex, parseNames, citeAuthors } = require('./bib_lib');

const [paperName, citedFile, outDir] = process.argv.slice(2);
const p = paper(paperName);
const NS = 'http://schemas.openxmlformats.org/officeDocument/2006/bibliography';

const x = s => s.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;');
const el = (name, v) => v ? `<b:${name}>${x(v)}</b:${name}>` : '';

function names(raw) {
  const ns = parseNames(raw);
  if (!ns.length) return null;
  if (ns[0].corporate) return `<b:Corporate>${x(ns[0].corporate)}</b:Corporate>`;
  return '<b:NameList>' + ns.map(n => `<b:Person>${el('Last', n.last)}${el('First', n.first)}</b:Person>`).join('') + '</b:NameList>';
}

const pages = s => s && delatex(s).replace(/(\d)-(\d)/g, '$1–$2');
const guid = key => {
  const s = require('crypto').createHash('md5').update(key).digest('hex').toUpperCase();
  return `{${s.slice(0, 8)}-${s.slice(8, 12)}-${s.slice(12, 16)}-${s.slice(16, 20)}-${s.slice(20)}}`;
};

function source(e) {
  const f = e.fields;
  const d = k => delatex(f[k]);
  const year = (f.year || f.date || '').match(/\d{4}[a-j]?/)?.[0] || d('year') || 'n.d.';
  let type, extra = '';
  switch (e.type) {
    case 'article':
      type = 'JournalArticle';
      extra = el('JournalName', d('journal') || d('journaltitle')) + el('Volume', d('volume')) + el('Issue', d('number')) + el('Pages', pages(f.pages));
      break;
    case 'book': case 'collection': case 'mvbook':
      type = 'Book';
      extra = el('Volume', d('volume')) + el('Edition', d('edition'));
      break;
    case 'inbook': case 'incollection': case 'inproceedings':
      type = 'BookSection';
      extra = el('BookTitle', d('booktitle') || d('maintitle')) + el('Pages', pages(f.pages)) + el('Volume', d('volume'));
      break;
    case 'thesis': case 'phdthesis': case 'mastersthesis':
      type = 'Report';
      extra = el('ThesisType', d('type') || (e.type === 'mastersthesis' ? "Master's thesis" : 'PhD diss.'));
      break;
    case 'report': case 'techreport':
      type = 'Report';
      extra = el('ThesisType', [d('type'), d('number')].filter(Boolean).join(' '));
      break;
    default:
      type = f.url && !f.publisher ? 'DocumentFromInternetSite' : 'Misc';
      extra = el('PublicationTitle', d('howpublished') || d('journal') || d('journaltitle'));
  }
  const author = names(f.author), editor = names(f.editor);
  const authorBlock = (author || editor)
    ? '<b:Author>' + (author ? `<b:Author>${author}</b:Author>` : '') + (editor ? `<b:Editor>${editor}</b:Editor>` : '') + '</b:Author>'
    : '';
  // Chicago gives no publisher for journal articles
  const publisher = type === 'JournalArticle' ? '' : d('publisher') || d('institution') || d('school') || d('organization');
  return `<b:Source xmlns:b="${NS}">${el('Tag', e.key.replace(/[^A-Za-z0-9_]/g, '_'))}<b:SourceType>${type}</b:SourceType>`
    + `<b:Guid>${guid(e.key)}</b:Guid>${authorBlock}${el('Title', d('title'))}${el('Year', year)}`
    + extra + el('City', d('address') || d('location')) + el('Publisher', publisher)
    + el('URL', f.url) + el('Comments', d('note')) + '</b:Source>';
}

const entries = loadEntries(p);
const cited = fs.readFileSync(citedFile, 'utf8').split(/\r?\n/).filter(Boolean);
const missing = cited.filter(k => !entries.has(k));
if (missing.length) { console.error('missing bib entries: ' + missing.join(', ')); process.exit(1); }

// Chicago author-date: works with the same authors and year become 2024a, 2024b
const groups = {};
for (const k of cited) {
  const f = entries.get(k).fields;
  // as biblatex: the names shown in the citation ("Klimantas et al."), not the full list
  const who = citeAuthors(entries.get(k)).toLowerCase();
  const year = (f.year || f.date || '').match(/\d{4}/)?.[0];
  if (!year) continue;
  (groups[who + '#' + year] ||= []).push(k);
}
for (const keys of Object.values(groups)) {
  if (keys.length < 2) continue;
  keys.sort((a, b) => delatex(entries.get(a).fields.title || '').localeCompare(delatex(entries.get(b).fields.title || '')));
  keys.forEach((k, i) => { const f = entries.get(k).fields; f.year = (f.year || f.date).match(/\d{4}/)[0] + 'abcdefghij'[i]; });
  console.log('year suffixes: ' + keys.join(', '));
}

const citedDir = path.join(outDir, 'sources_cited');
fs.rmSync(citedDir, { recursive: true, force: true });
fs.mkdirSync(citedDir, { recursive: true });
cited.forEach((k, i) => fs.writeFileSync(path.join(citedDir, String(i).padStart(4, '0') + '.xml'), source(entries.get(k))));

const all = [...entries.values()].map(e => source(e).replace(` xmlns:b="${NS}"`, '')).join('\n');
fs.writeFileSync(path.join(outDir, 'Sources_all.xml'),
  `<?xml version="1.0" encoding="UTF-8"?>\n<b:Sources SelectedStyle="" xmlns:b="${NS}" xmlns="${NS}">\n${all}\n</b:Sources>\n`);
console.log(`${cited.length} cited sources, ${entries.size} sources in master list`);
