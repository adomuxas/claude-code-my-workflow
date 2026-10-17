# Plan: Independent verification of every citation in the Latvia and Estonia papers

**Date:** 2026-10-17
**Status:** COMPLETED 2026-10-17
**Branch:** feat/citation-verification

## Goal
Confirm that every citation in `Paper/latvia/` and `Paper/estonia/` points to a source and page whose text supports the sentence, and that every cited bibliography entry matches the source's own citation data. Fix what is wrong; log what cannot be checked.

## Inventory (start)
- Latvia: 197 citation commands (parencite 89, parencites 95, textcite 13) in `sections/0[1-6]*.tex`; 189 cited works.
- Estonia: 178 `\autocite` commands in `sections/*.tex` (+ main.tex); 127 cited works.
- Corpus: `newsources/<folder>/_bibinfo.txt` + `pNNNN.txt` (printed page numbers).

## Steps
1. Mechanical inventory: script extracts every (file, line, command, key, postnote, sentence context) → `quality_reports/verification/<paper>_citations.tsv`.
2. Mechanical key→folder mapping: from each paper's `main.bbl` (first author family, year, title) match `_bibinfo.txt` of all 2,790 folders → `<paper>_key_folders.tsv` with candidate folders and a status (matched / ambiguous / not in corpus).
3. Verification agents (read-only, batches of ~60–80 citation instances): for each instance with a corpus folder, open the cited page(s) (or, with no postnote, search the folder for the claim) and grade SUPPORTED / PARTIAL / NOT SUPPORTED / WRONG PAGE / NOT IN CORPUS; check the bib entry against `_bibinfo.txt` (author, year, title, type, chapter pages). Each agent writes `quality_reports/verification/<paper>_batchNN.md` with a table and proposed fixes (exact .tex wording).
4. Orchestrator consolidates → `quality_reports/verification/2026-10-17_citation_verification_report.md`; applies NOT SUPPORTED / WRONG PAGE / bib fixes (own-series claims untouched; where a source contradicts a historical fact, correct and log); rebuilds both papers (XeLaTeX + biber ×3), 0 undefined / 0 overfull.
5. Commit on branch, PR, merge (GitHub API).

## Not in scope
Re-mining the round-1 literature subset; adding new citations beyond what a fix requires.
