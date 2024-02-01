Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing



$Form = New-Object System.Windows.Forms.Form
$Form.Text = "SOS Control"
$Form.Size = New-Object System.Drawing.Size(1200,600)

$Button = New-Object System.Windows.Forms.Button
$Button.Location = New-Object System.Drawing.Point(600,75)
$Button.Size = New-Object System.Drawing.Size(100,40)
$Button.Text = "enviar por ftp archivo war"
$Button.Add_Click({
    cd "C:\Program Files\PuTTY\"   
.\plink.exe -ssh lgomez-admin@aligntech.com@10.107.20.12 -pw 'Zx8888/*' -batch "pgrep -fla ssh" | Out-GridView -Title "List of all the services on this system" -OutputMode None


#foreach ($item in $output.Output){$textBox.Text = $item -split "`n"}
$textBox.Text = echo $output.Output.Item()
exit
})




$Form.Controls.Add($Button1)

$textBox = New-Object System.Windows.Forms.TextBox
$textBox.Location = New-Object System.Drawing.Point(10,40) ### Location of the text box
$textBox.Size = New-Object System.Drawing.Size(275,500) ### Size of the text box
$textBox.Multiline = $true ### Allows multiple lines of data
$textbox.AcceptsReturn = $true ### By hitting enter it creates a new line
$textBox.ScrollBars = "Vertical" ### Allows for a vertical scroll bar if the list of text is too big for the window
$form.Controls.Add($textBox)


$Form.Controls.Add($Button)

$listBox = New-Object System.Windows.Forms.ListBox 
$listBox.Location = New-Object System.Drawing.Point(10,40) 
$listBox.Size = New-Object System.Drawing.Size(260,20) 
$listBox.Height = 80

$Button1 = New-Object System.Windows.Forms.Button
$Button1.Location = New-Object System.Drawing.Point(400,75)
$Button1.Size = New-Object System.Drawing.Size(100,40)
$Button1.Text = "Reiniciar"
$Button1.Add_Click({
  cd "C:\Program Files\PuTTY\"   
.\plink.exe -ssh lgomez-admin@aligntech.com@10.107.20.12 -pw 'Zx8888/*' -batch "pgrep -fla ssh" | Out-GridView -Title "List of all the services on this system" -OutputMode None


#foreach ($item in $output.Output){$textBox.Text = $item -split "`n"}
$textBox.Text = echo $output.Output.Item()
exit
})


$Form.ShowDialog() | Out-Null