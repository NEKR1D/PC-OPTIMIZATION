rem ::: PC Optimization Tweaks
rem ::: 
rem ::: Plundered by NEKR1D
rem ::: 
rem ::: Work In Progress, Still Updating...

rem ::: !!! Warning !!!
rem ::: !!! Your hardware, chipset and devices are different !!!
rem ::: !!! Use script as reference only !!!

rem ::: !!! Building an all in one bat file this time, will grow as updated !!!

@echo off

rem :::
rem ::: AMD Tweaks
rem :::

rem ::: AMD Shader Cache set to Always On
rem ::: 31 00 = AMD Optimized (Default)
rem ::: 32 00 = Always On
rem ::: 30 00 = Off (Never use this)  
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v ShaderCache /t REG_BINARY /d 3200 /f

rem ::: AMD Disable Ultra Low Power State (UPLS)
rem ::: Search the registry for the specific sub-key holding the ULPS configuration and set to 0
for /f "tokens=*" %%A in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}" /s /f "EnableUlps" /v ^| findstr "HKEY"') do (
    echo Found AMD GPU Key: %%A
    reg add "%%A" /v EnableUlps /t REG_DWORD /d 0 /f
    echo.
)

rem :::
rem ::: Windows Power Tweaks
rem :::

rem ::: Disable PCIe Link State Power Management and Active State Power Management (ASPM)
rem ::: Also manually disable these in BIOS.
powercfg /setacvalueindex SCHEME_CURRENT 501a4d13-42af-4429-9fd1-a8218c268e20 ee12f906-d277-404b-b6da-e5fa1a576df5 0
powercfg /setdcvalueindex SCHEME_CURRENT 501a4d13-42af-4429-9fd1-a8218c268e20 ee12f906-d277-404b-b6da-e5fa1a576df5 0
powercfg /setactive SCHEME_CURRENT

rem :::
rem ::: Windows System & Profile General Tweaks
rem :::

rem ::: Disable Multi-Plane Overlay (MPO)
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v OverlayTestMode /t REG_DWORD /d 5 /f

rem ::: Remove Context Menu Delay (MenuShowDelay = 0)
reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d 0 /f

rem ::: Reduce Mouse Hover Delay (MouseHoverTime = 100)
reg add "HKCU\Control Panel\Mouse" /v MouseHoverTime /t REG_SZ /d 100 /f

rem ::: Set MMCSS CPU Prioritization (SystemResponsiveness = 0)
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d 0 /f

rem ::: Set Global System Timer Resolution (GlobalTimerResolutionRequests = 1)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "GlobalTimerResolutionRequests" /t REG_DWORD /d 1 /f

rem ::: Games system profile tweaks
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Affinity" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Background Only" /t REG_SZ /d "False" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Clock Rate" /t REG_DWORD /d "10000" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d "8" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d "6" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t REG_SZ /d "High" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Latency Sensitive" /t REG_SZ /d "True" /f

rem :::
rem ::: Windows Mouse
rem :::

rem ::: Disable "Enhance Pointer Precision" (Acceleration) for Current User
reg add "HKCU\Control Panel\Mouse" /v "MouseSpeed" /t REG_SZ /d "0" /f
reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold1" /t REG_SZ /d "0" /f
reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold2" /t REG_SZ /d "0" /f

rem ::: Disable "Enhance Pointer Precision" (Acceleration) for Welcome Screen / Default User
reg add "HKU\.DEFAULT\Control Panel\Mouse" /v "MouseSpeed" /t REG_SZ /d "0" /f
reg add "HKU\.DEFAULT\Control Panel\Mouse" /v "MouseThreshold1" /t REG_SZ /d "0" /f
reg add "HKU\.DEFAULT\Control Panel\Mouse" /v "MouseThreshold2" /t REG_SZ /d "0" /f

rem ::: Change Windows Desktop Pointer Speed (Default is 10)
reg add "HKCU\Control Panel\Mouse" /v "MouseSensitivity" /t REG_SZ /d "3" /f
reg add "HKU\.DEFAULT\Control Panel\Mouse" /v "MouseSensitivity" /t REG_SZ /d "3" /f

rem ::: Enable Active Window Tracking (Hover to focus)
rem ::: Note: Background hover-scrolling is native to Windows 11, but this specifically focuses the window
reg add "HKCU\Control Panel\Desktop" /v "UserPreferencesMask" /t REG_BINARY /d 9f3e078012000000 /f
reg add "HKCU\Control Panel\Mouse" /v "ActiveWindowTracking" /t REG_DWORD /d "1" /f

