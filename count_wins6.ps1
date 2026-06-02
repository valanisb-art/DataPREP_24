$content = Get-Content "comparativo_dip_ayu_2024.html" -Raw

# Count all municipio entries across all blocks
$parties = @('MORENA','PAN','PRI','MC','PVEM','PT','PRD','NAEM')

Write-Host "=== AYU Victorias por partido (todos los bloques) ==="
$total = 0
foreach ($p in $parties) {
    $count = ([regex]::Matches($content, "g:'$p',vg:")).Count
    if ($count -gt 0) { 
        Write-Host "$p`: $count"
        $total += $count
    }
}
Write-Host "Total municipios: $total"

Write-Host ""
Write-Host "=== DIP Victorias por partido ==="
# Distritos are in a separate array
$distStart = $content.IndexOf("const distritos = [")
$distEnd = $content.IndexOf("];", $distStart) + 2
$distSection = $content.Substring($distStart, $distEnd - $distStart)
$dtotal = 0
foreach ($p in $parties) {
    $count = ([regex]::Matches($distSection, "g:'$p'")).Count
    if ($count -gt 0) { 
        Write-Host "$p`: $count"
        $dtotal += $count
    }
}
Write-Host "Total distritos: $dtotal"
