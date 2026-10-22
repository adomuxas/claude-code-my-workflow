// Build two Word citation styles from Word's own CHICAGO.XSL and install them in
// %APPDATA%\Microsoft\Bibliography\Style:
//   "Chicago Footnotes"   (ChicagoFootnotes.xsl)  -- Estonia paper, citations inside footnotes
//   "Chicago Author-Date" (ChicagoAuthorDate.xsl) -- Latvia paper, citations in the text
//   node scripts/word/make_style.js [CHICAGO.XSL] [out_dir]
// Changes to the built-in Chicago style, both variants:
//  - several sources in one citation are separated by "; " rather than ", "
//  - the title is no longer added when an author has more than one work
//    (same-author, same-year works are told apart by 2024a/2024b instead)
//  - a citation whose author is suppressed (\n, used after a name in the text)
//    prints "(2021, 163)" rather than the title
// "Chicago Footnotes" also prints citations without parentheses, in the Chicago short-note form
// (author, short title, pages).
const fs = require('fs');
const path = require('path');

const src = process.argv[2] || 'C:/Program Files/Microsoft Office/root/Office16/Bibliography/Style/CHICAGO.XSL';
const outDir = process.argv[3] || path.join(process.env.APPDATA, 'Microsoft', 'Bibliography', 'Style');
const original = fs.readFileSync(src, 'utf8');
// the cited source, as the citation block of CHICAGO.XSL addresses it
const SRC = 'msxsl:node-set($ListPopulatedWithMain)/b:Citation/b:Source';

function build(styleName, brackets) {
  let x = original;
  const patch = (re, repl, expected) => {
    const n = (x.match(re) || []).length;
    if (n !== expected) throw new Error(`pattern ${re} matched ${n} times, expected ${expected}`);
    x = x.replace(re, repl);
  };
  patch(/<xsl:when test="b:StyleNameLocalized">[\s\S]*?<\/xsl:choose>\s*<\/xsl:when>/g,
    `<xsl:when test="b:StyleNameLocalized"><xsl:text>${styleName}</xsl:text></xsl:when>`, 1);
  patch(/(<xsl:when test="b:Version">\s*<xsl:text>)[^<]*/g, '$12026.10.18', 1);

  // the citation block runs from <xsl:when test="b:Citation"> to <xsl:when test="b:Bibliography">
  const start = x.indexOf('<xsl:when test="b:Citation">');
  const end = x.indexOf('<xsl:when test="b:Bibliography">', start);
  let cit = x.slice(start, end);
  const steps = [
    [/(<xsl:if test="not\(\/b:Citation\/b:LastAuthor\)">\s*)<xsl:call-template name="templ_prop_ListSeparator"\/>/,
      '$1<xsl:text>; </xsl:text>'],
    [/<xsl:when test="msxsl:node-set\(\$ListPopulatedWithMain\)\/b:Citation\/b:RepeatedAuthor">\s*<xsl:value-of select="\$title" \/>\s*<\/xsl:when>/, ''],
    [/(<xsl:variable name="displayTitle">\s*<xsl:choose>\s*<xsl:when test=")string-length\(\$displayAuthor\) = 0/,
      '$1string-length($author0) = 0'],
    // names as biblatex with maxcitenames = 2: three or more authors give "First et al.",
    // never extra names or first initials added by Word to tell sources apart
    [/test = "msxsl:node-set\(\$ListPopulatedWithMain\)\/b:Citation\/b:MinAuthors > 1"/, 'test = "false()"'],
    [/test="msxsl:node-set\(\$ListPopulatedWithMain\)\/b:Citation\/b:NonUniqueLastName"/g, 'test="false()"'],
    [/<xsl:when test = "\$cAuthors > 3 and position\(\) = \$minAuthors">[\s\S]*?(<xsl:call-template name="templ_str_AndOthersUnCap"\/>)/,
      '<xsl:when test = "$cAuthors > 2 and position() = $minAuthors"><xsl:call-template name="templ_prop_Space"/>$1'],
    [/test\s*=\s*"\$cAuthors > 3 and position\(\) > \$minAuthors"/g, 'test="$cAuthors > 2 and position() > $minAuthors"'],
  ];
  if (!brackets) steps.push(
    [/<xsl:call-template name="templ_prop_OpenBracket"\/>/, ''],
    [/<xsl:call-template name="templ_prop_CloseBracket"\/>/, ''],
    // Chicago short notes: "Kahk and Tarvel, An economic, 107" -- author, short title (ShortTitle, else
    // Title), pages; no year. Live fields cannot tell a first citation from a later one, so every note
    // takes the short form (CMOS 14.29, with the full reference in the bibliography).
    [/(<xsl:variable name="displayTitle">\s*<xsl:choose>\s*<xsl:when test=")string-length\(\$author0\) = 0/, '$1true()'],
    [/(<xsl:if test="string-length\(\$year\) > 0 and not\(string-length\(\$author0\) = 0 and string-length\(\$title0\) = 0 and string-length\(\$yearSimple\) = 0\))">/,
      '$1 and string-length($displayTitle) = 0">'],
    // a biblatex shorthand ("MPD 2023") stands alone: bib_to_sources.js marks it with StandardNumber
    [/(<xsl:variable name="displayAuthor">\s*)<xsl:value-of select="\$author" \/>/,
      `$1<xsl:if test="not(${SRC}/b:StandardNumber = 'shorthand')"><xsl:value-of select="$author" /></xsl:if>`],
    // titles as biblatex-chicago sets them: quoted for articles, chapters, theses and unpublished
    // work (British single quotes), plain for a shorthand, italic otherwise
    [/<xsl:if test="string-length\(\$displayTitle\)>0">\s*<xsl:value-of select="\$displayTitle"\/>\s*<\/xsl:if>/,
      `<xsl:choose>
								<xsl:when test="${SRC}/b:StandardNumber = 'shorthand'"><xsl:value-of select="$displayTitle"/></xsl:when>
								<xsl:when test="$type = 'JournalArticle' or $type = 'BookSection' or $type = 'ArticleInAPeriodical' or $type = 'ConferenceProceedings' or ($type = 'Report' and (contains(${SRC}/b:ThesisType, 'diss') or contains(${SRC}/b:ThesisType, 'thesis') or contains(${SRC}/b:ThesisType, 'manuscript')))"><xsl:text>‘</xsl:text><xsl:value-of select="$displayTitle"/><xsl:text>’</xsl:text></xsl:when>
								<xsl:otherwise><i xmlns="http://www.w3.org/TR/REC-html40"><xsl:value-of select="$displayTitle"/></i></xsl:otherwise>
							</xsl:choose>`]);
  for (const [re, repl] of steps) {
    if (!re.test(cit)) throw new Error(`citation block: no match for ${re}`);
    cit = cit.replace(re, repl);
  }
  x = x.slice(0, start) + cit + x.slice(end);

  const out = path.join(outDir, styleName.replace(/[^A-Za-z]/g, '') + '.xsl');
  fs.mkdirSync(outDir, { recursive: true });
  fs.writeFileSync(out, x);
  console.log('wrote ' + out);
}

build('Chicago Footnotes', false);
build('Chicago Author-Date', true);
