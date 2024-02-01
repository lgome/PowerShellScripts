<# 
.NAME
    RestartPC
.DESCRIPTION
    Powershell GUI to have options to select Hours of restart. Works. May change later
#>

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$PSRestart                       = New-Object system.Windows.Forms.Form
$PSRestart.ClientSize            = New-Object System.Drawing.Point(1000,754)
$PSRestart.text                  = "Form"
$PSRestart.TopMost               = $false

$LabelMessage                    = New-Object system.Windows.Forms.Label
$LabelMessage.text               = "Your PC needs to proceed with maintenance. Please choose a time for your PC to restart."
$LabelMessage.AutoSize           = $true
$LabelMessage.width              = 25
$LabelMessage.height             = 10
$LabelMessage.location           = New-Object System.Drawing.Point(89,28)
$LabelMessage.Font               = New-Object System.Drawing.Font('Microsoft Sans Serif',11)

$SelectTime                      = New-Object system.Windows.Forms.Groupbox
$SelectTime.height               = 431
$SelectTime.width                = 948
$SelectTime.location             = New-Object System.Drawing.Point(17,66)

$cancelRestartButton             = New-Object system.Windows.Forms.Button
$cancelRestartButton.text        = "Cancel Restart"
$cancelRestartButton.width       = 129
$cancelRestartButton.height      = 35
$cancelRestartButton.location    = New-Object System.Drawing.Point(459,374)
$cancelRestartButton.Font        = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$RestartNowButton                = New-Object system.Windows.Forms.Button
$RestartNowButton.text           = "Restart Now"
$RestartNowButton.width          = 107
$RestartNowButton.height         = 35
$RestartNowButton.location       = New-Object System.Drawing.Point(323,373)
$RestartNowButton.Font           = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Label1                          = New-Object system.Windows.Forms.Label
$Label1.text                     = "ComputerName:"
$Label1.AutoSize                 = $true
$Label1.width                    = 25
$Label1.height                   = 10
$Label1.location                 = New-Object System.Drawing.Point(705,517)
$Label1.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Label2                          = New-Object system.Windows.Forms.Label
$Label2.text                     = "Time:"
$Label2.AutoSize                 = $true
$Label2.width                    = 25
$Label2.height                   = 10
$Label2.location                 = New-Object System.Drawing.Point(709,548)
$Label2.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Label3                          = New-Object system.Windows.Forms.Label
$Label3.text                     = "AM"
$Label3.AutoSize                 = $true
$Label3.width                    = 25
$Label3.height                   = 10
$Label3.location                 = New-Object System.Drawing.Point(200,180)
$Label3.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',16,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))

$Label4                          = New-Object system.Windows.Forms.Label
$Label4.text                     = "PM"
$Label4.AutoSize                 = $true
$Label4.width                    = 25
$Label4.height                   = 10
$Label4.location                 = New-Object System.Drawing.Point(678,188)
$Label4.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',16,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))

