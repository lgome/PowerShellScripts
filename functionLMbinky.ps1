function Check-logs () {

	$hostname = '##SYSTEM.SYSNAME##'
	cd \\$hostname"\\C$\\CFBinkyServer\\jboss-4.2.3.GA\server\default\logs"
    
	$a=(Select-String -Path cf.log -Pattern 'failed to get messsage from BaseConnectionSettings' | Measure-Object -Line).Lines
	$b = (Select-String -Path cf.log -Pattern 'Caused by: java.lang.OutOfMemoryError: Java heap space' | Measure-Object -Line).Lines
	$c = (Select-String -Path cf.log -Pattern 'error while sending message: Cannot send a message to the JMS server' | Measure-Object -Line).Lines
	
 


	if ($a -or $b -or $c -gt 0){
    
    	return 1
    	#Restart-Service -Name CFBINKYSERVER

	} elseif ($a -or $b -or $c -eq 0) {

    	return 0 
	}

	else{
  
    	echo 'cant reach logs' 
  	}
        
}
    	


Check-logs


function checkurl (){
$url = "http://prdus2bkyapp04:8080/cf/welcome.action"
 
try
{
    $Response = Invoke-WebRequest -Uri $url
    
    $StatusCode = $Response.StatusCode
    $StatusCode
} catch {
    $StatusCode = $_.Exception.Response.StatusCode.value__
}


if ($StatusCode -eq 200){
return 0
 }

else {
return 1
 }
 
}

checkurl


function checkurl(){
$url = "http://prdus2bkyapp01:8080/cf/welcome.action"
$params = @{
    Param1 = "SECTION"
    Param2 = "OK"
}
 
$response = Invoke-WebRequest -Uri $url -Method POST -Body $params
 
# Display the response content
#$response.Content.Contains($params.Param1)
if ($? -eq "True")
{return 0}
else 
{return 1}
}

checkurl