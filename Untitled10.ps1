[xml]$xaml = @'
<Window 
xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    Title="TPM Script" Height="482" Width="479" Background="White">
    <Grid Height="375" Width="382">
        <Button Content="PING" Height="55" HorizontalAlignment="Left" Margin="230,30,0,0" Name="PING" VerticalAlignment="Top" Width="140"/>
        <Label Content="Enter site name: " Height="23" HorizontalAlignment="Left" Margin="31,45,0,0" Name="Label1" VerticalAlignment="Top" Width="133"/>
        <TextBox Height="38" HorizontalAlignment="Left" Margin="31,74,0,0" Name="Text_Site" VerticalAlignment="Top" Width="171" />
        <TextBox Height="114" HorizontalAlignment="Left" Margin="31,241,0,0" Name="Text_Status" VerticalAlignment="Top" Width="329" />
    </Grid>
</Window>
'@

[void][System.Reflection.Assembly]::LoadWithPartialName('presentationframework')
$reader=(New-Object System.Xml.XmlNodeReader $xaml) 

try
{
        $Form=[Windows.Markup.XamlReader]::Load( $reader )
}
catch
{
    Write-Host "Unable to load Windows.Markup.XamlReader. Some possible causes for this problem include: .NET Framework is missing PowerShell must be launched with PowerShell -sta, invalid XAML code was encountered."t
}
## CHECK FORM
    $xaml.SelectNodes("//*[@Name]") | %{Set-Variable -Name "$($_.Name)" -Value $Form.FindName($_.Name)} # find all names and make them accessible via a variable

#First Button 
$PING = $Form.FindName('PING')
$PING.Add_Click({
    <#Test-Connection -computername $Text_Site.text
       $text_status.text = "pinging"#>
$ping = Test-Connection -ComputerName $Text_Site.text -Quiet -Count 4
While($true){
    If($ping  -eq $true){
        $Text_Status.text = $Text_Site.text+"`n Ping Successful!"
    }else{
        $Text_Status.text = $Text_Site.text+"`n Ping Failed!"
    }     
}  

})

$Form.ShowDialog() | out-null