$12AM                            = New-Object system.Windows.Forms.Button
$12AM.text                       = "12AM  (Noon)"
$12AM.width                      = 100
$12AM.height                     = 40
$12AM.location                   = New-Object System.Drawing.Point(163,44)
$12AM.Font                       = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$4AM                             = New-Object system.Windows.Forms.Button
$4AM.text                        = "4AM"
$4AM.width                       = 100
$4AM.height                      = 40
$4AM.location                    = New-Object System.Drawing.Point(279,215)
$4AM.Font                        = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$6AM                             = New-Object system.Windows.Forms.Button
$6AM.text                        = "6AM"
$6AM.width                       = 100
$6AM.height                      = 40
$6AM.location                    = New-Object System.Drawing.Point(163,303)
$6AM.Font                        = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$9AM                             = New-Object system.Windows.Forms.Button
$9AM.text                        = "9AM"
$9AM.width                       = 100
$9AM.height                      = 40
$9AM.location                    = New-Object System.Drawing.Point(1,174)
$9AM.Font                        = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$10AM                            = New-Object system.Windows.Forms.Button
$10AM.text                       = "10AM"
$10AM.width                      = 100
$10AM.height                     = 40
$10AM.location                   = New-Object System.Drawing.Point(46,129)
$10AM.Font                       = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$11AM                            = New-Object system.Windows.Forms.Button
$11AM.text                       = "11AM"
$11AM.width                      = 100
$11AM.height                     = 40
$11AM.location                   = New-Object System.Drawing.Point(113,87)
$11AM.Font                       = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$1AM                             = New-Object system.Windows.Forms.Button
$1AM.text                        = "1AM"
$1AM.width                       = 100
$1AM.height                      = 40
$1AM.location                    = New-Object System.Drawing.Point(216,86)
$1AM.Font                        = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$2AM                             = New-Object system.Windows.Forms.Button
$2AM.text                        = "2AM"
$2AM.width                       = 100
$2AM.height                      = 40
$2AM.location                    = New-Object System.Drawing.Point(290,128)
$2AM.Font                        = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$3AM                             = New-Object system.Windows.Forms.Button
$3AM.text                        = "3AM"
$3AM.width                       = 100
$3AM.height                      = 40
$3AM.location                    = New-Object System.Drawing.Point(328,172)
$3AM.Font                        = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$7AM                             = New-Object system.Windows.Forms.Button
$7AM.text                        = "7AM"
$7AM.width                       = 100
$7AM.height                      = 40
$7AM.location                    = New-Object System.Drawing.Point(112,259)
$7AM.Font                        = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$8AM                             = New-Object system.Windows.Forms.Button
$8AM.text                        = "8AM"
$8AM.width                       = 100
$8AM.height                      = 40
$8AM.location                    = New-Object System.Drawing.Point(46,215)
$8AM.Font                        = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$5AM                             = New-Object system.Windows.Forms.Button
$5AM.text                        = "5AM"
$5AM.width                       = 100
$5AM.height                      = 40
$5AM.location                    = New-Object System.Drawing.Point(216,259)
$5AM.Font                        = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$12PM                            = New-Object system.Windows.Forms.Button
$12PM.text                       = "12PM (Midnight)"
$12PM.width                      = 100
$12PM.height                     = 40
$12PM.location                   = New-Object System.Drawing.Point(640,45)
$12PM.Font                       = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$1PM                             = New-Object system.Windows.Forms.Button
$1PM.text                        = "1PM"
$1PM.width                       = 100
$1PM.height                      = 40
$1PM.location                    = New-Object System.Drawing.Point(693,86)
$1PM.Font                        = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$6PM                             = New-Object system.Windows.Forms.Button
$6PM.text                        = "6PM"
$6PM.width                       = 100
$6PM.height                      = 40
$6PM.location                    = New-Object System.Drawing.Point(639,303)
$6PM.Font                        = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$3PM                             = New-Object system.Windows.Forms.Button
$3PM.text                        = "3PM"
$3PM.width                       = 100
$3PM.height                      = 40
$3PM.location                    = New-Object System.Drawing.Point(794,172)
$3PM.Font                        = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$5PM                             = New-Object system.Windows.Forms.Button
$5PM.text                        = "5PM"
$5PM.width                       = 100
$5PM.height                      = 40
$5PM.location                    = New-Object System.Drawing.Point(689,260)
$5PM.Font                        = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$2PM                             = New-Object system.Windows.Forms.Button
$2PM.text                        = "2PM"
$2PM.width                       = 100
$2PM.height                      = 40
$2PM.location                    = New-Object System.Drawing.Point(742,129)
$2PM.Font                        = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$4PM                             = New-Object system.Windows.Forms.Button
$4PM.text                        = "4PM"
$4PM.width                       = 100
$4PM.height                      = 40
$4PM.location                    = New-Object System.Drawing.Point(744,215)
$4PM.Font                        = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$7PM                             = New-Object system.Windows.Forms.Button
$7PM.text                        = "7PM"
$7PM.width                       = 100
$7PM.height                      = 40
$7PM.location                    = New-Object System.Drawing.Point(582,260)
$7PM.Font                        = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$8PM                             = New-Object system.Windows.Forms.Button
$8PM.text                        = "8PM"
$8PM.width                       = 100
$8PM.height                      = 40
$8PM.location                    = New-Object System.Drawing.Point(538,214)
$8PM.Font                        = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$9PM                             = New-Object system.Windows.Forms.Button
$9PM.text                        = "9PM"
$9PM.width                       = 100
$9PM.height                      = 40
$9PM.location                    = New-Object System.Drawing.Point(496,169)
$9PM.Font                        = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$11PM                            = New-Object system.Windows.Forms.Button
$11PM.text                       = "11PM"
$11PM.width                      = 100
$11PM.height                     = 40
$11PM.location                   = New-Object System.Drawing.Point(588,87)
$11PM.Font                       = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$10PM                            = New-Object system.Windows.Forms.Button
$10PM.text                       = "10PM"
$10PM.width                      = 100
$10PM.height                     = 40
$10PM.location                   = New-Object System.Drawing.Point(544,128)
$10PM.Font                       = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$ErrorProvider1                  = New-Object system.Windows.Forms.ErrorProvider

