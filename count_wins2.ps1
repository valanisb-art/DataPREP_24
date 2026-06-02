$content = Get-Content "datos_integral.js" -Raw

$distStart = $content.IndexOf("const DISTRITOS=")
$munStart = $content.IndexOf("const MUNICIPIOS=")

$distSection = $content.Substring($distStart, $munStart - $distStart)
$munSection = $content.Substring($munStart)

# Count AYU wins by individual party (g field in municipios)
$parties = @('MORENA','PAN','PRI','MC','PVEM','PT','PRD','NAEM')
Write-Host "=== AYU Victorias por partido (campo g) ==="
foreach ($p in $parties) {
    $count = ([regex]::Matches($munSection, ",g:'$p',")).Count
    if ($count -gt 0) { Write-Host "$p`: $count" }
}

Write-Host ""
Write-Host "=== DIP Victorias por partido (campo g) ==="
foreach ($p in $parties) {
    $count = ([regex]::Matches($distSection, ",g:'$p',")).Count
    if ($count -gt 0) { Write-Host "$p`: $count" }
}
Write-Host "4T: $( ([regex]::Matches($distSection, ",g:'4T',")).Count )"
Write-Host "VA: $( ([regex]::Matches($distSection, ",g:'VA',")).Count )"
Write-Host "MC: $( ([regex]::Matches($distSection, ",g:'MC',")).Count )"
