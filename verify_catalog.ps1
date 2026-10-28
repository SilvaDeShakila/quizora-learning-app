$original = Get-Content ".\lib\data\learning_catalog_data.dart" -Raw
$preview = Get-Content ".\lib\data\learning_catalog_preview.dart" -Raw

$ids = [regex]::Matches($original, "id:\s*'([^']+)'") | ForEach-Object { $_.Groups[1].Value }
$missing = @($ids | Where-Object { $preview -notmatch ("id:\s*'" + [regex]::Escape($_) + "'") })

"Original question IDs: $($ids.Count)"
"IDs missing from preview: $($missing.Count)"
if ($missing.Count -gt 0) { $missing } else { "All original question IDs are present in preview." }
