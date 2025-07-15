<a name="readme-top"></a>

# PC Optimization for Gaming

- A collection of ```Tweaks.bat``` focused on optimizing overall responsiveness by improving framerate, frametimes, input and device communication latencies.
- Experimental ```Windows11Tweaks.bat``` that make the OS more responsive, remove bloat, remove telemetry and adjustments to security/privacy elements.
- Currently tested and working on ```INTEL 12900K``` and ```NVIDIA 3080``` running ```WINDOWS 11 Build 24H2 [26100.4652]``` as of ```July 1st, 2025```.
- Not intended as a comprehensive user guide with technical explanations or a FAQ.
- Serves mainly as a document to track my own configuration changes.

> [!WARNING]
> - Tweaks are experimental and will likely cause increased temperatures, power consumption and CPU/GPU usage.
> - Use the scripts provided as a reference to test and tailor settings to your own experience.

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
- Titus Ultimate Windows Utility Tool
- TCPOptimizer
- USB Device Viewer
- USB Tree Viewer

## BIOS - General Settings
  
**Disable:**
- Hyper-V ```Disable``` 
- Intel Virtualization Technology ```Disable``` 
- VT-d ```Disable``` 
- Hyper-Threading ```Disable``` 
- Spread Spectrum [_When Overclocking__]```Disable``` 
- CPU C-States ```Disable``` 
- CPU Power Throttling ```Disable``` 
- CPU Thermal Protection```Disable``` 
- Intel SpeedStep ```Disable``` 
- Intel TurboBoost ```Disable``` 
- TPM ```Disable``` 
- Integrated/On-board devices [Audio, Video, Bluetooth, WiFi] ```Disable```
- Unused USB ports ```Disable```
  
**Enable:**
- Above 4G Decoding _[Resizable Bar]_ ```Enable``` 
- AHCI ```Enable``` 
- XMP [_Profiles for RAM_]```Enable``` 
- High Performance Power Mode ```Enable``` 
- BCLK size - [_Set to 100.00 Mhz_]```Enable``` 
- CPU VRM Switching Frequency - [_Set to 500 Khz or higher_] ```Enable```  
- AVX Offset - Set to ```Enable``` and ```0```
  
## BIOS - Enable Resizable BAR
- Enabling ```Resizable BAR``` in the BIOS is required otherwise the GPU Driver level settings will not have any effect.
  
- **In BIOS:**
   - Set Above 4G Decoding [Resizable Bar] to ```Enable```
  
- **In NVIDIA Profile Inspector:**
   - Set rBAR - Feature to ```Enable```
   - Set rBAR - Options to  ```0x00000001 (Returnal, Red Dead Redemption 2)```
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

Set these as the global profile for NVIDIA and individually set specific values per game .exe to your preference [such as sharpening or frame-rate locking]

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
- Vertical Sync	```On```

> [!NOTE]
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
- Ansel - Enabled ```Off``` [_This disables NVIDIA APP/GUI and Overlay, does not impact NVIDIA Control Panel_]
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
- Increase Windows volume to ```100%``` _(Use your DAC/AMP or in-game settings to decrease volume instead)_

## References & Research
- CPU - Disable Core Isolation -
  - https://www.elevenforum.com/t/enable-or-disable-core-isolation-memory-integrity-in-windows-11.4942/
- CPU - Intel - Optimization Applications for Latency
  - https://www.intel.com/content/www/us/en/developer/articles/technical/optimizing-computer-applications-for-latency-part-1-configuring-the-hardware.html
- Mouse - MouseDataQueueSize
  - https://www.xbitlabs.com/mousedataqueuesize/
- Mouse - High DPI For Lowest Latency
  - https://www.youtube.com/watch?v=6AoRfv9W110&t=154s
- Mouse - Designing Games for High DPI
  - https://forums.blurbusters.com/viewtopic.php?f=22&p=81380
- DirectX - Demystifying Full Screen Optimizations
  - https://devblogs.microsoft.com/directx/demystifying-full-screen-optimizations/
- GPU - NVIDIA GPU PState
  - https://docs.nvidia.com/gameworks/content/gameworkslibrary/coresdk/nvapi/group__gpupstate.html
- GPU - NVIDIA System Latency Optimization
  - https://www.nvidia.com/en-us/geforce/guides/gfecnt/202010/system-latency-optimization-guide/
- GPU - Input Lag Revisited: V-Sync and NVIDIA Reflex
  - https://www.youtube.com/watch?v=dPMHEyz38TM
- GPU - Gsync 101 - Input Lag
  - https://blurbusters.com/gsync/gsync101-input-lag-tests-and-settings/14/
- GPU - Nvidia Profile Inspector
  - https://www.pcgamingwiki.com/wiki/Nvidia_Profile_Inspector
