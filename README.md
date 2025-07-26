<a name="readme-top"></a>

# PC Optimization for Gaming

- A collection of ```Tweaks.bat``` focused on optimizing overall responsiveness by improving framerate, frametimes, input and device communication latencies.
- Experimental ```Windows11Tweaks.bat``` that make the OS more responsive. Remove bloat and configure related settings of telemetry, security and privacy.
- Other improvements can include reducing or eliminating stutters and hitching.

> [!NOTE]
> - Serves mainly as a document to track my own configuration changes.
> - Not intended as a comprehensive user guide with technical explanations or a FAQ.
> - Not a system overclocking guide.
> - Currently tested and working on;
>   - ```INTEL i9 12900K```
>   - ```NVIDIA RTX 3080```
>   - ```WINDOWS 11 Pro [Version 24H2 Build 26100.4652]```

> [!WARNING]
> - Tweaks are experimental
> - Tailored for an Intel, NVIDIA and Windows OS environment
> - Expect increased temperatures, power consumption and CPU/GPU usage.
> - Use the scripts provided as a reference to test and tailor settings to your own environment.

> [!CAUTION]
> - **Use at your own risk**.

## Software & Tools Used
- ASUS GPU Tweak III
- Display Driver Unistaller (DDU)
- Driver Store Explorer
- Equalizer APO + PEACE
- HWiNFO
- Intelligent Standby List Cleaner
- Interrupt Affinity Policy Tool
- Measure Sleep
- NVIDIA Profile Inspector
- NVCleanInstall
- ParkControl
- Power Settings Explorer
- Timer Bench
- TCPOptimizer
- USB Device Viewer
- USB Tree Viewer

## BIOS - General Settings
  
**Disable:**
- Active State Power Management (ASPM) ```Disable``` 
- Aggressive Link Power Management (ALPM) ```Disable```
- Hyper-V ```Disable``` 
- Intel Virtualization Technology ```Disable``` 
- VT-d ```Disable``` 
- Hyper-Threading ```Disable```
- Spread Spectrum [_When Overclocking_]```Disable``` 
- CPU C-States ```Disable``` 
- CPU Power Throttling ```Disable``` 
- CPU Thermal Protection```Disable```
- Fast Boot ```Disable```
- Intel SpeedStep ```Disable``` 
- Intel TurboBoost ```Disable```
- TPM ```Disable``` 
- Integrated devices [Audio, Video, Bluetooth, WiFi] ```Disable```
- Unused USB ports ```Disable```

> [!NOTE]
> - Performance improvement by disabling Hyper-Threading will vary by game. May benefit by; decreasing power draw and temperatures, specific core/instruction assignments and increase overclock stability or capabilities. There are always trade-offs.
> - Set appropriate number of cores value in ```BCDTweaks.bat``` to match your HT setting.
  
**Enable:**
- Above 4G Decoding _[Resizable Bar]_ ```Enable``` 
- AHCI [_SATA controller mode_] ```Enable``` 
- XMP [_Profiles for RAM_]```Enable``` 
- High Performance Power Mode [_Intel Defaults_] ```Enable``` 
- BCLK size [_Set to 100.00 Mhz_]```Enable``` 
- CPU VRM Switching Frequency [_Set to 500 Khz or higher_] ```Enable```
- High Precision Event Timer (HPET) ```Enable```
- AVX Offset - Set to ```Enable``` and ```0```
- Load Line Calibration (LLC) [_Set a static voltage for CPU vcore and use LLC_] ```Enable```
- Secure Boot ```Enable```
  
## BIOS - Enable Resizable BAR
- Enabling ```Resizable BAR``` in the BIOS is required otherwise the GPU Driver level settings will not have any effect.
  
- **In BIOS:**
   - Set Above 4G Decoding [Resizable Bar] to ```Enable```
  
- **In NVIDIA Profile Inspector:**
   - Set rBAR - Feature to ```Enable```
   - Set rBAR - Options to  ```0x00000001```
   - Set rBAR - Size Limit to ```0x0000000060000000``` [_1.5GB_]
  
> [!NOTE]
> - Enabling ```Resizable BAR``` in the BIOS depends on your hardware compatibility, motherboard manufacturer and BIOS version.
> - You can verify ```Resizable BAR``` is enabled by opening the ```NVIDIA Control Panel``` then ```System Information```, and then look for ```Resizable BAR``` in the list. If it says ```Yes```, you’re set.

## NVIDIA - Graphics Card Driver Clean Install
- Boot Windows in ```Safe Mode```
- Run ```Display Driver Uninstaller (DDU)``` to remove all traces of your current NVIDIA driver from your PC.
- Reboot
- Run ```NVCleanInstall``` software to install a modified version of the NVIDIA graphics card driver.
- Follow the settings in the next section

