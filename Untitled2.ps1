cd C:\CFBinkyServer\jboss-4.2.3.GA\server\default\logs

Select-String -Path cf.log -Pattern 'Caused by: java.lang.OutOfMemoryError: Java heap space' | Measure-Object -Line

 

$a=(Select-String -Path cf.log -Pattern 'failed to get messsage from BaseConnectionSettings' | Measure-Object -Line).Lines
$b = (Select-String -Path cf.log -Pattern 'Caused by: java.lang.OutOfMemoryError: Java heap space' | Measure-Object -Line).Lines
$c = (Select-String -Path cf.log -Pattern 'error while sending message: Cannot send a message to the JMS server' | Measure-Object -Line).Lines



if ($a -or $b -or $c -gt 0){
    echo $a
    echo 'hi'
    Restart-Service -Name CFBINKYSERVER

} elseif ($a -or $b -or $c -eq 0) {

    echo 'all good' 1> /dev/null
}

else{
  
    echo 'blabla' 2> /dev/null
  }




<#Select-String -Path "C:\Users\PRCFUSER\Downloads\cf.log.65" -Pattern 'failed to get messsage from BaseConnectionSettings' | Measure-Object -Line

error while sending message: Cannot send a message to the JMS server

Select-String -Path "C:\Users\PRCFUSER\Downloads\cf.log.67" -Pattern 'error while sending message: Cannot send a message to the JMS server' | Measure-Object -Line

Select-String -Path "C:\Users\PRCFUSER\Downloads\cf.log.42" -Pattern 'Caused by: java.lang.OutOfMemoryError: Java heap space' | Measure-Object -Line#>