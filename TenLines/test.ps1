[void][System.Reflection.Assembly]::LoadWithPartialName('presentationframework')
[xml]$XAML = @"
<Window 
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        Title="MainWindow" Height="192.937" Width="417.383" ResizeMode="NoResize" WindowStartupLocation="CenterScreen" WindowStyle="None" Background="White">
    <Grid HorizontalAlignment="Left" Width="407" Height="187" VerticalAlignment="Top">
        <Label Name="label" Content="Hostname" HorizontalAlignment="Left" Margin="10,56,0,0" VerticalAlignment="Top" Width="132"/>
        <Label Name="label1" Content="User" HorizontalAlignment="Left" Margin="10,87,0,0" VerticalAlignment="Top" Width="132"/>
        <Label Name="label1_Copy" Content="Domain" HorizontalAlignment="Left" Margin="10,118,0,0" VerticalAlignment="Top" Width="132"/>
        <Label Name="label2" Content="User Information" HorizontalAlignment="Left" Margin="10,12,0,0" VerticalAlignment="Top" Width="387" FontSize="14" FontWeight="Bold"/>
        <TextBox Name="textBox" HorizontalAlignment="Left" Height="23" Margin="142,59,0,0" TextWrapping="Wrap" Text="TextBox" VerticalAlignment="Top" Width="252" BorderThickness="0" FontWeight="Bold"/>
        <TextBox Name="textBox1" HorizontalAlignment="Left" Height="23" Margin="142,90,0,0" TextWrapping="Wrap" Text="TextBox" VerticalAlignment="Top" Width="252" BorderThickness="0" FontWeight="Bold"/>
        <TextBox Name="textBox2" HorizontalAlignment="Left" Height="23" Margin="142,120,0,0" TextWrapping="Wrap" Text="TextBox" VerticalAlignment="Top" Width="252" BorderThickness="0" FontWeight="Bold"/>
        <Button Name="button" Content="Close" Margin="149,156,149,0" VerticalAlignment="Top"/>
    </Grid>
</Window>
"@
#Read XAML
$reader = (New-Object System.Xml.XmlNodeReader $xaml) 
try { $Form = [Windows.Markup.XamlReader]::Load( $reader ) }
catch { Write-Host "Unable to load Windows.Markup.XamlReader"; exit }

# Store Form Objects In PowerShell
$xaml.SelectNodes("//*[@Name]") | ForEach-Object { Set-Variable -Name ($_.Name) -Value $Form.FindName($_.Name) }

#Assign system variables
$textBox.text = $env:COMPUTERNAME
$textBox1.text = $env:USERNAME
$textBox2.text = $env:USERDOMAIN

#Assign event
$button.Add_Click( {
        $form.Close()
    })

#Show Form
$Form.ShowDialog() | out-null