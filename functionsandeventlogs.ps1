function getLoginoutLogs($daysBack){
$loginouts = Get-EventLog System -Source Microsoft-Windows-Winlogon -After (Get-Date).AddDays(-1*$daysBack)

$loginoutsTable = @()
for($i=0; $i -lt $loginouts.Count; $i++) {
$event = ""
if($loginouts[$i].InstanceId -eq 7001){$event = "Logon"}
if($loginouts[$i].InstanceId -eq 7002){$event = "Logoff"}
$user = $loginouts[$i].ReplacementStrings[1]
$userName = (New-Object System.Security.Principal.SecurityIdentifier $loginouts[$i].ReplacementStrings[1]).Translate([System.Security.Principal.NTAccount])
$loginoutsTable += [pscustomobject]@{"Time" = $loginouts[$i].TimeWritten;
                                     "Id" = $loginouts[$i].InstanceId;
                                     "Event" = $event;
                                     "User" = $userName;
}
}

return $loginoutsTable
}

function getCompStartStopLogs($daysBack){
$logupdowns = Get-EventLog System -After (Get-Date).AddDays(-$daysBack) | Where-Object {$_.EventId -eq 6005 -or $_.EventID -eq 6006 }

$logupdownsTable = @()
for($j=0; $j -lt $logupdowns.Count; $j++) {
$event = ""
if($logupdowns[$j].EventId -eq 6005){$event = "Startup"}
if($logupdowns[$j].EventId -eq 6006){$event = "Shutdown"}
$logupdownsTable += [pscustomobject]@{"Time" = $logupdowns[$j].TimeWritten;
                                     "Id" = $logupdowns[$j].EventId;
                                     "Event" = $event;
                                     "User" = "System";
}
}

return $logupdownsTable
}