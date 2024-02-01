# Create a new form
$objForm = New-Object System.Windows.Forms.Form
$objForm.Size = New-Object System.Drawing.Size (850,680)
$objForm.BackColor = "Black"
$objForm.StartPosition = "CenterScreen"
$objForm.FormBorderStyle = 'Fixed3D'
$objForm.MaximizeBox = $false
$objForm.KeyPreview = $True
$objForm.Topmost = $false

# Create a new textbox
$objTextbox = New-Object System.Windows.Forms.TextBox
$objTextbox.Multiline = $true
$objTextbox.ScrollBars = "Vertical"
$objTextbox.Location = New-Object System.Drawing.Size (10, 10)
$objTextbox.Size = New-Object System.Drawing.Size (800, 600)
$objTextbox.Font = New-Object System.Drawing.Font("Consolas", 10)

# Add the textbox to the form
$objForm.Controls.Add($objTextbox)

# Run your script and output the results to the textbox
$output = & "C:\path\to\your\script.ps1" | Out-String
$objTextbox.Text = $output

# Show the form
$objForm.ShowDialog()
