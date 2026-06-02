$content = Get-Content "datos_integral.js" -Raw

# Count DIP wins
$dip4T = ([regex]::Matches($content, "g:'4T'[^}]*?tv:\d+[^}]*?ln:\d+[^}]*?part")).Count
$dipVA = ([regex]::Matches($content, "g:'VA'[^}]*?tv:\d+[^}]*?ln:\d+[^}]*?part")).Count
$dipMC = ([regex]::Matches($content, "g:'MC'[^}]*?tv:\d+[^}]*?ln:\d+[^}]*?part")).Count

# Better approach: count in DISTRITOS section only
$distStart = $content.IndexOf("const DISTRITOS=")
$munStart = $content.IndexOf("const MUNICIPIOS=")

$distSection = $content.Substring($distStart, $munStart - $distStart)
$munSection = $content.Substring($munStart)

$dist4T = ([regex]::Matches($distSection, ",g:'4T',")).Count
$distVA = ([regex]::Matches($distSection, ",g:'VA',")).Count
$distMC = ([regex]::Matches($distSection, ",g:'MC',")).Count

$mun4T = ([regex]::Matches($munSection, ",g:'4T',")).Count
$munVA = ([regex]::Matches($munSection, ",g:'VA',")).Count
$munMC = ([regex]::Matches($munSection, ",g:'MC',")).Count

Write-Host "=== DISTRITOS (DIP) ==="
Write-Host "4T: $dist4T"
Write-Host "VA: $distVA"
Write-Host "MC: $distMC"
Write-Host "Total: $($dist4T + $distVA + $distMC)"

Write-Host ""
Write-Host "=== MUNICIPIOS (AYU) ==="
Write-Host "4T: $mun4T"
Write-Host "VA: $munVA"
Write-Host "MC: $munMC"
Write-Host "Total: $($mun4T + $munVA + $munMC)"
