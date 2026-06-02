$content = Get-Content "comparativo_dip_ayu_2024.html" -Raw

# Count all municipio entries (id:'NNN')
$allIds = [regex]::Matches($content, "id:'(\d+)'")
Write-Host "Total entries with id in comparativo: $($allIds.Count)"

# Find last 5 IDs
Write-Host "Last 5 IDs:"
for ($i = [Math]::Max(0, $allIds.Count-5); $i -lt $allIds.Count; $i++) {
    Write-Host "  $($allIds[$i].Groups[1].Value)"
}

# Count push blocks
$pushCount = ([regex]::Matches($content, "municipios\.push")).Count
Write-Host "Push blocks: $pushCount"

# Find last municipio id specifically
$munIds = [regex]::Matches($content, "id:'(\d{3})',n:'")
Write-Host "Municipio entries (id:'NNN',n:'): $($munIds.Count)"
if ($munIds.Count -gt 0) {
    Write-Host "Last municipio ID: $($munIds[$munIds.Count-1].Groups[1].Value)"
}
