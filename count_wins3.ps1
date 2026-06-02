$content = Get-Content "comparativo_dip_ayu_2024.html" -Raw

# Find municipios array in comparativo
$munStart = $content.IndexOf("const municipios = [")
$munEnd = $content.IndexOf("];", $munStart) + 2
$munSection = $content.Substring($munStart, $munEnd - $munStart)

# Find distritos array in comparativo
$distStart = $content.IndexOf("const distritos = [")
$distEnd = $content.IndexOf("];", $distStart) + 2
$distSection = $content.Substring($distStart, $distEnd - $distStart)

$parties = @('MORENA','PAN','PRI','MC','PVEM','PT','PRD','NAEM')

Write-Host "=== AYU (municipios) Victorias por partido ==="
foreach ($p in $parties) {
    $count = ([regex]::Matches($munSection, "g:'$p'")).Count
    if ($count -gt 0) { Write-Host "$p`: $count" }
}

Write-Host ""
Write-Host "=== DIP (distritos) Victorias por partido ==="
foreach ($p in $parties) {
    $count = ([regex]::Matches($distSection, "g:'$p'")).Count
    if ($count -gt 0) { Write-Host "$p`: $count" }
}
