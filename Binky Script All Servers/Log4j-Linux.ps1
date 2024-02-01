<#
.SYNOPSIS 
Script to find Log4j information on Linux Servers

.DESCRIPTION
Script Parameters: 
    $inputFile = List of Hostnames
    $outputFileName = File name with results
    $userName = Provide Username
    $userPwd = Password
#>

param (
    # Enter the filename with server list"
    [string] $inputFile = "Hostnames.txt",
    # Filename with results
    [string] $outputFileName = "Results.txt",
    # Provide username
    [string] $userName = "arosales2",
    #pwd
    [string] $userPwd = "@ligner123"
)
$currentDirectory = Get-Location
$outputfile = "$currentDirectory\$outputfilename" 
$serverList = Get-Content -Path "$currentDirectory\$inputFile" 

$password = ConvertTo-SecureString -AsPlainText $userPwd -Force
$credential = New-Object System.Management.Automation.PSCredential -ArgumentList $userName, $password

foreach ($serverName in $serverList) {
    #Test connection on each Hostname
    if (Test-Connection -ComputerName $serverName -Quiet -count 2) {
        Write-Host "$serverName is UP"

        "========== BEGIN: $serverName ==========" | Out-File  $outputfile -Append
        Get-date | Out-File  $outputfile -Append 

        # Find Log4j config information 
        $response = plink  -ssh -t $userName@$serverName -pw $credential.GetNetworkCredential().password "echo '<<LOG4J CONFIG>>';find /  \( -path /u01* -o -path /mnt* -o -path /media*  \) -prune -false -o -name ""log4j.properties"" -exec grep ""Appender"" {} \; -print 2>/dev/null;echo"
        
        $response | Out-File $outputfile -Append
                
        "========== END: $serverName ==========" | Out-File  $outputfile -Append
        " " | Out-File  $outputfile -Append
        " " | Out-File  $outputfile -Append
    }
    else {
        Write-Host "$serverName is DOWN"
    }
}