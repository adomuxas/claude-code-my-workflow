# Fixer brief: Estonia citation fixes (2026-10-17)

You apply the approved fixes in `quality_reports/plans/2026-10-17_estonia-citation-fixes.md`. Only the items assigned to you, in your files.

Evidence for each finding is in `quality_reports/verification/fresh_audit_estonia/report_<N>.md` (ids match `estonia_cites.tsv`). Read `BRIEF.md` in the same folder for where sources live:
- `newsources/<folder>/pNNNN.txt` = printed page.
- `$SP/pdftext/<key>/pdfNNNN.txt` = PDF page; use the offset given in the report.
- `SP=/c/Users/ADMINI~1/AppData/Local/Temp/claude/C--Users-Administrator-latvia-estonia-gdp-paper/92da39e7-55ad-4084-8ef9-421101174155/scratchpad`.

## Rules (non-negotiable)
1. **Re-open the page before every change** to a fact, figure, page number or attribution. Never change on the strength of the report alone.
2. **New citation = opened page.** Add a citation only for a page you have read. Give a verbatim quote of 25 words or fewer in your log.
3. **No support in the project → narrow the sentence.** Do not add an unverified citation. Keep the paper's prose style: British spelling, EHR register, `\autocite[pages]{key}` inside `\footnote{...}`, en-dash page ranges written `--`, and the existing number macros.
4. **Paper's own numbers.** If a figure comes from the paper's own series (`Data/`, `Tables/estonia/`, `Paper/estonia/supplementary/Estonia_online_data_appendix.xlsx`), say so ("on the present estimates", or point to the table). Do not credit an outside source.
5. **Minimal edits.** Change only what the finding requires. Do not restyle surrounding text.
6. **Backslashes.** Use the Edit tool for .tex/.bib/.R files, never sed or perl: Bash collapses doubled backslashes. If an Edit fails because the file changed, re-read and retry. Another fixer works in parallel on other files.
7. **Do not compile** and do not run R. The orchestrator does both.
8. **Do not write report or log files.** The harness blocks it. Return your change log as text in your final message.

## Final message format
One table: id | file:line | before (short) | after (short) | evidence (source, page, quote ≤ 25 words). Then:
- "Not fixed / needs author", with the reason;
- "New bib entries needed" (full BibLaTeX text), if any.
