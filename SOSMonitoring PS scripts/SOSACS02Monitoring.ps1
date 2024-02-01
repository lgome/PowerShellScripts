$SQLServer = "DEVCR1BKYAPP02\SQLEXPRESS"
$db1 = "SOSserversStatus"
$table = "SOSMonitoring"
#$create_table = "CREATE TABLE Results (SOS varchar(15), status VARCHAR(10))"
#$insert_data = "INSERT INTO Results(SOS, status) VALUES ('STP','$h')"
#$update_data = "UPDATE Results SET status = '$e' WHERE SOS = 'STP'"
#$delete_data = "DELETE FROM Results WHERE SOS = 'STP'"
#$select_data = "SELECT * FROM Results"

#Invoke-Sqlcmd -ServerInstance $SQLServer -Database $db1 -Query $create_table


$e=plink -ssh lgomez@$prdus2mesacs02 -pw Qw6666*/  "sh /home/lgomez/scripts/ARCNstatus.sh"
$update_data = "UPDATE $table SET IsRunning = '$e' WHERE ProcessName = 'SosAssetReplicationCN'"
Invoke-Sqlcmd -ServerInstance $SQLServer -Database $db1 -Query $update_data

$e=plink -ssh lgomez@prdus2mesacs02 -pw Qw6666*/  "sh /home/lgomez/scripts/AutoSegstatus.sh"
$update_data = "UPDATE $table SET IsRunning = '$e' WHERE ProcessName = 'SosAutoSegmentation'"
Invoke-Sqlcmd -ServerInstance $SQLServer -Database $db1 -Query $update_data


$e=plink -ssh lgomez@prdus2mesacs02 -pw Qw6666*/  "sh /home/lgomez/scripts/CQAstatus.sh"
$update_data = "UPDATE $table SET IsRunning = '$e' WHERE ProcessName = 'SosCQA'"
Invoke-Sqlcmd -ServerInstance $SQLServer -Database $db1 -Query $update_data

$e=plink -ssh lgomez@prdus2mesacs02 -pw Qw6666*/  "sh /home/lgomez/scripts/PreIPLstatus.sh"
$update_data = "UPDATE $table SET IsRunning = '$e' WHERE ProcessName = 'SosPre_IPL_TFU'"
Invoke-Sqlcmd -ServerInstance $SQLServer -Database $db1 -Query $update_data

$e=plink -ssh lgomez@prdus2mesacs02 -pw Qw6666*/  "sh /home/lgomez/scripts/TFUCNstatus.sh"
$update_data = "UPDATE $table SET IsRunning = '$e' WHERE ProcessName = 'SosTreatFileUploadCN'"
Invoke-Sqlcmd -ServerInstance $SQLServer -Database $db1 -Query $update_data

$e=plink -ssh lgomez@prdus2mesacs02 -pw Qw6666*/  "sh /home/lgomez/scripts/TPSIPLstatus.sh"
$update_data = "UPDATE $table SET IsRunning = '$e' WHERE ProcessName = 'SosTPS_IPLEvent'"
Invoke-Sqlcmd -ServerInstance $SQLServer -Database $db1 -Query $update_data 