## NVCleanInstall - Settings
- Select Components to Install ```Display Driver (Required)```
- Disable Installer Telemetry & Advertising ```On```
- Unattended Express Installation ```On```
- Perform a clean installation  ```On```
- Disable Multi-Plane Overlay (MPO) ```On```
- Disable Ansel ```On```
- Show Expert Tweaks ```On```
- Disable Driver Telemetry (Experimental) ```On```
- Enable Message Signaled Interrupts (MSI) ```On```
- Interupt Policy ```Specified Processers``` Click ```Select Processors``` and assign the cores you want MSI to be assigned for the GPU
- Interupt Priority ```High```
- Disable HDCP ```On```
- Rebuild Digital Signature (Required) ```On```
- Use Method Compatible With Easy Anti-Cheat ```On```
- Automatically Accept "Driver Unsigned" warning ```On```

## NVIDIA - Control Panel - 3D Settings
- Open ```NVIDIA Control Panel```
- Click ```Manage 3D Settings```
- Image Scaling ```Off```
- Image Sharpening ```Off```
- Anisotropic Filtering	```Off```
- Antialiasing - FXAA ```Off```
- Antialiasing - Gamma Correction ```On```
- Antialiasing - Mode ```Application Controlled```
- Antialiasing - Transparancy ```Off```
- Background Application Max Frame Rate ```Off```
- CUDA – GPUS ```All```
- Low Latency Mode	```On``` or ```Ultra```
- Max Frame Rate ```Off``` or ```Match Your Monitor's Refresh Rate```
- Monitor Technology ```Fixed Refresh```
- Multi-Frame Samples AA (MFAA) ```Off```
- OpenGL GDI Compatibility ```Prefer performance```
- OpenGL Rendering GPU ```Auto```
- Power Management Mode	```Prefer Max Performance```
- Preferred refresh rate ```Highest available```
- Shader Cache Size - ```Unlimited```
- Texture filtering - Anisotropic sample optimization ```Off```
- Texture filtering - Negative LOD bias ```Clamp```
- Texture filtering - Quality ```High Performance```
- Texture filtering - Trilinear optimization ```Off```
- Threaded optimization ```On```
- Tripple buffering ```Off```
- Vertical Sync	```Off```

> [!NOTE]
> - Set these as the global profile for NVIDIA
> - Individually set specific values per game .exe to your preference [such as sharpening or frame-rate locking]
> - Low Latency Mode is preferential based and requires testing. If you enable NVIDIA Reflex setttings in-game it will override this flag.
> - Negative LOD bias setting is preferential based and the best choice will depend on the game. Manipulates texture/object pop-in/image quality.

## NVIDIA Control Panel - Color Settings
- Open ```NVIDIA Control Panel```
- Under ```Display``` select ```Change Resolution```
- Select ```Use NVIDIA color settings```
- Under ```Desktop color depth``` select ```Highest (32-bit)```
- Under ```Output color depth``` select ```8 bpc```
- Under ```Output color format``` select ```RGB```
- Under ```Output dynamic range``` select ```Full```

## NVIDIA Control Panel - Desktop Size and Position
- Open ```NVIDIA Control Panel```
- Under ```Display``` Select ```Adjust Desktop Size and Position```
- Under ```Select Scaling Mode``` Select ```No Scaling```
- Under ```Perform Scaling On:``` Select ```GPU```
- Check ```Override the scaling mode set by games and programs``` to ```On```

> [!NOTE]
> - In general, any type of scaling either by GPU or Display will add some amount of latency.
> - GPU scaling is typically faster than what built-in monitor technology offers which, on some models, can introduce more input latency than expected.

- ## NVIDIA Control Panel - 3D Settings - Forcing High Performance
- Open ```NVIDIA Control Panel```
- Click ```Manage 3D Settings```
- Click ```Program Settings```
- Click ```Add``` set ```Power Management Mode``` to ```High Performance``` for;
  - DWM.exe (located in \Windows\System32)
  - Explorer.exe (located in \Windows)
  - MicrosoftShellExperienceHost
  - Steam
  - Browsers
  - VLC
  - Any other games or apps with this toggle not set correctly

> [!NOTE]
> - Simple method for forcing ```High Performance``` individually for specific Windows apps and game .exes ensuring Power Management Mode is NOT set to ```NVIDIA Recommended```.

## NVIDIA Profile Inspector - Settings

- GSYNC - Application Mode ```Off```
- GSYNC - Application Requested State ```Off```
- GSYNC - Application State ```Disable```
- GSYNC - Global Feature ```Off```
- GSYNC - Global Mode ```Off```
- Vertical Sync - Force ```Off```
- Vertical Sync - Smooth AFR Behavior ```Off```
- Vertical Sync - Tear Control ```Standard```
- Antialiasing - Line Gamma ```On```
- Ansel - Enabled ```Off``` [_Disables NVIDIA APP/GUI and Overlay, does not impact NVIDIA Control Panel_]
- CUDA - Forced P2 State ```Off```
- DLSS - Enable DLL Override - ```On - DLSS Overridden by latest available```
- DLSS - Forced Preset Letter -  ```Always use latest```
- DLSS-RR - Enable DLL Override - ```On - DLSS-RR Overridden by latest available```
- DLSS-RR - Forced Preset Letter -  ```Always use latest```
- Raytracing - (DXR) Enabled ```Off```
- Raytracing - (Vulkan RT) Enabled ```Off```
- rBAR - Feature ```Enable```
- rBAR - Options ```0x00000001 (Returnal, Red Dead Redemption 2)```
- rBAR - Size Limit ```0x0000000060000000``` _[1.5GB]_
- Antialiasing - SLI AA ```0x00000000 AA_MODE_SELECTOR_SLIAA_DISABLED```
- NVIDIA Predefined Ansel Usage ```0x00000000 ANSEL_ALLOW_DISALLOWED```
- Variable Refresh Rate ```0x00000000 VSYNCVRRCONTROL_DISABLE```
- Staging Cache Size ```0x01000001 Max```
- Shader Max Reg Allowed ```0x00000400 Max``` [_Specifies max register allowed when compiling/optimizing a shader_]

