#Get-Process | Where-Object {$_.ProcessName -like 'C*'}
#Get-Process | Where-Object {$_.Path -notlike '*system32*'}
#Get-Service | Where-Object {$_.Status -eq 'Stopped'} | Sort-Object Name | Export-Csv -Path 'theStopped.csv'
$chromeYes = Get-Process -Name chrome
if (-not $chromeYes) {Start-Process "chrome.exe" "https://www.champlain.edu"}
else {Stop-Process -Name chrome}