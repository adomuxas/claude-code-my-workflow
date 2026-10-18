# Finish the pandoc output in Word: register the cited sources with Word's
# citation manager, set the citation style and Times New Roman, update all fields.
#   powershell -File scripts/word/finalize_docx.ps1 <raw.docx> <sources_cited dir> <out.docx> <style name> [-Jeh]
# -Jeh: Journal of Economic History layout (centred headings and captions)
param([string]$RawDocx, [string]$SourcesDir, [string]$OutDocx, [string]$StyleName, [switch]$Jeh)
$ErrorActionPreference = 'Stop'

$RawDocx = (Resolve-Path $RawDocx).Path
$SourcesDir = (Resolve-Path $SourcesDir).Path
$OutDocx = [System.IO.Path]::GetFullPath($OutDocx)

$word = New-Object -ComObject Word.Application
$word.Visible = $false
$word.DisplayAlerts = 0
try {
    $doc = $word.Documents.Open($RawDocx)

    # ---- sources (one <b:Source> per file) ----
    foreach ($f in Get-ChildItem $SourcesDir -Filter *.xml | Sort-Object Name) {
        $doc.Bibliography.Sources.Add([System.IO.File]::ReadAllText($f.FullName, [System.Text.Encoding]::UTF8))
    }
    # the styles are built by make_style.js into %APPDATA%\Microsoft\Bibliography\Style
    $doc.Bibliography.BibliographyStyle = $StyleName

    # ---- page: A4, 2.5 cm margins ----
    $ps = $doc.PageSetup
    $ps.PageWidth = 595.3; $ps.PageHeight = 841.9
    $ps.TopMargin = 70.9; $ps.BottomMargin = 70.9; $ps.LeftMargin = 70.9; $ps.RightMargin = 70.9

    # ---- fonts: Times New Roman throughout, black headings ----
    foreach ($s in $doc.Styles) {
        if ($s.Type -ne 1 -and $s.Type -ne 2) { continue }   # paragraph and character styles
        try {
            $s.Font.Name = 'Times New Roman'
            $s.Font.NameAscii = 'Times New Roman'
            $s.Font.NameOther = 'Times New Roman'
        } catch {}
    }
    $normal = $doc.Styles.Item('Normal')
    $normal.Font.Size = 12
    foreach ($name in 'Heading 1', 'Heading 2', 'Heading 3', 'Title', 'Subtitle', 'Author', 'Abstract Title') {
        try { $st = $doc.Styles.Item($name); $st.Font.Color = -16777216 } catch {}
    }
    foreach ($name in 'Heading 1', 'Title') { try { $doc.Styles.Item($name).Font.Size = 14 } catch {} }
    try { $doc.Styles.Item('Heading 1').Font.Bold = $true } catch {}
    try { $h2 = $doc.Styles.Item('Heading 2'); $h2.Font.Size = 12; $h2.Font.Italic = $true; $h2.Font.Bold = $true } catch {}
    try { $doc.Styles.Item('Footnote Text').Font.Size = 10 } catch {}
    # body text double-spaced (EHR submission); footnotes, tables and references single
    foreach ($name in 'Body Text', 'First Paragraph', 'Abstract') {
        try { $doc.Styles.Item($name).ParagraphFormat.LineSpacingRule = 2 } catch {}
    }
    foreach ($name in 'Compact', 'Footnote Text', 'Table Caption', 'Bibliography', 'Table Note') {
        try { $doc.Styles.Item($name).ParagraphFormat.LineSpacingRule = 0 } catch {}
    }
    try {
        $tn = $doc.Styles.Item('Table Note')
        $tn.Font.Size = 10
        $tn.ParagraphFormat.SpaceBefore = 3; $tn.ParagraphFormat.SpaceAfter = 12
    } catch {}
    foreach ($name in 'Table Caption', 'Image Caption') {
        try { $doc.Styles.Item($name).ParagraphFormat.KeepWithNext = $true } catch {}
    }
    try {
        $ac = $doc.Styles.Item('Author Check')
        $ac.Font.Size = 11
        $ac.ParagraphFormat.LineSpacingRule = 0
        $ac.ParagraphFormat.SpaceBefore = 6; $ac.ParagraphFormat.SpaceAfter = 6
        $ac.ParagraphFormat.Shading.BackgroundPatternColor = 65535   # yellow
    } catch {}
    if ($Jeh) {
        # JEH: section headings centred, upper case, bold; subsections centred italic
        $h1 = $doc.Styles.Item('Heading 1'); $h1.Font.Size = 12; $h1.ParagraphFormat.Alignment = 1
        $h2 = $doc.Styles.Item('Heading 2'); $h2.Font.Bold = $false; $h2.ParagraphFormat.Alignment = 1
        foreach ($name in 'Table Caption', 'Image Caption') {
            try { $c = $doc.Styles.Item($name); $c.Font.Italic = $false; $c.ParagraphFormat.Alignment = 1 } catch {}
        }
    }

    # ---- tables: fit to page width ----
    # (10 pt text, 8 pt for the wide appendix tables, as \footnotesize / \scriptsize in LaTeX)
    foreach ($t in $doc.Tables) {
        $t.Range.Font.Size = $(if ($t.Columns.Count -ge 10) { 8 } else { 10 })
        $t.Range.ParagraphFormat.SpaceAfter = 0
        $t.AllowAutoFit = $true
        $t.AutoFitBehavior(1)
        $t.AutoFitBehavior(2)
    }

    # ---- fields: citations in text and footnotes, then the bibliography ----
    foreach ($story in $doc.StoryRanges) {
        $r = $story
        while ($r -ne $null) { [void]$r.Fields.Update(); $r = $r.NextStoryRange }
    }
    [void]$doc.Content.Fields.Update()

    $doc.SaveAs2($OutDocx, 16)
    "style: " + $doc.Bibliography.BibliographyStyle
    "sources: " + $doc.Bibliography.Sources.Count
    "footnotes: " + $doc.Footnotes.Count
    $doc.Close(0)
} finally {
    $word.Quit()
    [void][System.Runtime.InteropServices.Marshal]::ReleaseComObject($word)
}
