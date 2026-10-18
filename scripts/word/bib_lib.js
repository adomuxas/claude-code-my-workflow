// Shared helpers for the Word conversion: paper settings, .bib parsing, LaTeX -> Unicode.
const fs = require('fs');
const path = require('path');

const root = path.resolve(__dirname, '..', '..');

// Per-paper settings. citeStyle: 'notes' = citations in footnotes (no brackets),
// 'authordate' = citations in the running text (in brackets).
const papers = {
  estonia: {
    dir: 'Paper/estonia',
    numbers: 'Tables/estonia/numbers.tex',
    bibs: ['bibliography.bib', 'bibliography_additions.bib'],
    citeStyle: 'notes',
    wordStyle: 'Chicago Footnotes',
    out: 'Paper/estonia/Estonia_GDP_paper.docx',
    master: 'Paper/estonia/Estonia_sources_master.xml',
  },
  latvia: {
    dir: 'Paper/latvia',
    numbers: 'Tables/latvia/numbers.tex',
    bibs: ['bibliography.bib', 'bibliography_additions.bib', 'bibliography_latvia.bib', 'bibliography_lit.bib'],
    citeStyle: 'authordate',
    wordStyle: 'Chicago Author-Date',
    out: 'Paper/latvia/Latvia_GDP_paper.docx',
    master: 'Paper/latvia/Latvia_sources_master.xml',
  },
};

function paper(name) {
  const p = papers[name];
  if (!p) throw new Error(`unknown paper '${name}' (expected ${Object.keys(papers).join(' or ')})`);
  return { name, ...p };
}

function parseBib(src) {
  const entries = [];
  let i = 0;
  while ((i = src.indexOf('@', i)) !== -1) {
    const m = /^@(\w+)\s*\{\s*([^,\s]+)\s*,/.exec(src.slice(i));
    if (!m) { i++; continue; }
    const type = m[1].toLowerCase();
    let j = i + m[0].length, depth = 1;
    const start = j;
    while (j < src.length && depth > 0) { if (src[j] === '{') depth++; else if (src[j] === '}') depth--; j++; }
    i = j;
    if (type === 'comment' || type === 'string' || type === 'preamble') continue;
    entries.push({ type, key: m[2], fields: parseFields(src.slice(start, j - 1)) });
  }
  return entries;
}

function parseFields(s) {
  const f = {};
  let i = 0;
  while (i < s.length) {
    const m = /^[\s,]*([A-Za-z_-]+)\s*=\s*/.exec(s.slice(i));
    if (!m) break;
    i += m[0].length;
    let val;
    if (s[i] === '{') {
      let d = 1, j = i + 1;
      while (j < s.length && d > 0) { if (s[j] === '{') d++; else if (s[j] === '}') d--; j++; }
      val = s.slice(i + 1, j - 1); i = j;
    } else if (s[i] === '"') {
      const j = s.indexOf('"', i + 1); val = s.slice(i + 1, j); i = j + 1;
    } else {
      const m2 = /^[^,]*/.exec(s.slice(i)); val = m2[0].trim(); i += m2[0].length;
    }
    f[m[1].toLowerCase()] = val.replace(/\s+/g, ' ').trim();
  }
  return f;
}

// later files override earlier ones, as with biber
function loadEntries(p) {
  const entries = new Map();
  for (const f of p.bibs) for (const e of parseBib(fs.readFileSync(path.join(root, p.dir, f), 'utf8'))) entries.set(e.key, e);
  return entries;
}

const accents = { '`': '̀', "'": '́', '^': '̂', '~': '̃', '=': '̄', 'u': '̆',
  '.': '̇', '"': '̈', 'H': '̋', 'v': '̌', 'c': '̧', 'k': '̨' };
const symbols = { o: 'ø', O: 'Ø', l: 'ł', L: 'Ł', ss: 'ß', ae: 'æ', AE: 'Æ', aa: 'å', AA: 'Å', oe: 'œ', i: 'ı', S: '§' };

function delatex(s) {
  if (!s) return s;
  s = s.replace(/\\([`'^~="uv.Hck])\s*\{?\\?([A-Za-z])\}?/g, (_, a, ch) => (ch + accents[a]).normalize('NFC'));
  s = s.replace(/\\(ss|ae|AE|aa|AA|oe|o|O|l|L|i|S)(?![A-Za-z])\s?/g, (_, c) => symbols[c]);
  s = s.replace(/\\(?:textit|emph|textbf|textsc|textup|mkbibquote|enquote)\s*\{/g, '{');
  s = s.replace(/\\([&%$#_])/g, '$1').replace(/---/g, '—').replace(/--/g, '–')
       .replace(/``|''/g, '"').replace(/~/g, ' ').replace(/\\,/g, ' ');
  return s.replace(/[{}]/g, '').replace(/\s+/g, ' ').trim();
}

// [{last, first}] or [{corporate}] from a bib name field
function parseNames(raw) {
  if (!raw) return [];
  const t = raw.trim();
  if (/^\{.*\}$/.test(t) && !/\}\s+and\s+\{/.test(t)) return [{ corporate: delatex(t) }];
  return t.split(/\s+and\s+/).map(n => {
    n = n.trim();
    if (n === 'others') return null;
    if (/^\{[^}]*\}$/.test(n)) return { last: delatex(n), first: '' };
    if (n.includes(',')) {
      const [last, ...rest] = n.split(',');
      return { last: delatex(last), first: delatex(rest.join(',')) };
    }
    const parts = n.split(/\s+/);
    return { last: delatex(parts.pop()), first: delatex(parts.join(' ')) };
  }).filter(Boolean);
}

// author part of a narrative citation, Chicago style with maxcitenames = 2
function citeAuthors(e) {
  const ns = parseNames(e.fields.author || e.fields.editor);
  if (!ns.length) return delatex(e.fields.title || e.key);
  const nm = n => n.corporate || n.last;
  if (ns.length === 1) return nm(ns[0]);
  if (ns.length === 2) return `${nm(ns[0])} and ${nm(ns[1])}`;
  return `${nm(ns[0])} et al.`;
}

module.exports = { root, paper, loadEntries, delatex, parseNames, citeAuthors };
