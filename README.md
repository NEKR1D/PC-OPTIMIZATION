<a name="readme-top"></a>

# PC Optimization for Gaming

- A collection of ```TWEAKS.bat``` focused on optimizing overall responsiveness by improving framerate, frametimes, input and device communication latencies.
- Other potential benefits and improvements include; reducing or eliminating stutters and hitching.

> [!NOTE]
> - Serves mainly as a document to track my own configuration changes.
> - Not intended as a comprehensive user guide with technical explanations or a FAQ.
> - Not a system overclocking guide.
> - Currently tested and working on;
>   - ```INTEL i9 12900K```
>   - ```AMD 9070 XT```
>   - ```WINDOWS 11 Pro [Version 25H2 Build 26200.8894]```

> [!WARNING]
> - Tweaks are experimental.
> - Tailored for Intel CPU, AMD GPU and Windows 11 OS.
> - Expect increased temperatures, power consumption and usage of CPU and GPU.
> - Use the scripts provided as a reference to test and tailor settings to your own environment.

> [!CAUTION]
> - **Use at your own risk**.

## Software & Tools
- Display Driver Unistaller (DDU)
- Driver Store Explorer
- HWiNFO
- Interrupt Affinity Policy Tool
- LatencyMon
- Measure Sleep
- ParkControl
- Power Settings Explorer
- RawAccel
- Timer Bench
- USB Device Viewer
- USB Tree Viewer

> [!NOTE]
> - Providing a list of various tools and software used for performance and gaming in general.
> - Many of theses are not covered or explained in this document but sharing useful tools for you to look into.

## BIOS - General Settings
  
**Disable:**
- Active State Power Management (ASPM) ```Disable``` 
- Aggressive Link Power Management (ALPM) ```Disable```
- Hyper-V ```Disable``` 
- Intel Virtualization Technology ```Disable``` 
- VT-d ```Disable``` 
- Hyper-Threading [_Dependant on Game/System_] ```Enable or Disable```
- Spread Spectrum [_When Overclocking_] ```Disable``` 
- CPU C-States ```Disable``` 
- CPU Power Throttling ```Disable``` 
- CPU Thermal Protection ```Disable```
- Fast Boot ```Disable```
- Intel SpeedStep ```Disable``` 
- Intel TurboBoost ```Disable```
- PCIe Link State Power Management ```Disable```
- TPM ```Disable``` 
- Integrated devices [Audio, Video, Bluetooth, WiFi] ```Disable```
  
**Enable:**
- Above 4G Decoding _[Resizable Bar]_ ```Enable``` 
- AHCI [_SATA Controller Mode_] ```Enable``` 
- XMP [_Profiles for RAM_] ```Enable``` 
- High Performance Power Mode [_Intel "Default" or Manufacturer Performance Mode_] ```Enable``` 
- BCLK size [_Set to 100.00 Mhz_] ```Enable``` 
- High Precision Event Timer (HPET) ```Enable```
- AVX Offset - Set to ```Enable``` and ```0``` offset.
- Load Line Calibration (LLC) [_Set a static voltage for CPU vcore and use LLC_] ```Enable```
- Secure Boot ```Enable```
  
## BIOS - Enable Resizable BAR
- Enabling ```Resizable BAR``` in the BIOS is required otherwise the GPU Driver level settings will not have any effect.
  
- **In BIOS:**
   - Ensure Above 4G Decoding [Resizable Bar] is set to ```Enable```
  
> [!NOTE]
> - Enabling ```Resizable BAR``` in the BIOS depends on your hardware compatibility, motherboard manufacturer and BIOS version.
> - You can verify ```Resizable BAR``` is enabled by opening the official GPU software for AMD or NVIDIA and find ```Resizable BAR``` shown as enabled.
> - Some research suggests that setting rBAR size higher such as 4GB, 8GB, 12GB, 16GB [_relative to your available VRAM_] can be taken advantage of by some games as long as VRAM never hits/exceeds max.

