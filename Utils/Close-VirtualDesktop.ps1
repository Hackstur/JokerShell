#CREDITS: https://gallery.technet.microsoft.com/scriptcenter/How-to-close-all-Virtual-b7eb8269
Function CloseVirtualDesktopInWin10 
{ 
    $KeyShortcut = Add-Type -MemberDefinition @" 
    [DllImport("user32.dll")] 
    static extern void keybd_event(byte bVk, byte bScan, uint dwFlags, UIntPtr dwExtraInfo); 
    //WIN + CTRL + F4: Close the virtual desktop 
    public static void CloseVirtualDesktopInWin10() 
    { 
        //Key down 
        keybd_event((byte)0x5B, 0, 0, UIntPtr.Zero); //Left Windows key  
        keybd_event((byte)0x11, 0, 0, UIntPtr.Zero); //CTRL 
        keybd_event((byte)0x73, 0, 0, UIntPtr.Zero); //F4 
        //Key up 
        keybd_event((byte)0x5B, 0, (uint)0x2, UIntPtr.Zero); 
        keybd_event((byte)0x11, 0, (uint)0x2, UIntPtr.Zero); 
        keybd_event((byte)0x73, 0, (uint)0x2, UIntPtr.Zero); 
    } 
"@ -Name CloseVirtualDesktop -UsingNamespace System.Threading -PassThru 
    $KeyShortcut::CloseVirtualDesktopInWin10() 
} 
 
 
Function CloseAllVirtualDesktopInWin10() { 
    $maxNumber=1..200 
    foreach ($n in $maxNumber) 
    { 
        CloseVirtualDesktopInWin10 
    } 
} 

CloseAllVirtualDesktopInWin10