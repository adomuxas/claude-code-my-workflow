# Convert a paper to Word with live citations.
#   powershell -ExecutionPolicy Bypass -File scripts/word/build_docx.ps1 -Paper estonia|latvia [-Pandoc <path to pandoc.exe>]
# Output (set in bib_lib.js): Paper/<paper>/<Paper>_GDP_paper.docx and <Paper>_sources_master.xml
param(
    [Parameter(Mandatory = $true)][ValidateSet('estonia', 'latvia')][string]$Paper,
    [string]$Pandoc = 'pandoc'
)
$ErrorActionPreference = 'Stop'
$root = (Resolve-Path "$PSScriptRoot/../..").Path
Set-Location $root
$build = Join-Path $env:TEMP "${Paper}_docx_build"
New-Item -ItemType Directory -Force $build | Out-Null

$cfg = node -e "const p=require('./scripts/word/bib_lib').paper('$Paper');console.log(JSON.stringify(p))" | ConvertFrom-Json

node scripts/word/make_style.js
if (-not $?) { throw 'make_style.js failed' }

# figures: PDF -> 300 dpi PNG for Word
$figDir = ''
if ($cfg.figures) {
    $figDir = Join-Path $build 'figures'
    New-Item -ItemType Directory -Force $figDir | Out-Null
    foreach ($f in Get-ChildItem $cfg.figures -Filter *.pdf) {
        pdftoppm -png -r 300 -singlefile $f.FullName (Join-Path $figDir $f.BaseName)
        if (-not $?) { throw "pdftoppm failed on $($f.Name)" }
    }
}

node scripts/word/prep_tex.js $Paper $build $figDir
if (-not $?) { throw 'prep_tex.js failed' }
node scripts/word/bib_to_sources.js $Paper "$build/cited_keys.txt" $build
if (-not $?) { throw 'bib_to_sources.js failed' }
& $Pandoc "$build/prepped.tex" -f latex -t docx --lua-filter scripts/word/cite_fields.lua -o "$build/raw.docx"
if (-not $?) { throw 'pandoc failed' }
$jeh = $cfg.citeStyle -eq 'authordate'
& "$PSScriptRoot/finalize_docx.ps1" "$build/raw.docx" "$build/sources_cited" $cfg.out $cfg.wordStyle -Jeh:$jeh
Copy-Item "$build/Sources_all.xml" $cfg.master -Force
