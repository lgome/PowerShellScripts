$SQLServer = "DEVCR1BKYAPP02\SQLEXPRESS"
$db1 = "SOSserversStatus"
$table = "SOSMonitoring"
#$create_table = "CREATE TABLE Results (SOS varchar(15), status VARCHAR(10))"
#$h=echo 'hOLA'
#$insert_data = "INSERT INTO Results(SOS, status) VALUES ('STP','$h')"
#$update_data = "UPDATE Results SET status = '$e' WHERE SOS = 'STP'"
#$delete_data = "DELETE FROM Results WHERE SOS = 'STP'"
#$select_data = "SELECT * FROM Results"

#Invoke-Sqlcmd -ServerInstance $SQLServer -Database $db1 -Query $create_table


$e=plink -ssh lgomez@prdus2mesacs01 -pw Qw6666*/  "sh /home/lgomez/scripts/STPstatus.sh"
$update_data = "UPDATE $table SET IsRunning = '$e' WHERE ProcessName = 'STP'"
Invoke-Sqlcmd -ServerInstance $SQLServer -Database $db1 -Query $update_data

$e=plink -ssh lgomez@prdus2mesacs01 -pw Qw6666*/  "sh /home/lgomez/scripts/PurgeStatus.sh"
$update_data = "UPDATE $table SET IsRunning = '$e' WHERE ProcessName = 'SosAssetPurge'"
Invoke-Sqlcmd -ServerInstance $SQLServer -Database $db1 -Query $update_data


$e=plink -ssh lgomez@prdus2mesacs01 -pw Qw6666*/  "sh /home/lgomez/scripts/AVstatus.sh"
$update_data = "UPDATE $table SET IsRunning = '$e' WHERE ProcessName = 'SosAssetValidation'"
Invoke-Sqlcmd -ServerInstance $SQLServer -Database $db1 -Query $update_data

$e=plink -ssh lgomez@prdus2mesacs01 -pw Qw6666*/  "sh /home/lgomez/scripts/ARstatus.sh"
$update_data = "UPDATE $table SET IsRunning = '$e' WHERE ProcessName = 'SosAssetReplication'"
Invoke-Sqlcmd -ServerInstance $SQLServer -Database $db1 -Query $update_data

$e=plink -ssh lgomez@prdus2mesacs01 -pw Qw6666*/  "sh /home/lgomez/scripts/MEPstatus.sh"
$update_data = "UPDATE $table SET IsRunning = '$e' WHERE ProcessName = 'SosMESEventPublisher'"
Invoke-Sqlcmd -ServerInstance $SQLServer -Database $db1 -Query $update_data

$e=plink -ssh lgomez@prdus2mesacs01 -pw Qw6666*/  "sh /home/lgomez/scripts/MTPTFUstatus.sh"
$update_data = "UPDATE $table SET IsRunning = '$e' WHERE ProcessName = 'SosPreMTPTreatFileUpload'"
Invoke-Sqlcmd -ServerInstance $SQLServer -Database $db1 -Query $update_data

$e=plink -ssh lgomez@prdus2mesacs01 -pw Qw6666*/  "sh /home/lgomez/scripts/TreatUpstatus.sh"
$update_data = "UPDATE $table SET IsRunning = '$e' WHERE ProcessName = 'SosTreatUpload'"
Invoke-Sqlcmd -ServerInstance $SQLServer -Database $db1 -Query $update_data

$e=plink -ssh lgomez@prdus2mesacs01 -pw Qw6666*/  "sh /home/lgomez/scripts/PreSTPTFUstatus.sh"
$update_data = "UPDATE $table SET IsRunning = '$e' WHERE ProcessName = 'Pre_STP_TFU'"
Invoke-Sqlcmd -ServerInstance $SQLServer -Database $db1 -Query $update_data


#$e=plink -ssh lgomez@prdus2meseig03 -pw  "sh /home/lgomez/scripts/SOS.sh"
#$insert_data = "INSERT INTO Results(SOS, status) VALUES ('RestScrString','$e')"
#Invoke-Sqlcmd -ServerInstance $SQLServer -Database $db1 -Query $insert_data
