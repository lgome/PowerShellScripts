
#variables
$command = "echo hola m"
$command1= "ps aux |grep /etc/init.d"
$command2= 'mkdir test5'
$servername = 'PPRCR1TREATVM01'
$username = 'lgomez-admin@aligntech'
$password = 'La8583*/'
$plinkpath = "C:\Program Files\PuTTY\"
#Execute SSH command
&($plinkpath + "plink.exe") -pw $password $username@$servername $command 
$commandoutput = echo y | &($plinkpath + "plink.exe") -pw $password $username@$servername $command1