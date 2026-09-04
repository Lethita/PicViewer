$ErrorActionPreference = 'Stop'

$projectRoot = [IO.Path]::GetFullPath((Join-Path $PSScriptRoot '..'))
$outputDirectory = Join-Path $projectRoot '.tauri-dist'

if (Test-Path -LiteralPath $outputDirectory) {
    Remove-Item -LiteralPath $outputDirectory -Recurse
}
New-Item -ItemType Directory -Path $outputDirectory | Out-Null

@(
    'index.html'
    'styles.css'
    'app.js'
    'thumbnail-worker.js'
    'icons'
) | ForEach-Object {
    Copy-Item -LiteralPath (Join-Path $projectRoot $_) -Destination $outputDirectory -Recurse
}
