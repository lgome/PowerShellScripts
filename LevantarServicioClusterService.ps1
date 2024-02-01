clear-host
$svc=Get-Service
$i
$i=1
foreach($service in $svc)
{
if ($svc[$i].name -eq "Cluster Service")
    {
        if($svc[$i].status -eq "Stopped")
        {
            start-service -name $svc[$i].Name -PassThru
            echo $svc[$i].Name "service started"
        }
        if($svc[$i].status -eq "Running")
        {    
            echo $svc[$i].Name "already running"
        }
    }
$i++
}

##Read-Host -Prompt "Press Enter"s