## AMD Adrenaline Software
- Undervolting typically -50mV to -100mV.
- Increase Power Limit (%) to max 10%
- Clock frequency adjustments have almost no impact in standard gaming use cases
- More details to be updated here.
  
> [!NOTE]
> - Clock frequency adjustments are something so finely tuned it's not the time to investigate and comb through.
> - For RDNA4 (9070XT), AMD not allow you to lock frequencies to something higher and stable. The firmware is fairly locked down. You have to rely on the automatic boost clock system.
> - More details to be updated here.

## Windows Hardware-Accelerated GPU Scheduling
- Open ```Control Panel```
- Select ```System```
- Select ```Display```
- Select ```Graphics```
- Select ```Change Default Graphics Settings```
- Set ```Hardware-accelerated GPU Scheduling``` to ```ON``` or ```OFF```

- > [!NOTE]
> - Disabling ```Hardware-accelerated GPU Scheduling``` for improvements will depend your hardware and game. Example, if you are bottlenecked by CPU or GPU via VRAM or GPU core utilization.
> - Test thoroughly, sometimes toggling this completely resolves stutters.
> - In most cases leave this ON.

## Variable Refresh Rate
- Open ```Control Panel```
- Select ```System```
- Select ```Display```
- Select ```Graphics```
- Select ```Change Default Graphics Settings```
- Set ```Variable Refresh Rate``` to ```Off```

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
- Set ```Default Format``` to ```24-bit 48000Hz (Studio Quality)```
- Increase and keep ```Windows OS``` volume set to ```100%```
  - Use your DAC/AMP, physical volume slider or in-game settings to control volume levels instead
  
## USB Ports & Devices
- Not all USB ports on your motherbboard are created equal.
- USB port performance can vary significantly.
- USB port connections can be tied "Direct to CPU", routed through the shared motherboard chipset, or powered by slower third-party controllers. 
- CPU-direct ports offer the highest bandwidth and lowest latency. They are primarily an AMD Ryzen feature (Not Intel).
- Newer or "feature rich aka top-end and expensive" motherboards may not have this consideration.
- Use a tool like USB LATENCY ANALYZER (https://tools.mariusheier.com/cpudirect.html) to research and verify.
- Count chips between your device and CPU. More chips = more latency.
- 0 CHIPS  device --- [CPU]
- 1 CHIP   device -[CHIPSET]- [CPU]
- 2 CHIPS  device -[HUB]-[CHIPSET]- [CPU]
- Note: the optimization scripts I provided include commands for disabling "USB Selective Suspend" in Windows.

## Message Signal Intterupts (MSI)
- Use the Interrupt Affinity Policy Tool application to define and force Message Signal Intterupts
- Assign cpu cores to separate devices where interrupts are sent to
- Assign priority level
- Currently testing [as of August 2026] to let the OS handle all MSIs at high priority.

| Device                  | Priority | Core Assignment    |
|-------------------------|----------|--------------------|
| GPU                     | High     | Spread Messages Across All Processors  |
| Network Controller      | High     | Spread Messages Across All Processors  |
| USB Host Controllers    | High     | Spread Messages Across All Processors  |
| NVME Drives             | High     | Spread Messages Across All Processors  |
| NVME Controllers        | High     | Spread Messages Across All Processors  |

> [!NOTE]
> - Serves as an example of how you might split MSI Intterupts across cores. May not be optimal for your hardware/configuration.
> - Some research indicates not set intterupts on Core 0. Typically the default interrupt thread(s) for entire system are sent to Core 0. Bottleneck in many cases where OS, applications and games can default to significant usage of this core/thread(s).
> - In rare cases, some device drivers do need to be assigned to Core 0 and changing these vaulues including MSI Limit can cause the device to fail. You might see your device hardware flagged (!) in Windows Device Manager.

***
<p align="center"> Plundered with ❤️ by NEKR1D </p>
<br>
