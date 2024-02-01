
#variables
$command = 'sudo su -'
$command1= 'ps aux | grep activemq'
$command2= 'cd /opt/FTPC_LiveTransfer'
$servername = 'prdus2mesapp09'
$username = 'lgomez'
$password = '@ligner123'
$plinkpath = "C:\Program Files\PuTTY\"
#Execute SSH command
&($plinkpath + "plink.exe") -pw $password $username@$servername $command $command2