
Import-Module Posh-SSH
$setsession = New-SSHSession -ComputerName "10.107.20.12" -AcceptKey -Credential 'lgomez-admin@aligntech.com'
Invoke-SSHCommand -SessionId 0 -Command 'ls'