rem :::
rem ::: Windows - Device & Services
rem :::

rem ::: Device & Services Tweaks
rem ::: Disables unnecessary devices and services (such as those loaded with chipset drivers) that are not needed.
rem ::: pnputil /enum-devices [shows all services]

rem ::: WAN Miniport (L2TP)
pnputil /disable-device "SWD\MSRRAS\MS_L2TPMINIPORT"

rem ::: WAN Miniport (IPv6)
pnputil /disable-device "SWD\MSRRAS\MS_NDISWANIPV6"

rem ::: Remote Desktop Device Redirector Bus
pnputil /disable-device "ROOT\RDPBUS\0000"

rem ::: Microsoft GS Wavetable Synth
pnputil /disable-device "SWD\MMDEVAPI\MicrosoftGSWavetableSynth"

rem ::: WAN Miniport (SSTP)
pnputil /disable-device "SWD\MSRRAS\MS_SSTPMINIPORT"

rem ::: WAN Miniport (IP)
pnputil /disable-device "SWD\MSRRAS\MS_NDISWANIP"

rem ::: WAN Miniport (Network Monitor)
pnputil /disable-device "SWD\MSRRAS\MS_NDISWANBH"

rem ::: UMBus Root Bus Enumerator
pnputil /disable-device "ROOT\UMBUS\0000"

rem ::: Microsoft Virtual Drive Enumerator
pnputil /disable-device "ROOT\vdrvroot\0000"

rem ::: Composite Bus Enumerator
pnputil /disable-device "ROOT\CompositeBus\0000"

rem ::: WAN Miniport (IKEv2)
pnputil /disable-device "SWD\MSRRAS\MS_AGILEVPNMINIPORT"

rem ::: Microsoft Hyper-V Virtualization Infrastructure Driver
pnputil /disable-device "ROOT\VID\0000"

rem ::: WAN Miniport (PPTP)
pnputil /disable-device "SWD\MSRRAS\MS_PPTPMINIPORT"

rem ::: Microsoft RRAS Root Enumerator
pnputil /disable-device "SWD\MSRRAS\{5e259276-bc7e-40e3-b93b-8f89b5f3abc0}"

rem ::: WAN Miniport (PPPOE)
pnputil /disable-device "SWD\MSRRAS\MS_PPPOEMINIPORT"

rem ::: Intel(R) Graphics Control Panel
pnputil /disable-device "SWD\DRIVERENUM\CUI&4&25ab1049&0"

rem ::: Intel(R) iCLS Client
pnputil /disable-device "SWD\DRIVERENUM\OEM_ICLS_component&4&1402e39b&0"

rem ::: Microsoft Radio Device Enumeration Bus
pnputil /disable-device "SWD\RADIO\{3DB5895D-CC28-44B3-AD3D-6F01A782B8D2}"

rem ::: Intel(R) Graphics Command Center
pnputil /disable-device "SWD\DRIVERENUM\IGCC&4&25ab1049&0"

rem ::: Intel(R) Management Engine Interface #1
pnputil /disable-device "PCI\VEN_8086&DEV_A13A&SUBSYS_06B71028&REV_31\3&11583659&0&B0"

rem ::: Microsoft Kernel Debug Network Adapter
pnputil /disable-device "ROOT\KDNIC\0000"

rem ::: Root Print Queue
pnputil /disable-device "SWD\PRINTENUM\PrintQueues"

rem ::: Intel(R) Dynamic Application Loader Host Interface
pnputil /disable-device "SWD\DRIVERENUM\OEM_DAL_component&4&1402e39b&0"

rem ::: Intel(R) Management Engine WMI Provider
pnputil /disable-device "SWD\DRIVERENUM\OEM_WMI_component&4&1402e39b&0"

rem ::: Microsoft Print to PDF
pnputil /disable-device "SWD\PRINTENUM\{8C9B425C-5DD5-4DC1-AFDE-4EDFD21FFDAE}"

rem ::: Windows Print Queues
pnputil /disable-device "SWD\PRINTENUM\PrintQueues"

rem ::: Microsoft RRAS Root Enumerator
pnputil /disable-device "SWD\MSRRAS\{5e259276-bc7e-40e3-b93b-8f89b5f3abc0}"

