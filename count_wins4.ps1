$content = Get-Content "comparativo_dip_ayu_2024.html" -Raw

# Count entries in municipios array
$munStart = $content.IndexOf("const municipios = [")
$munEnd = $content.IndexOf("];", $munStart) + 2
$munSection = $content.Substring($munStart, $munEnd - $munStart)
$munCount = ([regex]::Matches($munSection, "\{id:'")).Count
Write-Host "Municipios en comparativo: $munCount"

# Count entries in distritos array
$distStart = $content.IndexOf("const distritos = [")
if ($distStart -ge 0) {
    $distEnd = $content.IndexOf("];", $distStart) + 2
    $distSection = $content.Substring($distStart, $distEnd - $distStart)
    $distCount = ([regex]::Matches($distSection, "\{id:'")).Count
    Write-Host "Distritos en comparativo: $distCount"
} else {
    Write-Host "No se encontro array distritos"
}