## Windows Hardware-Accelerated GPU Scheduling
- Open ```Control Panel```
- Select ```System```
- Select ```Display```
- Select ```Graphics```
- Select ```Change Default Graphics Settings```
- Set ```Hardware-accelerated GPU Scheduling``` to ```On```

## Windows Game Mode
- Open```Control Panel```
- Select ```Gaming```
- Select ```Game Mode```
- Set Game Mode to ```On```

## Windows Audio

- Disable ```Audio/Signal Enhancements```
- Disable ```Spatial Sound```
- Enable ```Exclusive Mode```
- Open ```Control Panel``` > ```Hardware and Sound``` > ```Sound``` > ```Communications``` > Set to ```Do Nothing```
- Set ```Audio Output``` to ```Headphones``` mode in games whenever possible
- Increase Windows volume to ```100%``` (_Use your DAC/AMP or in-game settings to control volume levels instead_)

## Windows Timer Resolution
- Use the Intelligent Standby List Cleaner application to force a Windows Timer Resolution
- Start this program with windows and always running in the background
- Enable ```Custome Timer Resolution```
- Enable ```GlobalTimerResolutionRequests``` [we already force enable this in the registry in ```TimerTweaks.bat```]
- Set the ```Wanted Timer Resolution``` field to a value extremely close to 0.5ms
- Use Measure Sleep application to check diagnostics for resolution, sleep and delta;

```Measure Sleep
Resolution: 0.5050ms, Sleep(n=1) slept 1.0038ms (delta: 0.0038)
Resolution: 0.5050ms, Sleep(n=1) slept 1.0040ms (delta: 0.0040)
Resolution: 0.5050ms, Sleep(n=1) slept 1.0036ms (delta: 0.0036)
Resolution: 0.5050ms, Sleep(n=1) slept 1.0042ms (delta: 0.0042)
Resolution: 0.5050ms, Sleep(n=1) slept 1.0045ms (delta: 0.0045)
Resolution: 0.5050ms, Sleep(n=1) slept 1.0041ms (delta: 0.0041)
Resolution: 0.5050ms, Sleep(n=1) slept 1.0076ms (delta: 0.0076)
Resolution: 0.5050ms, Sleep(n=1) slept 1.0033ms (delta: 0.0033)
Resolution: 0.5050ms, Sleep(n=1) slept 1.0041ms (delta: 0.0041)
Resolution: 0.5050ms, Sleep(n=1) slept 1.0045ms (delta: 0.0045)
Resolution: 0.5050ms, Sleep(n=1) slept 1.0041ms (delta: 0.0041)
Resolution: 0.5050ms, Sleep(n=1) slept 1.0031ms (delta: 0.0031)
Resolution: 0.5050ms, Sleep(n=1) slept 1.0035ms (delta: 0.0035)
Resolution: 0.5050ms, Sleep(n=1) slept 1.0033ms (delta: 0.0033)
```
  
> [!NOTE]
> - The default Windows setting is around ~15ms.
> - For my system, setting the Timer Resolution value to 0.5050 produced the best result where each sleep metric is exact/accurate to 2 decimal places - 1.00ms.
> - On your system, test different Timer Resolution values so that you achieve the lowest and most consistent sleep metric
> - Your Timer Resolution isn't optimal when you see the sleep values vary too much (spiking from 1ms to 2ms or higher)

## Message Signal Intterupts (MSI)
- Use the Interrupt Affinity Policy Tool application to define and force Message Signal Intterupts
- Assign cpu cores to separate devices where interrupts are sent to
- Assign priority level
 
| Device                  | Priority | Core Assignment    |
|-------------------------|----------|--------------------|
| GPU                     | High     | P-Cores 4,5,6,7    |
| Network Controller      | High     | P-Cores 1,2,3      |
| USB Host Controllers    | High     | P-Cores 1,2,3      |
| NVME Drives             | High     | E-cores 8-15       |
| NVME Controllers        | High     | E-cores 8-15       |

> [!NOTE]
> - Example table shows a configuartion where HyperThreading is disabled, that sets high priority and seperates intterupts individually on usable threads for all MSI enabled devices.
> - Recommended to not set intterupts on Core 0. Typically the default interrupt thread(s) for entire system. Bottleneck in many cases where OS, applications and games can default to significant usage of this core/thread(s).

***
<p align="center"> Plundered with ❤️ by NEKR1D </p>
<br>
