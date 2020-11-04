function Build-WallpaperPayload
{
    param(
        [Parameter(Mandatory, Position=0)]
        [string]$ImageFile,
        [Parameter(Mandatory, Position=1)]
        [string]$OutputFile
    )
    Begin
    {
        Try
        {
            Write-Verbose "[*] - Creating wallpaper payload with $($ImageFile)"

        }
        Catch
        {
            Write-Output "[!]$(Get-Date -Format '[MM-dd-yyyy][HH:mm:ss]') - ScriptLine: $($_.InvocationInfo.ScriptLineNumber) | ExceptionType: $($_.Exception.GetType().FullName) | ExceptionMessage: $($_.Exception.Message)"
			Break
        }

    }
    Process
    {
        Try
        {
            Write-Verbose "[*] - Converting to byte array"
            $base64string = [Convert]::ToBase64String([IO.File]::ReadAllBytes($ImageFile))
        }
        Catch
        {
            Write-Output "[!]$(Get-Date -Format '[MM-dd-yyyy][HH:mm:ss]') - ScriptLine: $($_.InvocationInfo.ScriptLineNumber) | ExceptionType: $($_.Exception.GetType().FullName) | ExceptionMessage: $($_.Exception.Message)"
			Break
        }

    }
    End
    {
        Try
        {
            Write-Verbose "[*] - Creating output file $($OutputFile)"
            $payload=@'
# Embed image file
$b64='%PAYLOAD%'
$decodedFile=[System.Convert]::FromBase64String($b64)
Set-Content -Path "$($env:USERPROFILE)\image.jpg" -Value $decodedFile -Encoding Byte

# Add Interop Type Definition
Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class Joker { [DllImport("user32.dll",CharSet=CharSet.Unicode)] public static extern int SystemParametersInfo (Int32 uAction,Int32 uParam,String lpvParam,Int32 fuWinIni); }' | Out-Null

# Apply changes
[Joker]::SystemParametersInfo(0x0014, 0, ($($env:USERPROFILE)+"\image.jpg"), (0x01 -bor 0x02))

# Remove image file
Remove-Item "$($env:USERPROFILE)\image.jpg"

Exit

'@

            $payload.Replace("%PAYLOAD%",$base64string) | Out-File -FilePath $OutputFile
        }
        Catch
        {
            Write-Output "[!]$(Get-Date -Format '[MM-dd-yyyy][HH:mm:ss]') - ScriptLine: $($_.InvocationInfo.ScriptLineNumber) | ExceptionType: $($_.Exception.GetType().FullName) | ExceptionMessage: $($_.Exception.Message)"
			Break
        }


    }
}