
[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.VisualBasic") | Out-Null
$popuptype=[microsoft.visualbasic.msgboxstyle]::Exclamation -bor [microsoft.visualbasic.msgboxstyle]::OKOnly -bor [microsoft.visualbasic.msgboxstyle]::DefaultButton1
$a=60
while (1)
{
    $a=$a-1
    $ans = [Microsoft.VisualBasic.Interaction]::MsgBox("El sistema se reiniciara en ... $a"+"s",$popuptype,"Windows")
    $ans
}