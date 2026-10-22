# Plan: finalize the Estonia and Latvia Word files (QA against the LaTeX PDFs)

**Status:** COMPLETED (2026-10-22). Verification results:
- Text check: field and source counts unchanged (Estonia 177/139, Latvia 286/187). Estonia notes are all in short-note form, none author-date. Norkus year letters match the PDF. Both papers have a REFERENCES heading. No error fields and no leftover LaTeX.
- Symbols: counts of − ± × † < > in the Word text match the PDF exactly (Latvia 130 minus signs, Estonia 55). The only Word equation left is the display equation.
- Visual (pages exported from Word): footnotes, body text, the first and last tables, and the start of the references all look right. Cosmetic: long row labels wrap in narrow first table columns.

## Context
The user asked to "finalize" both Word files and chose a full QA pass: compare each .docx with its LaTeX PDF and fix conversion errors in the pipeline (`scripts/word/`), then rebuild.

The comparison was a word-level diff of the PDF text against the .docx text, with field results kept. It found the issues below. A visual pass on rendered pages is pending, because Word's PDF export of these files is very slow.

## Findings and fixes
1. **Estonia footnote citations are in author-date form** ("Lepp and Pantti 2013, 77"). The PDF uses Chicago notes.
   - The PDF gives the full citation at first mention and a short note ("Kahk and Tarvel, *An economic*, 107") afterwards.
   - Live Word citation fields can't tell a first mention from a later one, so every note will use the Chicago short-note form: Author, Short title, pages. CMOS 14.29 allows short notes throughout when a full bibliography is given.
   - `make_style.js`, "Chicago Footnotes" variant: show the title instead of the year in citations. Italic for books, reports and theses; quoted for articles and chapters.
   - `bib_to_sources.js`: write `shorttitle` to `<b:ShortTitle>`. The style already prefers ShortTitle over Title.
   - Shorthand (`MPD 2023`): cite by the shorthand alone.
   - Estonia gets no year letters (its .bbl has no extradate).
2. **Same-author/same-year letters don't match the PDF** (Latvia: Word "Norkus 2023b" where the PDF has "2023c").
   - `bib_to_sources.js` sorts by title; biblatex sorts by its own bibliography order.
   - Fix: read `extradate` from `Paper/<paper>/main.bbl` so the letters match the PDF exactly.
3. **Inline symbols become Word equations.** Minus, ±, <, >, ×, † and superscript s are set in Cambria Math instead of Times New Roman (130 in Latvia, 55 in Estonia).
   - Fix: in `prep_tex.js`, turn simple inline math into text (− ± + < > × † and superscripts).
   - Real variables (wᵢ, I_it, R², the display equation) stay as equations.
4. **Estonia references heading** reads "Bibliography"; the PDF has "REFERENCES" (biblatex string, upper-cased by titlesec).
   - Fix: the default heading becomes "References", upper-cased for both papers.
5. **Not fixable with live citations.** These will be reported, not fixed:
   - first-mention full notes (Estonia);
   - the reference-list entry format, which is Word's Chicago bibliography, not biblatex's;
   - the title-page date.

## Files
- `scripts/word/make_style.js`
- `scripts/word/bib_to_sources.js`
- `scripts/word/prep_tex.js`
- `scripts/word/bib_lib.js` (only if a config change is needed)

## Verification
1. Rebuild both papers. Re-run the text diff; the citation and symbol hunks should be gone.
2. Spot-check rendered pages: footnotes, tables and references.
3. Field and source counts should be unchanged:
   - Latvia: 286 fields, 187 sources.
   - Estonia: 177 fields, 139 sources.