rem ::: Intel(R) Dynamic Application Loader Host Interface
pnputil /disable-device "SWD\DRIVERENUM\OEM_DAL_component&4&17a6f261&2"

rem ::: Intel(R) Serial IO GPIO Host Controller - INTC1056
pnputil /disable-device "ACPI\INTC1056\2&daba3ff&0"

rem ::: High Definition Audio Controller
pnputil /disable-device "PCI\VEN_8086&DEV_7AD0&SUBSYS_7D301462&REV_11\3&11583659&0&FB"

rem ::: High Definition Audio Controller
pnputil /disable-device "PCI\VEN_10DE&DEV_1AEF&SUBSYS_886B1043&REV_A1\4&26196085&0&0108"

rem ::: NDIS Virtual Network Adapter Enumerator
pnputil /disable-device "ROOT\NdisVirtualBus\0000"

rem ::: Microsoft GS Wavetable Synth
pnputil /disable-device "SWD\MMDEVAPI\MicrosoftGSWavetableSynth"

rem ::: UMBus Root Bus Enumerator
pnputil /disable-device "ROOT\UMBUS\0000"

rem ::: Microsoft Virtual Drive Enumerator
pnputil /disable-device "ROOT\vdrvroot\0000"

rem ::: Composite Bus Enumerator
pnputil /disable-device "ROOT\CompositeBus\0000"

rem ::: Microsoft Hyper-V Virtualization Infrastructure Driver
pnputil /disable-device "ROOT\VID\0000"

rem ::: Microsoft App-V Client
powershell -Command "Stop-Service -Name 'AppVClient' -Force -ErrorAction SilentlyContinue"
powershell -Command "Set-Service -Name 'AppVClient' -StartupType Disabled"
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AppVClient" /v "Start" /t REG_DWORD /d 4 /f

rem ::: AssignedAccessManager Service
powershell -Command "Stop-Service -Name 'AssignedAccessManager' -Force -ErrorAction SilentlyContinue"
powershell -Command "Set-Service -Name 'AssignedAccessManager' -StartupType Disabled"
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AssignedAccessManager" /v "Start" /t REG_DWORD /d 4 /f

rem ::: GameDVR and Broadcast User Service
powershell -Command "Stop-Service -Name 'BcastDVRUserService' -Force -ErrorAction SilentlyContinue"
powershell -Command "Set-Service -Name 'BcastDVRUserService' -StartupType Disabled"
reg add "HKLM\SYSTEM\CurrentControlSet\Services\BcastDVRUserService" /v "Start" /t REG_DWORD /d 4 /f

rem ::: Bluetooth User Support Service
powershell -Command "Stop-Service -Name 'BluetoothUserService' -Force -ErrorAction SilentlyContinue"
powershell -Command "Set-Service -Name 'BluetoothUserService' -StartupType Disabled"
reg add "HKLM\SYSTEM\CurrentControlSet\Services\BluetoothUserService" /v "Start" /t REG_DWORD /d 4 /f

rem ::: Bluetooth Support Service
powershell -Command "Stop-Service -Name 'bthserv' -Force -ErrorAction SilentlyContinue"
powershell -Command "Set-Service -Name 'bthserv' -StartupType Disabled"
reg add "HKLM\SYSTEM\CurrentControlSet\Services\bthserv" /v "Start" /t REG_DWORD /d 4 /f

rem ::: Offline Files
powershell -Command "Stop-Service -Name 'CscService' -Force -ErrorAction SilentlyContinue"
powershell -Command "Set-Service -Name 'CscService' -StartupType Disabled"
reg add "HKLM\SYSTEM\CurrentControlSet\Services\CscService" /v "Start" /t REG_DWORD /d 4 /f

rem ::: Connected User Experiences and Telemetry
powershell -Command "Stop-Service -Name 'DiagTrack' -Force -ErrorAction SilentlyContinue"
powershell -Command "Set-Service -Name 'DiagTrack' -StartupType Disabled"
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DiagTrack" /v "Start" /t REG_DWORD /d 4 /f

rem ::: Dialog Blocking Service
powershell -Command "Stop-Service -Name 'DialogBlockingS' -Force -ErrorAction SilentlyContinue"
powershell -Command "Set-Service -Name 'DialogBlockingS' -StartupType Disabled"
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DialogBlockingS" /v "Start" /t REG_DWORD /d 4 /f

