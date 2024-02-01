Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing








$Form = New-Object System.Windows.Forms.Form
$Form.Text = "Cargar MesServices.war"
$Form.Size = New-Object System.Drawing.Size(1200,600)

$Button = New-Object System.Windows.Forms.Button
$Button.Location = New-Object System.Drawing.Point(600,75)
$Button.Size = New-Object System.Drawing.Size(100,40)
$Button.Text = "enviar por ftp archivo war"
$Button.Add_Click({
    $textBox.Clear()
})

$listBox = New-Object System.Windows.Forms.ListBox 
$listBox.Location = New-Object System.Drawing.Point(100,400) 
$listBox.Size = New-Object System.Drawing.Size(260,20) 
$listBox.Height = 160


$Form.Controls.Add($Button1)




$Form.Controls.Add($Button)

$Button1 = New-Object System.Windows.Forms.Button
$Button1.Location = New-Object System.Drawing.Point(400,75)
$Button1.Size = New-Object System.Drawing.Size(100,40)
$Button1.Text = "Descargar archivo war"
$Button1.Add_Click({
    
Import-Module Posh-SSH
$setsession = New-SSHSession -ComputerName 10.107.20.12 -AcceptKey -Credential 'lgomez-admin@aligntech.com'
$output=Invoke-SSHCommand -SessionId 0 -Command 'ls'
#ForEach-Object {output $_} | Out-GridView -PassThru
#$textBox.Text = echo $output.Output.Item()
foreach ($item in $output.Output){$listBox.Text = $item}
exit
})


$Form.ShowDialog() | Out-Null