$ErrorProvider2                  = New-Object system.Windows.Forms.ErrorProvider

$ErrorProvider3                  = New-Object system.Windows.Forms.ErrorProvider

$LBLoutput                       = New-Object system.Windows.Forms.Label
$LBLoutput.text                  = "Output"
$LBLoutput.AutoSize              = $false
$LBLoutput.width                 = 653
$LBLoutput.height                = 215
$LBLoutput.location              = New-Object System.Drawing.Point(23,516)
$LBLoutput.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$PSRestart.controls.AddRange(@($LabelMessage,$SelectTime,$Label1,$Label2,$LBLoutput))
$SelectTime.controls.AddRange(@($cancelRestartButton,$RestartNowButton,$Label3,$Label4,$12AM,$4AM,$6AM,$9AM,$10AM,$11AM,$1AM,$2AM,$3AM,$7AM,$8AM,$5AM,$12PM,$1PM,$6PM,$3PM,$5PM,$2PM,$4PM,$7PM,$8PM,$9PM,$11PM,$10PM))

$12AM.Add_MouseClick({ RestartAt12AM })
$cancelRestartButton.Add_MouseClick({ CancelRestart })
$1AM.Add_MouseClick({ RestartAt1AM })
$2AM.Add_MouseClick({ RestartAt2AM })
$3AM.Add_MouseClick({ RestartAt3AM })
$4AM.Add_MouseClick({ RestartAt4AM })
$5AM.Add_MouseClick({ RestartAt5AM })
$6AM.Add_MouseClick({ RestartAt6AM })
$7AM.Add_MouseClick({ RestartAt7AM })
$8AM.Add_MouseClick({ RestartAt8AM })
$9AM.Add_MouseClick({ RestartAt9AM })
$10AM.Add_MouseClick({ RestartAt10AM })
$11AM.Add_MouseClick({ RestartAt11AM })
$12PM.Add_MouseClick({ RestartAt12PM })
$1PM.Add_MouseClick({ RestartAt1PM })
$2PM.Add_MouseClick({ RestartAt2PM })
$3PM.Add_MouseClick({ RestartAt3PM })
$4PM.Add_MouseClick({ RestartAt4PM })
$5PM.Add_MouseClick({ RestartAt5PM })
$6PM.Add_MouseClick({ RestartAt6PM })
$7PM.Add_MouseClick({ RestartAt7PM })
$8PM.Add_MouseClick({ RestartAt8PM })
$9PM.Add_MouseClick({ RestartAt9PM })
$10PM.Add_MouseClick({ RestartAt10PM })
$11PM.Add_MouseClick({ RestartAt11PM })
$RestartNowButton.Add_MouseClick({ RestartNow })