rem ::: Diagnostic Policy Service
powershell -Command "Stop-Service -Name 'DPS' -Force -ErrorAction SilentlyContinue"
powershell -Command "Set-Service -Name 'DPS' -StartupType Disabled"
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DPS" /v "Start" /t REG_DWORD /d 4 /f

rem ::: BitLocker 
powershell -Command "Stop-Service -Name 'BDESVC' -Force -ErrorAction SilentlyContinue" 
powershell -Command "Set-Service -Name 'BDESVC' -StartupType Disabled" 
reg add "HKLM\SYSTEM\CurrentControlSet\Services\BDESVC" /v "Start" /t REG_DWORD /d 4 /f

rem ::: Fax 
powershell -Command "Stop-Service -Name 'Fax' -Force -ErrorAction SilentlyContinue" 
powershell -Command "Set-Service -Name 'Fax' -StartupType Disabled" 
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Fax" /v "Start" /t REG_DWORD /d 4 /f

rem ::: Download Maps Manager 
powershell -Command "Stop-Service -Name 'MapsBroker' -Force -ErrorAction SilentlyContinue" 
powershell -Command "Set-Service -Name 'MapsBroker' -StartupType Disabled" 
reg add "HKLM\SYSTEM\CurrentControlSet\Services\MapsBroker" /v "Start" /t REG_DWORD /d 4 /f

rem ::: Geolocation Service 
powershell -Command "Stop-Service -Name 'lfsvc' -Force -ErrorAction SilentlyContinue" 
powershell -Command "Set-Service -Name 'lfsvc' -StartupType Disabled" 
reg add "HKLM\SYSTEM\CurrentControlSet\Services\lfsvc" /v "Start" /t REG_DWORD /d 4 /f

rem ::: Parental Controls 
powershell -Command "Stop-Service -Name 'WPCSvc' -Force -ErrorAction SilentlyContinue" 
powershell -Command "Set-Service -Name 'WPCSvc' -StartupType Disabled" 
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WPCSvc" /v "Start" /t REG_DWORD /d 4 /f

rem ::: Windows Event Log
powershell -Command "Stop-Service -Name 'EventLog' -Force -ErrorAction SilentlyContinue"
powershell -Command "Set-Service -Name 'EventLog' -StartupType Disabled"
reg add "HKLM\SYSTEM\CurrentControlSet\Services\EventLog" /v "Start" /t REG_DWORD /d 4 /f

rem ::: Intel(R) Dynamic Application Loader Host Interface Service
powershell -Command "Stop-Service -Name 'jhi_service' -Force -ErrorAction SilentlyContinue"
powershell -Command "Set-Service -Name 'jhi_service' -StartupType Disabled"
reg add "HKLM\SYSTEM\CurrentControlSet\Services\jhi_service" /v "Start" /t REG_DWORD /d 4 /f

rem ::: Link-Layer Topology Discovery Mapper
powershell -Command "Stop-Service -Name 'lltdsvc' -Force -ErrorAction SilentlyContinue"
powershell -Command "Set-Service -Name 'lltdsvc' -StartupType Disabled"
reg add "HKLM\SYSTEM\CurrentControlSet\Services\lltdsvc" /v "Start" /t REG_DWORD /d 4 /f

rem ::: TCP/IP NetBIOS Helper
powershell -Command "Stop-Service -Name 'lmhosts' -Force -ErrorAction SilentlyContinue"
powershell -Command "Set-Service -Name 'lmhosts' -StartupType Disabled"
reg add "HKLM\SYSTEM\CurrentControlSet\Services\lmhosts" /v "Start" /t REG_DWORD /d 4 /f

rem ::: Internet Connection Sharing (ICS)
powershell -Command "Stop-Service -Name 'icssvc' -Force -ErrorAction SilentlyContinue"
powershell -Command "Set-Service -Name 'icssvc' -StartupType Disabled"
reg add "HKLM\SYSTEM\CurrentControlSet\Services\icssvc" /v "Start" /t REG_DWORD /d 4 /f

rem ::: Messaging Service
powershell -Command "Stop-Service -Name 'MessagingService' -Force -ErrorAction SilentlyContinue"
powershell -Command "Set-Service -Name 'MessagingService' -StartupType Disabled"
reg add "HKLM\SYSTEM\CurrentControlSet\Services\MessagingService" /v "Start" /t REG_DWORD /d 4 /f

