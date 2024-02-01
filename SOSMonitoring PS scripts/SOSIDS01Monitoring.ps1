$SQLServer = "DEVCR1BKYAPP02\SQLEXPRESS"
$db1 = "SOSserversStatus"
$table = "SOSMonitoring"



$e=plink -ssh lgomez@prdus2mesids01 -pw Qw6666*/  "sh /home/lgomez/scripts/mep1status.sh"
$update_data = "UPDATE $table SET IsRunning = '$e' WHERE ProcessName = 'MEPSOS1'"
Invoke-Sqlcmd -ServerInstance $SQLServer -Database $db1 -Query $update_data

$e=plink -ssh lgomez@prdus2mesids01 -pw Qw6666*/  "sh /home/lgomez/scripts/mep2status.sh"
$update_data = "UPDATE $table SET IsRunning = '$e' WHERE ProcessName = 'MEPSOS2'"
Invoke-Sqlcmd -ServerInstance $SQLServer -Database $db1 -Query $update_data

$e=plink -ssh lgomez@prdus2mesids01 -pw Qw6666*/  "sh /home/lgomez/scripts/mep3status.sh"
$update_data = "UPDATE $table SET IsRunning = '$e' WHERE ProcessName = 'MEPSOS3'"
Invoke-Sqlcmd -ServerInstance $SQLServer -Database $db1 -Query $update_data
