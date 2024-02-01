


# Define the username and password for the target user
$username = "aligntech\PRCFUSER"
$password = ConvertTo-SecureString "xts@$mKLGjmW&hEy=B!$fmt5x" -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential ($username, $password)

$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

<#if (-not $isAdmin) {
    Start-Process powershell.exe -Verb runAs "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`""
    Exit
}
#                    Direccion de el csv de las compus
$targetComputers = Import-Csv "C:\Users\lgomez\Downloads\servers.csv" | Select-Object -ExpandProperty ComputerName

#folder destino
$dest = "c$\Users\prcfuser\Desktop"

#Folder base
$Source = "C:\Users\lgomez\Downloads\PRD_USW2_15.26.0.15_Rules_33"

foreach ($computer in $targetComputers) {
    $targetPath = "\\$computer\$dest"
    if (-not (Test-Path $Source)) {
        Write-Error "The source folder '$Source' does not exist."
        continue
    }
    
    try {
        # Use the Start-Process cmdlet to run the Copy-Item cmdlet as the target user
        Start-Process powershell.exe -Credential $credential -ArgumentList "-Command Copy-Item -Path '$Source' -Destination '$targetPath' -Recurse -Force -Container"
        Write-Host "Successfully copied folder to computer '$computer'."
    }
    catch {
        Write-Error "Error copying folder to computer '$computer': $_"
    }
}
#>




# List of target servers

$servers = Import-Csv "C:\Users\lgomez\Downloads\servers.csv" | Select-Object -ExpandProperty ComputerName

 

# Source folder path

$sourceFolder = "C:\Path\to\source\folder"

 

# Destination folder path

$destinationFolder = "C:\Path\to\destination\folder"

 

# Local user credentials

$username = "local_user"

$password = ConvertTo-SecureString "password" -AsPlainText -Force

$credentials = New-Object System.Management.Automation.PSCredential($username, $password)

 

# Loop through each server and copy the folder using specific local user credentials

foreach ($server in $servers) {

    $destinationPath = "\\$server\$destinationFolder"

    $copyCommand = "robocopy $sourceFolder $destinationPath /E /ZB /COPYALL /R:3 /W:5 /U:`"$($credentials.UserName)`" /P:`"$($credentials.GetNetworkCredential().Password)`""

    Invoke-Expression -Command $copyCommand

}