- Windows - Virtualization Protections
  - Code Integrity - https://learn.microsoft.com/en-us/windows/security/hardware-security/enable-virtualization-based-protection-of-code-integrity?tabs=security
- Windows - Resource Sets Tweaks Gave FPS Boost
  - Perf Analysis - https://www.youtube.com/watch?v=U1xFWbJBEMk
- Windows - Serialize Timer Expiration
  - https://www.youtube.com/watch?v=wil-09_5H0M
- Windows - Win32priorityseparation
  - https://github.com/LuSlower/win32ps-changer
- Windows - Win32PrioritySeparation
  - https://forums.blurbusters.com/viewtopic.php?f=10&t=8535
- Windows - Win32priorityseparation
  - https://www.xbitlabs.com/win32priorityseparation-performance/
- Windows - Win32PrioritySeparation
  - https://learn.microsoft.com/en-us/previous-versions/cc976120(v=technet.10)?redirectedfrom=MSDN
- Windows - Psched - Use 100% NIC
  - https://dottech.org/26628/how-to-force-windows-to-use-100-of-your-network-bandwidth-how-to-guide/
- Windows - Psched - Set Timer Resolution
  - https://www.windows-security.org/df711f090da6ddbbc1bab472114bac01/set-timer-resolution
- Windows - Performance Tuning
  - https://martin77s.wordpress.com/2010/04/05/performance-tuning-your-windows-server-part-3/
- Windows - SMB Compression
  - https://www.thewindowsclub.com/improve-network-speed-using-smb-compression
- Windows - Windows Logon
  - https://james-rankin.com/features/the-ultimate-guide-to-windows-logon-optimizations-part-5/
- Windows - Increasing Threads
  - https://www.wilderssecurity.com/threads/increase-number-of-threads-per-process.317532/
- Windows - Worker/Critical Threads
  - https://notes.ponderworthy.com/additional-critical-worker-threads-in-windows-speed-tweak
- Windows - Threaded DPCs
  - https://learn.microsoft.com/en-us/windows-hardware/drivers/kernel/introduction-to-threaded-dpcs
- Windows - Real Time Performance
  - https://learn.microsoft.com/en-us/windows/iot/iot-enterprise/soft-real-time/soft-real-time-device
- Windows - Interrupt Affinity
  - https://video2.skills-academy.com/en-us/windows-hardware/drivers/kernel/interrupt-affinity-and-priority
- Network - BBR2
  - https://dlsj.xlog.app/windows11-bbr2?locale=en
- Network - Congestion Providers
  - https://techcommunity.microsoft.com/blog/networkingblog/windows-transport-converges-on-two-congestion-providers-cubic-and-ledbat/339819
- Network - NIC Tweaks
  - https://www.speedguide.net/articles/gaming-tweaks-5812
- Network - NIC Definitions
  - https://www.speedguide.net/articles/network-adapter-optimization-3449
- Network - Intel NIC Optimizing Performance
  - https://edc.intel.com/content/www/us/en/design/products/ethernet/adapters-and-devices-user-guide/optimizing-performance/
- Network - RSS Queues
  - https://learn.microsoft.com/en-us/windows-hardware/drivers/network/standardized-inf-keywords-for-rss
- Network - RSS INFs
  - https://docs.microsoft.com/de-de/windows-hardware/drivers/network/standardized-inf-keywords-for-rss
- Network - Task Offloading
  - https://learn.microsoft.com/en-us/windows-hardware/drivers/network/task-offload
- Network - Task Offloading
  - https://learn.microsoft.com/en-us/windows-hardware/drivers/network/using-registry-values-to-enable-and-disable-task-offloading
- Network - RSS
  - https://www.overclock.net/threads/registry-setting-disabletaskoffload-rss-and-indirection-table.1752848/
- Network - Performance Tuning
  - https://docs.oracle.com/cd/E13924_01/coh.340/e13818/perftune.htm

## Credits
- MarkC - https://donewmouseaccel.blogspot.com/
- Alchemy Tweaks - https://github.com/AlchemyTweaks/Verified-Tweaks
- BoringBoredom - https://github.com/BoringBoredom/PC-Optimization-Hub/
- DjDallmann - https://github.com/djdallmann/GamingPCSetup/
- Shoober420 - https://github.com/shoober420/windows11-scripts
- Melodys Tweaks - https://sites.google.com/view/melodystweaks/basictweaks
- Calypto's Latency Guide - https://docs.google.com/document/d/1c2-lUJq74wuYK1WrA_bIvgb89dUN0sj8-hO3vqmrau4/edit?tab=t.0
- N1kobg - https://n1kobg.blogspot.com/p/blog-page_23.html
- Geoff Chappell - https://www.geoffchappell.com/studies/windows/win32/index.htm?tx=66

***
<p align="center"> Plundered with ❤️ by NEKR1D </p>
<br>
