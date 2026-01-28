. (Join-Path $PSScriptRoot functionsandeventlogs.ps1)

clear

$loginoutsTable = getLoginoutLogs 15
$loginoutsTable
$startsshutsTable = getCompStartStopLogs 25
$startsshutsTable