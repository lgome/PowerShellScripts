$ServerInstance = 'prdus2mesactsql'
$Database = 'MES_Production'

$Query = 'SELECT TOP 1 DATEDIFF(mi,process_start_time,GETDATE())
                         FROM MES_Production.dbo.XFR_EXTRACT_LOG xel WITH(NOLOCK)
                        ORDER BY process_start_time DESC'

$LT=Invoke-Sqlcmd -ServerInstance $ServerInstance -Database $Database -Username mes -Password $credential.GetNetworkCredential().Password -Query $Query
$K=$LT.ItemArray[0]

Write-Output "Current value of LT is: " $K > C:\Users\lgomez-admin\Documents\LTtest.log