rem ::: Net.Tcp Port Sharing Service
powershell -Command "Stop-Service -Name 'NetTcpPortSharing' -Force -ErrorAction SilentlyContinue"
powershell -Command "Set-Service -Name 'NetTcpPortSharing' -StartupType Disabled"
reg add "HKLM\SYSTEM\CurrentControlSet\Services\NetTcpPortSharing" /v "Start" /t REG_DWORD /d 4 /f

rem ::: Network Location Awareness
powershell -Command "Stop-Service -Name 'NlaSvc' -Force -ErrorAction SilentlyContinue"
powershell -Command "Set-Service -Name 'NlaSvc' -StartupType Disabled"
reg add "HKLM\SYSTEM\CurrentControlSet\Services\NlaSvc" /v "Start" /t REG_DWORD /d 4 /f

rem ::: OneDrive & Microsoft Account Sync Host
powershell -Command "Stop-Service -Name 'OneSyncSvc' -Force -ErrorAction SilentlyContinue"
powershell -Command "Set-Service -Name 'OneSyncSvc' -StartupType Disabled"
reg add "HKLM\SYSTEM\CurrentControlSet\Services\OneSyncSvc" /v "Start" /t REG_DWORD /d 4 /f

rem ::: Phone Service
powershell -Command "Stop-Service -Name 'PhoneSvc' -Force -ErrorAction SilentlyContinue"
powershell -Command "Set-Service -Name 'PhoneSvc' -StartupType Disabled"
reg add "HKLM\SYSTEM\CurrentControlSet\Services\PhoneSvc" /v "Start" /t REG_DWORD /d 4 /f

rem ::: Program Compatibility Assistant Service
powershell -Command "Stop-Service -Name 'PcaSvc' -Force -ErrorAction SilentlyContinue"
powershell -Command "Set-Service -Name 'PcaSvc' -StartupType Disabled"
reg add "HKLM\SYSTEM\CurrentControlSet\Services\PcaSvc" /v "Start" /t REG_DWORD /d 4 /f

rem ::: Print Workflow Device Installation Service
powershell -Command "Stop-Service -Name 'PrintDeviceConf' -Force -ErrorAction SilentlyContinue"
powershell -Command "Set-Service -Name 'PrintDeviceConf' -StartupType Disabled"
reg add "HKLM\SYSTEM\CurrentControlSet\Services\PrintDeviceConf" /v "Start" /t REG_DWORD /d 4 /f

rem ::: Print Workflow Service
powershell -Command "Stop-Service -Name 'PrintScanBrokerService' -Force -ErrorAction SilentlyContinue"
powershell -Command "Set-Service -Name 'PrintScanBrokerService' -StartupType Disabled"
reg add "HKLM\SYSTEM\CurrentControlSet\Services\PrintScanBrokerService" /v "Start" /t REG_DWORD /d 4 /f

rem ::: Quality Windows Audio Video Experience
powershell -Command "Stop-Service -Name 'QWAVE' -Force -ErrorAction SilentlyContinue"
powershell -Command "Set-Service -Name 'QWAVE' -StartupType Disabled"
reg add "HKLM\SYSTEM\CurrentControlSet\Services\QWAVE" /v "Start" /t REG_DWORD /d 4 /f

rem ::: Routing and Remote Access
powershell -Command "Stop-Service -Name 'remoteAccess' -Force -ErrorAction SilentlyContinue"
powershell -Command "Set-Service -Name 'remoteAccess' -StartupType Disabled"
reg add "HKLM\SYSTEM\CurrentControlSet\Services\remoteAccess" /v "Start" /t REG_DWORD /d 4 /f

rem ::: Netlogon 
powershell -Command "Stop-Service -Name 'Netlogon' -Force -ErrorAction SilentlyContinue" 
powershell -Command "Set-Service -Name 'Netlogon' -StartupType Disabled" 
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Netlogon" /v "Start" /t REG_DWORD /d 4 /f

rem ::: AllJoyn Router Service 
powershell -Command "Stop-Service -Name 'AJRouter' -Force -ErrorAction SilentlyContinue" 
powershell -Command "Set-Service -Name 'AJRouter' -StartupType Disabled" 
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AJRouter" /v "Start" /t REG_DWORD /d 4 /f

