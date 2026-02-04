. (Join-Path $PSScriptRoot apachelogs2.ps1)

clear

$tableRecords = logParse
Write-Host ($tableRecords | Format-Table -AutoSize | Out-String)
$tableRecordsAgain = logParse
Write-Host ($tableRecordsAgain | Where-Object {($_.Page -contains "page2.html") -and ($_.Referrer -contains "index.html")} | Format-Table | Out-String)