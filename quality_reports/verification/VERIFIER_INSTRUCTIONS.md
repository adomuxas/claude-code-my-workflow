# Citation verifier instructions (shared by all batches)

Independent citation verification for two economic-history papers: `Paper/latvia/` (Latvia's GDP 1919–2024 and the Baltic comparison; citations use `\parencite`, `\parencites`, `\textcite`) and `Paper/estonia/` (Estonia's GDP 1919–1995 and the Finland comparison; citations use `\autocite`).

**READ-ONLY.** Do not edit any paper, bib or data file. Your only output is one report file. Judge from the source page text itself, never from anyone's summary.

Repository root: `C:\Users\Administrator\latvia-estonia-gdp-paper` (Windows; use forward slashes in Bash, e.g. `/c/Users/Administrator/latvia-estonia-gdp-paper`).

## Inputs
- **Your batch** `quality_reports/verification/<paper>_batchNN.tsv` (tab-separated: id, paper, file, line, cmd, key, postnote, context). The `context` column is a rough automatic extract. ALWAYS read the actual sentence in the .tex file at the given line (Latvia: `Paper/latvia/sections/<file>` or `Paper/latvia/main.tex`; Estonia: `Paper/estonia/sections/<file>` or `Paper/estonia/main.tex`), including the surrounding sentence or footnote.
- **Key → source folder**: `quality_reports/verification/<paper>_key_folders.tsv` (key, family, year, title, status, best_folder, score, alt_folders). `matched` = one folder. `ambiguous` = several candidates, usually one folder per chapter of the same book: pick the chapter whose pages contain the cited page. `not_in_corpus` = no automatic match: before accepting that, grep the index of all folders, `C:\Users\ADMINI~1\AppData\Local\Temp\claude\C--Users-Administrator-latvia-estonia-gdp-paper\ca46117a-f2e5-444d-b1c9-da3c7b9a6141\scratchpad\verify\bibinfo_index.tsv` (folder TAB citation), by surname (with and without diacritics) and by title words.
- **Corpus**: `newsources/<folder>/_bibinfo.txt` (the source's citation) and `newsources/<folder>/pNNNN.txt`, where NNNN is the PRINTED page number (p0385.txt = p. 385). `manifest.json`, where present, gives the page range and offset notes.
- **Bibliographies**: Latvia `Paper/latvia/bibliography.bib`, `bibliography_additions.bib`, `bibliography_latvia.bib`, `bibliography_lit.bib`; Estonia `Paper/estonia/bibliography.bib`, `bibliography_additions.bib`. Grep for `{key,`.
- **Number macros** (`\lv{1938}`, `\gr{..}{..}`, `\pctx{..}{..}{..}`, `\ee{..}` etc.) print the paper's own series; values are in `Tables/<paper>/numbers.tex` if needed.

## Procedure for every instance
1. Read the sentence. Identify exactly what claim the citation is attached to. If the sentence states the paper's own result and cites a source for comparison or attribution, grade only the comparison or attribution.
2. Locate the folder. If none exists → NOT IN CORPUS (still do step 5 if a bib entry exists; mark it "unchecked" if no `_bibinfo` is available).
3. Open the cited page file(s). For a range longer than six pages, open first, middle and last page and grep the folder for the sentence's key terms (names, numbers, years). With no postnote, grep the folder for the key terms and open the hits. If a cited page file does not exist, grade PAGE MISSING and check neighbouring pages and the manifest page range.
4. Grade:
   - **SUPPORTED**: the page says what the sentence attributes to it.
   - **PARTIAL**: supports a weaker, narrower or somewhat different statement (say what).
   - **NOT SUPPORTED**: nothing on the cited page or in the folder supports it.
   - **WRONG PAGE**: support exists elsewhere in the folder (give the right page).
   - **PAGE MISSING** / **NOT IN CORPUS**.
   For SUPPORTED, PARTIAL and WRONG PAGE give a verbatim supporting quote of at most 25 words (translate if needed and note the original language).
5. Once per distinct key in the batch: compare the bib entry with `_bibinfo.txt`: author(s), year, title, type (article/book/chapter), journal and volume or book title, editor, publisher, chapter page range. Grade **BIB OK** / **BIB MINOR** (e.g. capitalisation, missing edition) / **BIB WRONG** (say what is wrong and give the corrected field).

Be rigorous and literal. A citation that is almost right is PARTIAL, not SUPPORTED. To save effort, batch your reads: grep several keys at once, read several page files in one command.

## Output
Write `quality_reports/verification/<paper>_batchNN_report.md` with:
1. Header: batch, number of instances, number of distinct keys.
2. `## Citation grades`: one table row per instance: id | file:line | key [postnote] | folder (short) | grade | supporting quote or problem | proposed fix (exact replacement .tex text; only for NOT SUPPORTED, WRONG PAGE, or PARTIAL where the sentence should change).
3. `## Bibliography checks`: key | folder | grade | problem and corrected field(s).
4. `## Summary`: counts by grade; the instances needing action, most serious first.

Write the report incrementally (create the file early and append as you go) so that partial work survives an interruption. Finish your final message with a two-line count summary.
