<# 
.NAME
    Jupyter-Lab Admin
.SYNOPSIS
    Panel administration of Jupyter-Lab
#>

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = New-Object System.Drawing.Point(400,400)
$Form.text                       = "Form"
$Form.TopMost                    = $false

$list_servers                    = New-Object system.Windows.Forms.Button
$list_servers.text               = "🖥️List Servers"
$list_servers.width              = 109
$list_servers.height             = 41
$list_servers.location           = New-Object System.Drawing.Point(11,13)
$list_servers.Font               = New-Object System.Drawing.Font('Microsoft Sans Serif',10,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))

$Form.controls.AddRange(@($list_servers))

$list_servers.Add_Click({  })


[void]$Form.ShowDialog()