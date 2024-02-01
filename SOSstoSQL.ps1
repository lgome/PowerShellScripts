
$SQLServer = "LGOMEZ-L1\SQLEXPRESS"
$db1 = "SOS"
#$create_table = "CREATE TABLE Results (SOS varchar(15), status VARCHAR(10))"
#$h=echo 'hOLA'
#$insert_data = "INSERT INTO Results(SOS, status) VALUES ('STP','$h')"
#$update_data = "UPDATE Results SET status = '$e' WHERE SOS = 'STP'"
#$delete_data = "DELETE FROM Results WHERE SOS = 'STP'"
#$select_data = "SELECT * FROM Results"

#Invoke-Sqlcmd -ServerInstance $SQLServer -Database $db1 -Query $create_table


$e=plink -ssh lgomez@prdus2mesacs01 -pw Qw6666*/  "sh /home/lgomez/scripts/SOS.sh"

$update_data = "UPDATE Results SET status = '$e' WHERE SOS = 'STP'"
Invoke-Sqlcmd -ServerInstance $SQLServer -Database $db1 -Query $update_data

$e=plink -ssh lgomez@prdus2mesamq01 -pw Qw6666*/  "sh /home/lgomez/scripts/SOS.sh"

$update_data = "UPDATE Results SET status = '$e' WHERE SOS = 'activemq'"
Invoke-Sqlcmd -ServerInstance $SQLServer -Database $db1 -Query $update_data

$e=plink -ssh lgomez@prdus2mesamq02 -pw Qw6666*/  "sh /home/lgomez/scripts/SOS.sh"

$update_data = "UPDATE Results SET status = '$e' WHERE SOS = 'activemq'"
Invoke-Sqlcmd -ServerInstance $SQLServer -Database $db1 -Query $update_data

$e=plink -ssh lgomez@prdpl1scanop01 -pw Qw6666*/  "sh /home/lgomez/scripts/SOS.sh"

$update_data = "UPDATE Results SET status = '$e' WHERE SOS = 'SosScanUpload'"
Invoke-Sqlcmd -ServerInstance $SQLServer -Database $db1 -Query $update_data

$e=plink -ssh lgomez@prdmx1scanop01 -pw Qw6666*/  "sh /home/lgomez/scripts/SOS.sh"

$update_data = "UPDATE Results SET status = '$e' WHERE SOS = 'SosScanUpload'"
Invoke-Sqlcmd -ServerInstance $SQLServer -Database $db1 -Query $update_data

#$e=plink -ssh lgomez@prdus2meseig03 -pw  "sh /home/lgomez/scripts/SOS.sh"
#$insert_data = "INSERT INTO Results(SOS, status) VALUES ('RestScrString','$e')"
#Invoke-Sqlcmd -ServerInstance $SQLServer -Database $db1 -Query $insert_data
