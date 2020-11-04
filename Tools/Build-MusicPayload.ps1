function Build-MusicPayload
{
    param(
        [Parameter(Mandatory, Position=0)]
        [string]$MusicFile,
        [Parameter(Mandatory, Position=1)]
        [string]$OutputFile
    )
    Begin
    {
        Try
        {
            Write-Verbose "[*] - Creating music payload with $($MusicFile)"

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
            $base64string = [Convert]::ToBase64String([IO.File]::ReadAllBytes($MusicFile))
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
$WScript = New-Object -com wscript.shell; 1..50 | % { $WScript.SendKeys([char]175) }; 
$b64 = '%PAYLOAD%'
$decodedFile = [System.Convert]::FromBase64String($b64)
$File = "$($env:USERPROFILE)\"+[guid]::NewGuid().ToString()+".mid"
Set-Content -Path $File -Value $decodedFile -Encoding Byte
$Player = New-Object System.Windows.Media.MediaPlayer
$Player.Open($File)
$Player.Play()

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