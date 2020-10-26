 $xaml = @"
<Window
 xmlns='http://schemas.microsoft.com/winfx/2006/xaml/presentation'>
 
 <Border BorderThickness="20" BorderBrush="Yellow" CornerRadius="9" Background='Red'>
  <StackPanel>
   <Label FontSize="50" FontFamily='Stencil' Background='Red' Foreground='White' BorderThickness='0'>
    System will be rebooted in 15 seconds!
   </Label>
 
   <Label HorizontalAlignment="Center" FontSize="15" FontFamily='Consolas' Background='Red' Foreground='White' BorderThickness='0'>
    Worried about losing data? Talk to your friendly help desk representative and freely share your concerns!
   </Label>
  </StackPanel>
 </Border>
</Window>
"@
$reader = [System.XML.XMLReader]::Create([System.IO.StringReader] $xaml)
$window = [System.Windows.Markup.XAMLReader]::Load($reader)
$Window.AllowsTransparency = $True
$window.SizeToContent = 'WidthAndHeight'
$window.ResizeMode = 'NoResize'
$Window.Opacity = .7
$window.Topmost = $true
$window.WindowStartupLocation = 'CenterScreen'
$window.WindowStyle = 'None'
# show message for 5 seconds:
$null = $window.Show()
Start-Sleep -Seconds 5
$window.Close()