rem ::: Remote Registry
powershell -Command "Stop-Service -Name 'remoteRegistry' -Force -ErrorAction SilentlyContinue"
powershell -Command "Set-Service -Name 'remoteRegistry' -StartupType Disabled"
reg add "HKLM\SYSTEM\CurrentControlSet\Services\remoteRegistry" /v "Start" /t REG_DWORD /d 4 /f

rem ::: Radio Management Service
powershell -Command "Stop-Service -Name 'RmSvc' -Force -ErrorAction SilentlyContinue"
powershell -Command "Set-Service -Name 'RmSvc' -StartupType Disabled"
reg add "HKLM\SYSTEM\CurrentControlSet\Services\RmSvc" /v "Start" /t REG_DWORD /d 4 /f

rem ::: Retail Demo Service
powershell -Command "Stop-Service -Name 'RetailDemo' -Force -ErrorAction SilentlyContinue"
powershell -Command "Set-Service -Name 'RetailDemo' -StartupType Disabled"
reg add "HKLM\SYSTEM\CurrentControlSet\Services\RetailDemo" /v "Start" /t REG_DWORD /d 4 /f

rem ::: Smart Card
powershell -Command "Stop-Service -Name 'SCardSvr' -Force -ErrorAction SilentlyContinue"
powershell -Command "Set-Service -Name 'SCardSvr' -StartupType Disabled"
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SCardSvr" /v "Start" /t REG_DWORD /d 4 /f

rem ::: Shared PC Account Manager
powershell -Command "Stop-Service -Name 'shpamsvc' -Force -ErrorAction SilentlyContinue"
powershell -Command "Set-Service -Name 'shpamsvc' -StartupType Disabled"
reg add "HKLM\SYSTEM\CurrentControlSet\Services\shpamsvc" /v "Start" /t REG_DWORD /d 4 /f

rem ::: Internet Connection Sharing (ICS)
powershell -Command "Stop-Service -Name 'SharedAccess' -Force -ErrorAction SilentlyContinue"
powershell -Command "Set-Service -Name 'SharedAccess' -StartupType Disabled"
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SharedAccess" /v "Start" /t REG_DWORD /d 4 /f

rem ::: Print Spooler
powershell -Command "Stop-Service -Name 'Spooler' -Force -ErrorAction SilentlyContinue"
powershell -Command "Set-Service -Name 'Spooler' -StartupType Disabled"
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Spooler" /v "Start" /t REG_DWORD /d 4 /f

rem ::: OpenSSH Authentication Agent
powershell -Command "Stop-Service -Name 'ssh-agent' -Force -ErrorAction SilentlyContinue"
powershell -Command "Set-Service -Name 'ssh-agent' -StartupType Disabled"
reg add "HKLM\SYSTEM\CurrentControlSet\Services\ssh-agent" /v "Start" /t REG_DWORD /d 4 /f

rem ::: SysMain (Superfetch)
powershell -Command "Stop-Service -Name 'SysMain' -Force -ErrorAction SilentlyContinue"
powershell -Command "Set-Service -Name 'SysMain' -StartupType Disabled"
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SysMain" /v "Start" /t REG_DWORD /d 4 /f

rem ::: Payments and NFC/SE Manager
powershell -Command "Stop-Service -Name 'SEMgrSvc' -Force -ErrorAction SilentlyContinue"
powershell -Command "Set-Service -Name 'SEMgrSvc' -StartupType Disabled"
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SEMgrSvc" /v "Start" /t REG_DWORD /d 4 /f

rem ::: Tablet PC Input Service
powershell -Command "Stop-Service -Name 'TabletInputService' -Force -ErrorAction SilentlyContinue"
powershell -Command "Set-Service -Name 'TabletInputService' -StartupType Disabled"
reg add "HKLM\SYSTEM\CurrentControlSet\Services\TabletInputService" /v "Start" /t REG_DWORD /d 4 /f

rem ::: User Experience Virtualization Service
powershell -Command "Stop-Service -Name 'UevAgentService' -Force -ErrorAction SilentlyContinue"
powershell -Command "Set-Service -Name 'UevAgentService' -StartupType Disabled"
reg add "HKLM\SYSTEM\CurrentControlSet\Services\UevAgentService" /v "Start" /t REG_DWORD /d 4 /f

rem ::: Windows Biometric Service
powershell -Command "Stop-Service -Name 'WbioSrvc' -Force -ErrorAction SilentlyContinue"
powershell -Command "Set-Service -Name 'WbioSrvc' -StartupType Disabled"
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WbioSrvc" /v "Start" /t REG_DWORD /d 4 /f

