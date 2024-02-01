Add-Type -AssemblyName System.Windows.Forms



$Form = New-Object System.Windows.Forms.Form
$Form.Text = "Cargar MesServices.war"
$Form.Size = New-Object System.Drawing.Size(600,400)

$listBox = New-Object System.Windows.Forms.ListBox 
$listBox.Location = New-Object System.Drawing.Point(100,400) 
$listBox.Size = New-Object System.Drawing.Size(260,20) 
$listBox.Height = 160

$Button = New-Object System.Windows.Forms.Button
$Button.Location = New-Object System.Drawing.Point(100,75)
$Button.Size = New-Object System.Drawing.Size(100,40)
$Button.Text = "enviar por ftp archivo war"
$Button.Add_Click({
    #[System.Windows.Forms.MessageBox]::Show("enviar por ftp archivo war")
    $myTeamsWebHook = “https://aligntech.webhook.office.com/webhookb2/db5e9c91-c821-40ed-be14-5d694200a8c1@9ac44c96-980a-481b-ae23-d8f56b82c605/IncomingWebhook/996531355de046308bfcf13b2016fdd1/4625e6b7-da91-44a1-b27a-9257fd279167”
Invoke-RestMethod -Method post -ContentType 'Application/Json' -Body '{"text":"Test Teams!"}' -Uri $myTeamsWebHook
})

$Form.Controls.Add($Button)

$Button1 = New-Object System.Windows.Forms.Button
$Button1.Location = New-Object System.Drawing.Point(400,75)
$Button1.Size = New-Object System.Drawing.Size(100,40)
$Button1.Text = "Descargar archivo war"
$Button1.Add_Click({
    [System.Windows.Forms.MessageBox]::Show("¡Hola Mundo!")
})

$Form.Controls.Add($Button1)

$Form.ShowDialog() | Out-Null