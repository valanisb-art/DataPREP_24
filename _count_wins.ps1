$html = Get-Content "comparativo_dip_ayu_2024.html" -Raw -Encoding UTF8
$parties = @('MORENA','PAN','PRI','MC','PVEM','PT','PRD','NAEM')

# Extraer seccion de municipios
$start = $html.IndexOf("const municipios = [")
$end = $html.IndexOf("];`nconst distritos")
$munSection = $html.Substring($start, $end - $start)

Write-Host "=== AYU Victorias por partido ==="
$total = 0
foreach ($p in $parties) {
    $count = ([regex]::Matches($munSection, "g:'$p'")).Count
    if ($count -gt 0) { Write-Host "${p}: $count"; $total += $count }
}
Write-Host "Total municipios con ganador: $total"

# Extraer seccion de distritos
$start2 = $html.IndexOf("const distritos = [")
$end2 = $html.IndexOf("];`nconst totalesDip")
if ($end2 -lt 0) { $end2 = $html.IndexOf("];`n`nconst totalesDip") }
if ($end2 -lt 0) { $end2 = $html.IndexOf("];`r`nconst totalesDip") }
$distSection = $html.Substring($start2, [Math]::Max(1, $end2 - $start2))

Write-Host "`n=== DIP Victorias por partido ==="
$total2 = 0
foreach ($p in $parties) {
    $count = ([regex]::Matches($distSection, "g:'$p'")).Count
    if ($count -gt 0) { Write-Host "${p}: $count"; $total2 += $count }
}
Write-Host "Total distritos con ganador: $total2"