rem ::: Windows Event Collector
powershell -Command "Stop-Service -Name 'Wecsvc' -Force -ErrorAction SilentlyContinue"
powershell -Command "Set-Service -Name 'Wecsvc' -StartupType Disabled"
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Wecsvc" /v "Start" /t REG_DWORD /d 4 /f

rem ::: Windows Error Reporting Service
powershell -Command "Stop-Service -Name 'WerSvc' -Force -ErrorAction SilentlyContinue"
powershell -Command "Set-Service -Name 'WerSvc' -StartupType Disabled"
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WerSvc" /v "Start" /t REG_DWORD /d 4 /f

rem ::: Still Image Acquisition Events
powershell -Command "Stop-Service -Name 'WiaRpc' -Force -ErrorAction SilentlyContinue"
powershell -Command "Set-Service -Name 'WiaRpc' -StartupType Disabled"
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WiaRpc" /v "Start" /t REG_DWORD /d 4 /f

rem ::: Windows Insider Service
powershell -Command "Stop-Service -Name 'wisvc' -Force -ErrorAction SilentlyContinue"
powershell -Command "Set-Service -Name 'wisvc' -StartupType Disabled"
reg add "HKLM\SYSTEM\CurrentControlSet\Services\wisvc" /v "Start" /t REG_DWORD /d 4 /f

rem ::: Windows Search
powershell -Command "Stop-Service -Name 'WSearch' -Force -ErrorAction SilentlyContinue"
powershell -Command "Set-Service -Name 'WSearch' -StartupType Disabled"
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WSearch" /v "Start" /t REG_DWORD /d 4 /f

rem ::: Work Folders 
powershell -Command "Stop-Service -Name 'WorkFolders' -Force -ErrorAction SilentlyContinue" 
powershell -Command "Set-Service -Name 'WorkFolders' -StartupType Disabled" 
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WorkFolders" /v "Start" /t REG_DWORD /d 4 /f

rem ::: Microsoft Account Sign-in Assistant
powershell -Command "Stop-Service -Name 'wlidsvc' -Force -ErrorAction SilentlyContinue"
powershell -Command "Set-Service -Name 'wlidsvc' -StartupType Disabled"
reg add "HKLM\SYSTEM\CurrentControlSet\Services\wlidsvc" /v "Start" /t REG_DWORD /d 4 /f

rem ::: Xbox Live Auth Manager
powershell -Command "Stop-Service -Name 'XblAuthManager' -Force -ErrorAction SilentlyContinue"
powershell -Command "Set-Service -Name 'XblAuthManager' -StartupType Disabled"
reg add "HKLM\SYSTEM\CurrentControlSet\Services\XblAuthManager" /v "Start" /t REG_DWORD /d 4 /f

rem ::: Xbox Live Game Save
powershell -Command "Stop-Service -Name 'XblGameSave' -Force -ErrorAction SilentlyContinue"
powershell -Command "Set-Service -Name 'XblGameSave' -StartupType Disabled"
reg add "HKLM\SYSTEM\CurrentControlSet\Services\XblGameSave" /v "Start" /t REG_DWORD /d 4 /f

rem ::: Xbox Accessory Management Service
powershell -Command "Stop-Service -Name 'XboxGipSvc' -Force -ErrorAction SilentlyContinue"
powershell -Command "Set-Service -Name 'XboxGipSvc' -StartupType Disabled"
reg add "HKLM\SYSTEM\CurrentControlSet\Services\XboxGipSvc" /v "Start" /t REG_DWORD /d 4 /f

rem ::: Xbox Live Networking Service
powershell -Command "Stop-Service -Name 'XboxNetApiSvc' -Force -ErrorAction SilentlyContinue"
powershell -Command "Set-Service -Name 'XboxNetApiSvc' -StartupType Disabled"
reg add "HKLM\SYSTEM\CurrentControlSet\Services\XboxNetApiSvc" /v "Start" /t REG_DWORD /d 4 /f

rem ::: ZT Helper Service
powershell -Command "Stop-Service -Name 'ZTHELPER' -Force -ErrorAction SilentlyContinue"
powershell -Command "Set-Service -Name 'ZTHELPER' -StartupType Disabled"
reg add "HKLM\SYSTEM\CurrentControlSet\Services\ZTHELPER" /v "Start" /t REG_DWORD /d 4 /f

PAUSE