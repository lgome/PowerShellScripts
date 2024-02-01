$x = @()# the return variable
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$objForm                 = New-Object System.Windows.Forms.Form
$objForm.Size            = New-Object System.Drawing.Size(850,680)
$objForm.BackColor       = "Black"
$objForm.StartPosition   = "CenterScreen"
$objForm.FormBorderStyle = 'Fixed3D'
$objForm.MaximizeBox     = $false
$objForm.KeyPreview      = $True
$objForm.Topmost         = $false

$OKButton.Add_Click({ 
 $selected = $objCombobox.SelectedItem
 $script:x += $objCombobox.SelectedItem
 if (![string]::IsNullOrWhiteSpace($selected)) {
    #$objLabel.Text = "Performing action $($selected)"
    switch ($selected) {   
        "program 1"     { start-process "\\server1\folder1\script1.ps1"} 
    }
    $objLabel.Text = "INSTALLATIONS"
    $objCombobox.SelectedIndex = -1   
}
})
$objForm.Controls.Add($OKButton)

$objLabel           = New-Object System.Windows.Forms.Label
$objLabel.Location  = New-Object System.Drawing.Size(10,120)
$objLabel.Size      = New-Object System.Drawing.Size(280,20)
$objLabel.Text      = "INSTALLATIONS"
$objLabel.Forecolor = "White" 
$objLabel.Backcolor = "Transparent"
$objLabel.Font      = "Arial,8,style=bold"
$objForm.Controls.Add($objLabel) 

$objCombobox          = New-Object System.Windows.Forms.Combobox
$objCombobox.Text     = "please choose"
$objCombobox.Location = New-Object System.Drawing.Size(10,140)
$objCombobox.Size     = New-Object System.Drawing.Size(320,20)
$objCombobox.Height   = 500

[void] $objCombobox.Items.Add("program 1")

$objForm.Controls.Add($objCombobox) 


$objForm.Add_Shown({$objForm.Activate()})
[void] $objForm.ShowDialog()