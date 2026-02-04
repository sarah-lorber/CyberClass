function logParse() {
$table = @()
$list = Get-Content C:\xampp\apache\logs\access.log
for ($i = 0; $i -lt $list.Length; $i++) { 
$line = ($list[$i] -Split(' '));
$table += [pscustomobject]@{"IP" = $line[0];
                            "Time" = $line[3];
                            "Method" = $line[5];
                            "Page" = $line[6];
                            "Protocol" = $line[7];
                            "Response" = $line[8];
                            "Referrer" = $line[10];
                                    }}
$table
}
logParse