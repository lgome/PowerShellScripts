$Folder = 'C:\Program Files\Align\CF\ClientApps\BinkyConciergeBundle - Copy'
$Folder1 = 'C:\ProgramData\Align\BinkyConcierge - Copy'
$Folder2 = 'C:\ProgramData\Align\BinkyApplication - Copy'
$Folder3 = 'C:\ProgramData\Align\BinkyApplication\temp'
$Folder4 = 'C:\ProgramData\Align\BinkyApplication\temp_input'
$Folder5 = 'C:\ProgramData\Align\BinkyApplication\test_input'
$File = 'C:\Program Files\Align\CF\ClientApps\BinkyConciergeBundle\bin\Rules.json'
$start_time = Get-Date

#If a copy of the folder C:\Program Files\Align\CF\ClientApps\BinkyConciergeBundle already exists, delete it and create a new copy, including subfolders and files
"Test to see if folder [$Folder]  exists"
if (Test-Path -Path $Folder) {
    "Folder [$Folder] exists, removing folder" >> log.txt
    Remove-Item $Folder -Recurse
    "creating a copy of [$Folder]" >> log.txt
    Copy-Item 'C:\Program Files\Align\CF\ClientApps\BinkyConciergeBundle' $Folder -Recurse
    Start-Sleep -Seconds 2
    echo "Copy created"
}
 else {
    "Folder [$Folder] doesn't exist, creating a copy"
    Copy-Item 'C:\Program Files\Align\CF\ClientApps\BinkyConciergeBundle' $Folder -Recurse
    Start-Sleep -Seconds 2
    echo "Copy created"
}

#If a copy of the folder C:\ProgramData\Align\BinkyConcierge already exists, delete it and create a new copy, including subfolders and files
"Test to see if folder [$Folder1]  exists"
if (Test-Path -Path $Folder1) {
    "Folder [$Folder1] exists, removing folder"
    Remove-Item $Folder1 -Recurse
    "creating a copy of [$Folder1]"
    Copy-Item 'C:\ProgramData\Align\BinkyConcierge' $Folder1 -Recurse
    Start-Sleep -Seconds 2
    echo "Copy created"
}
 else {
    "Folder [$Folder1] doesn't exist, creating a copy"
    Copy-Item 'C:\ProgramData\Align\BinkyConcierge' $Folder1 -Recurse
    Start-Sleep -Seconds 2
    echo "Copy created"
}

#If a copy of the folder C:\ProgramData\Align\BinkyApplication already exists, delete it and create a new copy, including subfolders and files
"Test to see if folder [$Folder2]  exists"
if (Test-Path -Path $Folder2) {
    "Folder [$Folder2] exists, removing folder"
    Remove-Item $Folder2 -Recurse
    "creating a copy of [$Folder2]"
    Copy-Item 'C:\ProgramData\Align\BinkyApplication' $Folder2 -Recurse
    Start-Sleep -Seconds 2
    echo "Copy created"
}
 else {
    "Folder [$Folder2] doesn't exist, creating a copy"
    Copy-Item 'C:\ProgramData\Align\BinkyApplication' $Folder2 -Recurse
    Start-Sleep -Seconds 2
    echo "Copy created"
}

Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"
Read-Host -Prompt "Press Enter"


#Check if folder 'C:\ProgramData\Align\BinkyApplication\temp' exists and shows message
"Test to see if folder [$Folder3]  exists"
if (Test-Path -Path $Folder3) {
    "Folder [$Folder3] exists"  
}
 else {
    "Folder [$Folder3] does not exist"
}

#Check if folder 'C:\ProgramData\Align\BinkyApplication\temp_input' exists and shows message
"Test to see if folder [$Folder4]  exists"
if (Test-Path -Path $Folder4) {
    "Folder [$Folder4] exists" 
}
 else {
    "Folder [$Folder4] does not exist"
}

#Check if folder 'C:\ProgramData\Align\BinkyApplication\test_input' exists and shows message
"Test to see if folder [$Folder5]  exists"
if (Test-Path -Path $Folder5) {
    "Folder [$Folder5] exists"   
}
 else {
    "Folder [$Folder5] does not exist"
}

#For loop implemented in case more services need to be included in the future
"Check if Cluster Service is up and running"
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

#If the file 'Rules.json' exists, then proceed to delete it and show message
if (Test-Path -Path $file -PathType Leaf) {
     try {
         $null = Remove-Item $file -Force -ErrorAction Stop
         Write-Host "The file [$file] has been deleted."
     }
     catch {
         throw $_.Exception.Message
     }
 }
# If the file already exists, show  message and do nothing.
 else {
     Write-Host "Great! [$file] does not exist."
 }

#Prompt the user to press Return keyboard after powershell script execution finished and then closes
Read-Host -Prompt "Press Enter"