function RestartNow {
    $LBLOutput.text = Log-Message "Restarting in $RestartinSeconds Seconds."
    shutdown /r /t 5
    $Time2 = Get-Date -format HH:mm:ss
    $LBLOutput.text += Log-Message "Restart at $Time2 has been set."
}
function RestartAt11PM {
    CancelRestart
    $RestartAt = "11PM"
    $Time2 = "23:00:00"
    RestartCountdownTimer
    
}
function RestartAt10PM {
    CancelRestart
    $RestartAt = "10PM"
    $Time2 = "22:00:00"
    RestartCountdownTimer
}
function RestartAt9PM {
    CancelRestart
    $RestartAt = "9PM"
    $Time2 = "21:00:00"
    RestartCountdownTimer
}
function RestartAt8PM {
    CancelRestart
    $RestartAt = "8PM"
    $Time2 = "20:00:00"
    RestartCountdownTimer
}
function RestartAt7PM {
    CancelRestart
    $RestartAt = "7PM"
    $Time2 = "19:00:00"
    RestartCountdownTimer
}
function RestartAt6PM {
    CancelRestart
    $RestartAt = "6PM"
    $Time2 = "18:00:00"
    RestartCountdownTimer

}
function RestartAt5PM {
    CancelRestart
    $RestartAt = "5PM"
    $Time2 = "17:00:00"
    RestartCountdownTimer

}
function RestartAt4PM {
    CancelRestart
    $RestartAt = "4PM"
    $Time2 = "16:00:00"
    RestartCountdownTimer

}
function RestartAt3PM {
    CancelRestart
    $RestartAt = "3PM"
    $Time2 = "15:00:00"
    RestartCountdownTimer
}
function RestartAt2PM {
    CancelRestart
    $RestartAt = "2PM"
    $Time2 = "14:00:00"
    RestartCountdownTimer
}
function RestartAt1PM {
    CancelRestart
    $RestartAt = "1PM"
    $Time2 = "13:00:00"
    RestartCountdownTimer
}
function RestartAt12PM {
    CancelRestart
    $RestartAt = "12PM"
    $Time2 = "00:00:00"
    RestartCountdownTimer
}
function RestartAt11AM {
    CancelRestart
    $RestartAt = "11AM"
    $Time2 = "11:00:00"
    RestartCountdownTimer
}
function RestartAt10AM {
    CancelRestart
    $RestartAt = "10AM"
    $Time2 = "10:00:00"
    RestartCountdownTimer
}
function RestartAt9AM {
    CancelRestart
    $RestartAt = "9AM"
    $Time2 = "09:00:00"
    RestartCountdownTimer
}
function RestartAt8AM {
    CancelRestart
    $RestartAt = "8AM"
    $Time2 = "08:00:00"
    RestartCountdownTimer
}
function RestartAt7AM {
    CancelRestart
    $RestartAt = "7AM"
    $Time2 = "07:00:00"
    RestartCountdownTimer
}
function RestartAt6AM {
    CancelRestart
    $RestartAt = "6AM"
    $Time2 = "06:00:00"
    RestartCountdownTimer
}
function RestartAt5AM {
    CancelRestart
    $RestartAt = "5AM"
    $Time2 = "05:00:00"
    RestartCountdownTimer
}
function RestartAt4AM {
    CancelRestart
    $RestartAt = "4AM"
    $Time2 = "04:00:00"
    RestartCountdownTimer
}
function RestartAt3AM { 
    CancelRestart
    $RestartAt = "3AM"
    $Time2 = "03:00:00"
    RestartCountdownTimer
}
function RestartAt2AM { 
    CancelRestart
    $RestartAt = "2AM"
    $Time2 = "02:00:00"
    RestartCountdownTimer
}
function RestartAt1AM {
    CancelRestart
    $RestartAt = "1AM"
    $Time2 = "01:00:00"
    RestartCountdownTimer
}
function RestartAt12AM {
    CancelRestart
    $RestartAt = "12AM"
    $Time2 = "12:00:00"
    RestartCountdownTimer


}
function CancelRestart {
    $LBLOutput.text = ""
    $LBLOutput.text = Log-Message "Cancelling previous shutdown."
    shutdown /a
    $LBLOutput.text = Log-Message "Shutdown has been Cancelled."
    $Label2.text = Write-output "Cancelled Restart"
    
}


function Log-Message
{
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory=$true, Position=0)]
        [string]$LogMessage
    )

    Write-Output ("{0} - {1}" -f (Get-Date), " " + $LogMessage + "`r`n")
}


function RestartCountdownTimer {
    $Time1 = Get-Date -format HH:mm:ss
    
    $TimeDiff = New-TimeSpan $Time1 $Time2
    if ($TimeDiff.Seconds -lt 0) {
           $Hrs = ($TimeDiff.Hours) + 23
           $Mins = ($TimeDiff.Minutes) + 59
           $Secs = ($TimeDiff.Seconds) + 59 }
    else {
           $Hrs = $TimeDiff.Hours
           $Mins = $TimeDiff.Minutes
           $Secs = $TimeDiff.Seconds }
    $Restartinseconds = $(($Hrs * 3600 ) + ($Mins * 60) + ($secs))
    $LBLOutput.text = Log-Message "Restarting in $RestartinSeconds Seconds "
    shutdown /r /t $Restartinseconds
    $LBLOutput.text += Log-Message "Restart at $Time2 has been set."
    
    $Label2.text = Write-output "Restarting At: $RestartAt"
    
}



[void]$PSRestart.ShowDialog()