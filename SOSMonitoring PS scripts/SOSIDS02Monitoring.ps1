$SQLServer = "DEVCR1BKYAPP02\SQLEXPRESS"
$db1 = "SOSserversStatus"
$table = "SOSMonitoring"



$e=plink -ssh lgomez@prdus2mesids02 -pw Qw6666*/  "sh /home/lgomez/scripts/wdstatus.sh"
$update_data = "UPDATE $table SET IsRunning = '$e' WHERE ProcessName = 'watchdog'"
Invoke-Sqlcmd -ServerInstance $SQLServer -Database $db1 -Query $update_data

$e=plink -ssh lgomez@prdus2mesids02 -pw Qw6666*/  "sh /home/lgomez/scripts/wdmepstatus.sh"
$update_data = "UPDATE $table SET IsRunning = '$e' WHERE ProcessName = 'watchdog-sos-MESEventPublisher'"
Invoke-Sqlcmd -ServerInstance $SQLServer -Database $db1 -Query $update_data

$e=plink -ssh lgomez@prdus2mesids02 -pw Qw6666*/  "sh /home/lgomez/scripts/kafkstatus.sh"
$update_data = "UPDATE $table SET IsRunning = '$e' WHERE ProcessName = 'SosMesCorp_Kafka_Utility'"
Invoke-Sqlcmd -ServerInstance $SQLServer -Database $db1 -Query $update_data

$e=plink -ssh lgomez@prdus2mesids02 -pw Qw6666*/  "sh /home/lgomez/scripts/ReckCnstatus.sh"
$update_data = "UPDATE $table SET IsRunning = '$e' WHERE ProcessName = 'SosTPFORGE_ReClinCheck_CN'"
Invoke-Sqlcmd -ServerInstance $SQLServer -Database $db1 -Query $update_data

$e=plink -ssh lgomez@prdus2mesids02 -pw Qw6666*/  "sh /home/lgomez/scripts/ddtrqstatus.sh"
$update_data = "UPDATE $table SET IsRunning = '$e' WHERE ProcessName = 'SosTPCOMPUTE_AutoDDTReq'"
Invoke-Sqlcmd -ServerInstance $SQLServer -Database $db1 -Query $update_data

$e=plink -ssh lgomez@prdus2mesids02 -pw Qw6666*/  "sh /home/lgomez/scripts/ddtrq1status.sh"
$update_data = "UPDATE $table SET IsRunning = '$e' WHERE ProcessName = 'SosTPCOMPUTE_AutoDDTReq1'"
Invoke-Sqlcmd -ServerInstance $SQLServer -Database $db1 -Query $update_data

$e=plink -ssh lgomez@prdus2mesids02 -pw Qw6666*/  "sh /home/lgomez/scripts/scansgstatus.sh"
$update_data = "UPDATE $table SET IsRunning = '$e' WHERE ProcessName = 'SosScanSegResp'"
Invoke-Sqlcmd -ServerInstance $SQLServer -Database $db1 -Query $update_data

$e=plink -ssh lgomez@prdus2mesids02 -pw Qw6666*/  "sh /home/lgomez/scripts/forgeCNstatus.sh"
$update_data = "UPDATE $table SET IsRunning = '$e' WHERE ProcessName = 'TPFORGE_ClinCheckEvent_CN'"
Invoke-Sqlcmd -ServerInstance $SQLServer -Database $db1 -Query $update_data

$e=plink -ssh lgomez@prdus2mesids02 -pw Qw6666*/  "sh /home/lgomez/scripts/ccevtpublstatus.sh"
$update_data = "UPDATE $table SET IsRunning = '$e' WHERE ProcessName = 'SosTPFORGE_CCEventPublisher'"
Invoke-Sqlcmd -ServerInstance $SQLServer -Database $db1 -Query $update_data

$e=plink -ssh lgomez@prdus2mesids02 -pw Qw6666*/  "sh /home/lgomez/scripts/scansegreqstatus.sh"
$update_data = "UPDATE $table SET IsRunning = '$e' WHERE ProcessName = 'SosScanSegReq'"
Invoke-Sqlcmd -ServerInstance $SQLServer -Database $db1 -Query $update_data

$e=plink -ssh lgomez@prdus2mesids02 -pw Qw6666*/  "sh /home/lgomez/scripts/scanseg2status.sh"
$update_data = "UPDATE $table SET IsRunning = '$e' WHERE ProcessName = 'SosScanSegReq2'"
Invoke-Sqlcmd -ServerInstance $SQLServer -Database $db1 -Query $update_data

$e=plink -ssh lgomez@prdus2mesids02 -pw Qw6666*/  "sh /home/lgomez/scripts/scanseg3status.sh"
$update_data = "UPDATE $table SET IsRunning = '$e' WHERE ProcessName = 'SosScanSegReq3'"
Invoke-Sqlcmd -ServerInstance $SQLServer -Database $db1 -Query $update_data

$e=plink -ssh lgomez@prdus2mesids02 -pw Qw6666*/  "sh /home/lgomez/scripts/scanseg4status.sh"
$update_data = "UPDATE $table SET IsRunning = '$e' WHERE ProcessName = 'SosScanSegReq4'"
Invoke-Sqlcmd -ServerInstance $SQLServer -Database $db1 -Query $update_data

$e=plink -ssh lgomez@prdus2mesids02 -pw Qw6666*/  "sh /home/lgomez/scripts/scanseg5status.sh"
$update_data = "UPDATE $table SET IsRunning = '$e' WHERE ProcessName = 'SosScanSegReq5'"
Invoke-Sqlcmd -ServerInstance $SQLServer -Database $db1 -Query $update_data

$e=plink -ssh lgomez@prdus2mesids02 -pw Qw6666*/  "sh /home/lgomez/scripts/autoddtrspstatus.sh"
$update_data = "UPDATE $table SET IsRunning = '$e' WHERE ProcessName = 'SosTPCOMPUTE_AutoDDTResp'"
Invoke-Sqlcmd -ServerInstance $SQLServer -Database $db1 -Query $update_data

$e=plink -ssh lgomez@prdus2mesids02 -pw Qw6666*/  "sh /home/lgomez/scripts/wdReckstatus.sh"
$update_data = "UPDATE $table SET IsRunning = '$e' WHERE ProcessName = 'watchdog-TPForgeReclincheck'"
Invoke-Sqlcmd -ServerInstance $SQLServer -Database $db1 -Query $update_data
