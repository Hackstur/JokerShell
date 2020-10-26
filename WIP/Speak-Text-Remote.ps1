Invoke-Command -ComputerName $ComputerName -ScriptBlock {
    # Intialize dependencies
    Add-Type -TypeDefinition @'
using System.Runtime.InteropServices;

[Guid("5CDF2C82-841E-4546-9722-0CF74078229A"), InterfaceType(ComInterfaceType.InterfaceIsIUnknown)]
interface IAudioEndpointVolume {
    // f(), g(), ... are unused COM method slots. Define these if you care
    int f(); int g(); int h(); int i();
    int SetMasterVolumeLevelScalar(float fLevel, System.Guid pguidEventContext);
    int j();
    int GetMasterVolumeLevelScalar(out float pfLevel);
    int k(); int l(); int m(); int n();
    int SetMute([MarshalAs(UnmanagedType.Bool)] bool bMute, System.Guid pguidEventContext);
    int GetMute(out bool pbMute);
}
[Guid("D666063F-1587-4E43-81F1-B948E807363F"), InterfaceType(ComInterfaceType.InterfaceIsIUnknown)]
interface IMMDevice {
    int Activate(ref System.Guid id, int clsCtx, int activationParams, out IAudioEndpointVolume aev);
}
[Guid("A95664D2-9614-4F35-A746-DE8DB63617E6"), InterfaceType(ComInterfaceType.InterfaceIsIUnknown)]
interface IMMDeviceEnumerator {
    int f(); // Unused
    int GetDefaultAudioEndpoint(int dataFlow, int role, out IMMDevice endpoint);
}
[ComImport, Guid("BCDE0395-E52F-467C-8E3D-C4579291692E")] class MMDeviceEnumeratorComObject { }

public class Audio {
    static IAudioEndpointVolume Vol() {
    var enumerator = new MMDeviceEnumeratorComObject() as IMMDeviceEnumerator;
    IMMDevice dev = null;
    Marshal.ThrowExceptionForHR(enumerator.GetDefaultAudioEndpoint(/*eRender*/ 0, /*eMultimedia*/ 1, out dev));
    IAudioEndpointVolume epv = null;
    var epvid = typeof(IAudioEndpointVolume).GUID;
    Marshal.ThrowExceptionForHR(dev.Activate(ref epvid, /*CLSCTX_ALL*/ 23, 0, out epv));
    return epv;
    }
    public static float Volume {
    get {float v = -1; Marshal.ThrowExceptionForHR(Vol().GetMasterVolumeLevelScalar(out v)); return v;}
    set {Marshal.ThrowExceptionForHR(Vol().SetMasterVolumeLevelScalar(value, System.Guid.Empty));}
    }
    public static bool Mute {
    get { bool mute; Marshal.ThrowExceptionForHR(Vol().GetMute(out mute)); return mute; }
    set { Marshal.ThrowExceptionForHR(Vol().SetMute(value, System.Guid.Empty)); }
    }
}
'@
    Add-Type -AssemblyName System.Speech
    
    # Identify current Mute status and Volume Level
    $CurrentMute = [Audio]::Mute
    $CurrentVol = [Audio]::Volume
    
    # Un-mute if needed
    [Audio]::Mute = $False
    # If Volume is under 25%, change to 75%
    [Audio]::Volume = .25
    
    # Intialize voice
    $Voice = New-Object System.Speech.Synthesis.SpeechSynthesizer
    
    # Get current rate of speech. Probably set to 0(default)
    $CurrentRate = $Voice.Rate
    
    # Change rate of speech
    $Voice.Rate = -2
    # Speak
    $Voice.Speak(
        "Did you ever hear the tragedy of Darth Plagueis The Wise? 
        I thought not. It’s not a story the Jedi would tell you. 
        It’s a Sith legend. Darth Plagueis was a Dark Lord of the Sith, 
            so powerful and so wise he could use the Force to influence the midichlorians to create life… 
        He had such a knowledge of the dark side that he could even keep the ones he cared about from dying. 
        The dark side of the Force is a pathway to many abilities some consider to be unnatural. 
        He became so powerful… the only thing he was afraid of was losing his power, which eventually, of course, he did. 
        Unfortunately, he taught his apprentice everything he knew, then his apprentice killed him in his sleep. 
        Ironic. He could save others from death, but not himself."
    )
    
    # Change Rate,Volume,Mute values back to what they were set to originally
    $Voice.Rate = $CurrentRate
    [Audio]::Volume = $CurrentVol
    [Audio]::Mute = $CurrentMute
    
    # Dispose of voice
    $Voice.Dispose()
}