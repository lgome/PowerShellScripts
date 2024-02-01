cd "C:\Program Files\PuTTY\" 


<#.\plink.exe  -ssh jbossadmin@10.10.154.178 -pw '@ligner123' "runSos"#>


$ServerList= @('prdus2mesapp19', 'prdus2mesapp20', 'prdus2mesapp21', 'prdus2mesapp22', 'prdus2mesapp23', 'prdus2mesapp24', <#'prdus2mesapp07'#>, 'prdus2mesapp25', 'prdus2mesapp26', 'prdus2mesapp27', 'prdus2mesapp28', 'prdus2mesapp29', 'prdus2mesapp30','prdus2mesapp31', 'prdus2mesapp32', 'prdus2mesweb12', 'prdus2mesweb13', 'prdus2mesweb14', 'prdus2mesweb15', 'prdus2mesweb16', 'prdus2mesweb17', 'prdus2mesweb18', 'prdus2mesweb19', 'prdus2mesweb20', 'prdus2mesweb21', 'prdus2mesweb22'<#, 'prdus2mesamq01', 'prdus2mesamq02'#>)

foreach ($ServerName in $ServerList){

  Write-Host $ServerName
  .\plink.exe -ssh jbossadmin@$ServerName -pw '@ligner123' -batch "pgrep -fl jboss | grep 'standalone'" <#| Out-File "C:\Users\$env:USERNAME\Documents\prototipo.txt" -Append#>
  .\plink.exe -ssh jbossadmin@$ServerName -pw '@ligner123' -batch "df -h"
}