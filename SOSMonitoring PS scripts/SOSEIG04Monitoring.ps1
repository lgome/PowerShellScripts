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


$e=plink -ssh lgomez@prdus2meseig04 -pw Qw6666*/  "sh /home/lgomez/scripts/perrostatus.sh"
$update_data = "UPDATE $table SET IsRunning = '$e' WHERE ProcessName = 'watchdog'"
Invoke-Sqlcmd -ServerInstance $SQLServer -Database $db1 -Query $update_data


$e=plink -ssh lgomez@prdus2meseig04 -pw Qw6666*/  "sh /home/lgomez/scripts/confevent.sh"
$update_data = "UPDATE $table SET IsRunning = '$e' WHERE ProcessName = 'SosMiiConfirm_event'"
Invoke-Sqlcmd -ServerInstance $SQLServer -Database $db1 -Query $update_data


#$e=plink -ssh lgomez@prdus2meseig03 -pw  "sh /home/lgomez/scripts/SOS.sh"
#$insert_data = "INSERT INTO Results(SOS, status) VALUES ('RestScrString','$e')"
#Invoke-Sqlcmd -ServerInstance $SQLServer -Database $db1 -Query $insert_data
