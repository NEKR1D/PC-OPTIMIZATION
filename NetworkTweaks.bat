rem ::: Network Tweaks 

rem ::: Plundered by NEKR1D

rem ::: Originally created by Shoober420
rem ::: https://github.com/shoober420/windows11-scripts

rem ::: !!! Warning !!!
rem ::: !!! Your hardware and devices are different !!!
rem ::: !!! May brick your Network Adapter and connectivity !!!
rem ::: !!! Use script as reference only !!!

rem ::: !!! Setting things at tcp stack, device or registry level can have unintended behavior if they are mismatched !!!
rem ::: !!! Some settings could take priority over the other !!!

if not exist C:\Windows\System32\wbem\WMIC.exe (
    rem :::Installing WMIC...
    DISM /Online /Add-Capability /CapabilityName:WMIC~~~~
    rem :::Done.
)

TIMEOUT 1

rem ::: Disable Nagle's Algorithm and modify ACK
@echo off
setlocal enabledelayedexpansion

rem ::: Get list of physical adapters where NetEnabled=true and AdapterTypeID=0 (Ethernet)
rem ::: First check to confirm we only want to select the active physical network adapter
for /f "tokens=2 delims==" %%A in ('wmic nic where "NetEnabled=true and AdapterTypeID=0" get DeviceID /value ^| find "DeviceID"') do (
    set DEV_ID=%%A

    rem ::: Get matching SettingID from nicconfig where DHCPEnabled=true
	rem ::: Second check to confirm we only want to select the active physical network adapter
    for /f "tokens=1,2 delims==" %%B in ('wmic nicconfig where "IPEnabled=true and DHCPEnabled=true and Index=%%A" get SettingID /value ^| find "SettingID"') do (
        set GUID=%%C
        goto :found
    )
)

:found
if "%GUID%"=="" (
    echo Failed to find a physical network adapter with DHCP enabled.
    exit /b 1
)

rem ::: Set Registry path to TCP/IP parameters\interface of the active physical network adapter
set REG_PATH=HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%GUID%

echo Disabling Nagle's Algorithm for adapter with GUID: %GUID%

rem ::: Apply registry settings to disable Nagle's Algorithm and modify ACK behavior
reg add "%REG_PATH%" /v TcpAckFrequency /t REG_DWORD /d 1 /f
reg add "%REG_PATH%" /v TCPNoDelay /t REG_DWORD /d 1 /f
reg add "%REG_PATH%" /v TCPDelAckTicks /t REG_DWORD /d 0 /f

echo TcpAckFrequency set to 1
echo TCPNoDelay set to 1
echo TCPDelAckTicks set to 0
echo.
echo Nagle's Algorithm disabled.
echo.
endlocal

@echo on

rem ::: Setting DNS as CloudFlare 1.1.1.1 / 1.0.0.1
netsh interface ipv4 set dns name="Ethernet" static 1.1.1.1 primary
netsh interface ipv4 add dns name="Ethernet" addr=1.0.0.1 index=2

rem ::: Flush DNS
ipconfig /flushdns

rem ::: Enabling DNS over HTTPS (DoH)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "EnableAutoDoh" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "EnableDoh" /t REG_DWORD /d "2" /f

rem ::: Require DoH / 2 - Allow DoH / 1 - Prohibit DoH
reg add "HKLM\Software\Policies\Microsoft\Windows NT\DNSClient" /v "DoHPolicy" /t REG_DWORD /d "3" /f

rem ::: Disable TCP/IP NetBIOS Helper Service (lmhosts)
net stop lmhosts
reg add "HKLM\SYSTEM\CurrentControlSet\Services\lmhosts" /v "Start" /t REG_DWORD /d "4" /f

rem ::: "Setting default TTL value in TCP/IP parameters to 64."
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /t REG_DWORD /v DefaultTTL /d 64 /f

rem ::: "Setting maximum user port number in TCP/IP parameters to 65534."
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /t REG_DWORD /v MaxUserPort /d 65534 /f

rem ::: "Setting TCP timed wait delay in TCP/IP parameters to 30 seconds."
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /t REG_DWORD /v TcpTimedWaitDelay /d 30 /f

rem ::: "Disabling non-best effort bandwidth limit in QoS policies."
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Psched" /t REG_DWORD /v NonBestEffortLimit /d 0 /f

rem ::: "Configuring QoS to not use Network Layer Authentication."
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Tcpip\QoS" /t REG_SZ /v "Do not use NLA" /d 1 /f

rem ::: "Adjusting LanmanServer parameters for optimized file sharing performance."
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /t REG_DWORD /v Size /d 3 /f

rem ::: Network Throttle // Default = 10 Unthrottled = 4294967295 [Decimal Values]
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /t REG_DWORD /v NetworkThrottlingIndex /d 4294967295 /f

rem ::: "Setting system responsiveness to maximum in multimedia system profile."
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /T REG_DWORD /v SystemResponsiveness /d 0 /f

rem ::: "Applying NSI registry settings for network performance optimization."
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Nsi\{eb004a03-9b1a-11d4-9123-0050047759bc}\26" /v "00000000" /t REG_BINARY /d "0000000000000000000000000500000000000000000000000000000000000000ff00000000000000" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Nsi\{eb004a03-9b1a-11d4-9123-0050047759bc}\26" /v "04000000" /t REG_BINARY /d "0000000000000000000000000500000000000000000000000000000000000000ff00000000000000" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Nsi\{eb004a03-9b1a-11d4-9123-0050047759bc}\0" /v "0200" /t REG_BINARY /d "0000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000ff000000000000000000000000000000000000000000ff000000000000000000000000000000" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Nsi\{eb004a03-9b1a-11d4-9123-0050047759bc}\0" /v "1700" /t REG_BINARY /d "0000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000ff000000000000000000000000000000000000000000ff000000000000000000000000000000" /f

rem ::: "Setting priority levels for DNS, Hosts, Local, and NetBT services."
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "DnsPriority" /t REG_DWORD /d "6" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "HostsPriority" /t REG_DWORD /d "5" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "LocalPriority" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "NetbtPriority" /t REG_DWORD /d "7" /f

rem ::: "Setting IRPStackSize for LanmanServer to enhance file sharing capabilities."
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /t REG_DWORD /v IRPStackSize /d 30 /f

rem ::: Setting Packet Scheduler Timer Resolution = 1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" /v "TimerResolution" /t REG_DWORD /d "1" /f

rem ::: Setting Packet Scheduler - Limit outstanding packets = 0
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" /v "MaxOutstandingSends" /t REG_DWORD /d "0" /f

rem ::: Setting Packet Scheduler - Limit reservable bandwidth = 0
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" /v "NonBestEffortLimit" /t REG_DWORD /d "0" /f

rem ::: Get the Sub ID of the Network Adapter

for /f %%n in ('Reg query "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4D36E972-E325-11CE-BFC1-08002bE10318}" /v "*SpeedDuplex" /s ^| findstr  "HKEY"') do (

rem ::: Setting Network Adapter SpeedDuplex to 1 Gbit [1Gbit = 6] [Auto Negotiation = 0]
rem ::: Unless you know the correct value, SpeedDuplex must be set to "Auto Negotiation" or NIC and Internet breaks
reg add "%%n" /v "*SpeedDuplex" /t REG_SZ /d "6" /f

rem ::: Disabling MIMO Power Save Mode -  Disable = 1
reg add "%%n" /v "MIMOPowerSaveMode" /t REG_SZ /d "3" /f

rem ::: Disable most properties/services on Network Adapter 
rem ::: Also visible in device manager properties of device
rem ::: Intel i-225v Adapter no longer supports RSS [officially removed in .inf]

rem ::: Disabling Network Adapter offloading, rss, wake-on-LAN, mircast, etc.
reg add "%%n" /v "*WakeOnMagicPacket" /t REG_SZ /d "0" /f
reg add "%%n" /v "WakeOnMagicPacketFromS5" /t REG_SZ /d 0 /f
reg add "%%n" /v "*WakeOnPattern" /t REG_SZ /d "0" /f
reg add "%%n" /v "*PacketCoalescing" /t REG_SZ /d "0" /f
reg add "%%n" /v "ThroughputBoosterEnabled" /t REG_SZ /d "1" /f
reg add "%%n" /v "FatChannelIntolerant" /t REG_SZ /d "0" /f
reg add "%%n" /v "*MiracastSupported" /t REG_DWORD /d "0" /f
reg add "%%n" /v "*DeviceSleepOnDisconnect" /t REG_DWORD /d "0" /f
reg add "%%n" /v "RoamAggressiveness" /t REG_SZ /d "0" /f
reg add "%%n" /v "RoamingPreferredBandType" /t REG_SZ /d "3" /f
reg add "%%n" /v "uAPSDSupport" /t REG_SZ /d "0" /f
reg add "%%n" /v "RecommendedBeaconInterval" /t REG_DWORD /d "99999999" /f
reg add "%%n" /v "*FlowControl" /t REG_SZ /d "0" /f
reg add "%%n" /v "*RSS" /t REG_SZ /d "0" /f
reg add "%%n" /v "*TCPConnectionOffloadIPv4" /t REG_SZ /d "0" /f
reg add "%%n" /v "*TCPConnectionOffloadIPv6" /t REG_SZ /d "0" /f
reg add "%%n" /v "*IPChecksumOffloadIPv4" /t REG_SZ /d "0" /f
reg add "%%n" /v "*TCPChecksumOffloadIPv4" /t REG_SZ /d "0" /f
reg add "%%n" /v "*TCPChecksumOffloadIPv6" /t REG_SZ /d "0" /f
reg add "%%n" /v "*UDPChecksumOffloadIPv4" /t REG_SZ /d "0" /f
reg add "%%n" /v "*UDPChecksumOffloadIPv6" /t REG_SZ /d "0" /f
reg add "%%n" /v "*LsoV1IPv4" /t REG_SZ /d "0" /f
reg add "%%n" /v "*LsoV2IPv4" /t REG_SZ /d "0" /f
reg add "%%n" /v "*LsoV2IPv6" /t REG_SZ /d "0" /f
reg add "%%n" /v "*TCPUDPChecksumOffloadIPv4" /t REG_SZ /d "0" /f
reg add "%%n" /v "*TCPUDPChecksumOffloadIPv6" /t REG_SZ /d "0" /f
reg add "%%n" /v "*PMARPOffload" /t REG_SZ /d "0" /f
reg add "%%n" /v "Downshift" /t REG_SZ /d "0" /f
reg add "%%n" /v "*EEE" /t REG_SZ /d "0" /f

rem ::: Enable Interrupt Moderation on Network Adapter
rem ::: Set Interrupt Moderation // ON = 1 OFF = 0
rem ::: Set Interrupt Throttling Rate (ITR) // 125 = Medium 0 = Off
reg add "%%n" /v "*InterruptModeration" /t REG_SZ /d "1" /f
reg add "%%n" /v "ITR" /t REG_SZ /d "125" /f

rem ::: Disabling JumboPackets: 1514 = Disabled
reg add "%%n" /v "*JumboPacket" /t REG_SZ /d "1514" /f

rem ::: Setting Network buffer sizes = 4096 [Default 1024]
reg add "%%n" /v "*ReceiveBuffers" /t REG_SZ /d "4096" /f
reg add "%%n" /v "*TransmitBuffers" /t REG_SZ /d "4096" /f

rem ::: Disabling Network Adapter QOS and other properties
reg add "%%n" /v "LogLinkStateEvent" /t REG_SZ /d "0" /f
reg add "%%n" /v "*QoS" /t REG_SZ /d "0" /f
reg add "%%n" /v "*PriorityVLANTag" /t REG_SZ /d "0" /f
reg add "%%n" /v "*RscIPv4" /t REG_SZ /d "0" /f
reg add "%%n" /v "*RscIPv6" /t REG_SZ /d "0" /f
reg add "%%n" /v "WakeOnLink" /t REG_SZ /d "0" /f
reg add "%%n" /v "WakeOnPing" /t REG_SZ /d "0" /f
reg add "%%n" /v "WakeFromPowerOff" /t REG_SZ /d "0" /f
reg add "%%n" /v "*PMNSOffload" /t REG_SZ /d "0" /f
reg add "%%n" /v "TxIntDelay" /t REG_SZ /d "0" /f
reg add "%%n" /v "TxAbsIntDelay" /t REG_SZ /d "0" /f
reg add "%%n" /v "RxIntDelay" /t REG_SZ /d "0" /f
reg add "%%n" /v "RxAbsIntDelay" /t REG_SZ /d "0" /f
reg add "%%n" /v "FlowControlCap" /t REG_SZ /d "0" /f

rem ::: Disable Power Management options
reg add "%%n" /v "PnPCapabilities" /t REG_DWORD /d "0x00000118" /f
)

rem ::: MSI mode support for Network Adapter
for /f %%i in ('wmic path Win32_NetworkAdapter get PNPDeviceID ^| findstr /l "PCI\VEN_"') do (
	reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f
	reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePriority" /t REG_DWORD /d "0" /f
)

rem ::: Maximum Transmission Unit (MTU)

rem ::: FastSendDatagramThreshold / FastCopyReceiveThreshold should match MTU value in decimal (usually 1472), not hexadecimal
rem ::: Setting FastSendDatagram to match MTU value of 1500
rem ::: Setting FastCopyReceiveThreshold to match MTU value of 1500
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "FastSendDatagramThreshold" /t REG_DWORD /d 1500 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "FastCopyReceiveThreshold" /t REG_DWORD /d 1500 /f

rem ::: Disabling MTU Discovery
rem ::: Disable automatic generated MTU value based on traffic
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnablePMTUDiscovery" /t REG_DWORD /d "0" /f

rem ::: Setting MTU size to 1500 on Network Adapter
netsh interface ipv4 set subinterface "Ethernet" mtu=1500 store=persistent

rem ::: Disabling TCP 1323 Options (Removes Timestamps - extra headers)
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v Tcp1323Opts /t REG_DWORD /d "0" /f

rem ::: Setting Congestion Provider to CUBIC
rem ::: CUBIC = Introduced in Windows 10? // pushes throughput until packet loss then reduces
rem ::: BBR2 = New option available in Windows 11 // better/faster but can cause connectivity issues
powershell -Command "netsh int tcp set global congestionprovider=CUBIC" >nul
powershell -Command "netsh int tcp set supplemental Internet CongestionProvider=CUBIC" >nul
powershell -Command "netsh int tcp set supplemental Datacenter CongestionProvider=CUBIC" >nul
powershell -Command "netsh int tcp set supplemental Compat CongestionProvider=CUBIC" >nul
powershell -Command "netsh int tcp set supplemental DatacenterCustom CongestionProvider=CUBIC" >nul
powershell -Command "netsh int tcp set supplemental InternetCustom CongestionProvider=CUBIC" >nul

rem ::: Enabling Network Direct Memory Access and Disabling Direct Cache Access, RSS and RSC settings globally.
powershell -Command "netsh int tcp set global netdma=enabled" >nul
powershell -Command "netsh int tcp set global dca=disabled" >nul
powershell -Command "netsh int tcp set global rss=disabled" >nul
powershell -Command "netsh int tcp set global rsc=disabled" >nul

rem ::: Disabling TCP timestamps globally.
powershell -Command "netsh int tcp set global timestamps=disabled" >nul

rem ::: Setting initial Retransmission Timeout (RTO) to 2000 milliseconds globally.
powershell -Command "netsh int tcp set global initialRto=2000" >nul

rem ::: Disabling Non-SACK RTT Resiliency globally.
powershell -Command "netsh int tcp set global nonsackrttresiliency=disabled" >nul

rem ::: Setting maximum SYN retransmissions to 2 globally.
powershell -Command "netsh int tcp set global maxsynretransmissions=2" >nul

rem ::: Setting dynamic port range for TCP on IPv4.
powershell -Command "netsh int ipv4 set dynamicport tcp start=10000 num=3000" >nul

rem ::: Disabling TCP Chimney Offload globally.
powershell -Command "Set-NetOffloadGlobalSetting -Chimney Disabled" >nul

rem ::: Disabling Checksum Offload on all network adapters.
powershell -Command "Disable-NetAdapterChecksumOffload -Name * -Confirm:$false" >nul

rem ::: Disabling Receive-Side Scaling on all network adapters.
powershell -Command "Disable-NetAdapterRss -Name * -Confirm:$false" >nul

rem ::: Disabling Receive Segment Coalescing on all network adapters.
powershell -Command "Disable-NetAdapterRsc -Name * -Confirm:$false" >nul

rem ::: Disabling Packet Coalescing Filter globally.
powershell -Command "Set-NetOffloadGlobalSetting -PacketCoalescingFilter Disabled" >nul

rem ::: Disabling Large Send Offload on all network adapters.
powershell -Command "Disable-NetAdapterLso -Name * -Confirm:$false" >nul

rem ::: Setting minimum RTO (Retransmission Timeout) to 300 milliseconds for InternetCustom profile.
powershell -Command "Set-NetTCPSetting -SettingName InternetCustom -MinRto 300" >nul

rem ::: Setting Initial Congestion Window size to 10 segments for InternetCustom profile.
powershell -Command "Set-NetTCPSetting -SettingName InternetCustom -InitialCongestionWindow 10" >nul

rem ::: Setting TCP AutoTuningLevel to Normal and disabling ScalingHeuristics for InternetCustom profile.
powershell -Command "Set-NetTCPSetting -SettingName InternetCustom -AutoTuningLevelLocal Enabled -ScalingHeuristics Disabled" >nul

rem ::: Disable Client for Microsoft Networks
powershell -Command "Get-NetAdapter -Physical | Where-Object {$_.Status -eq 'Up'} | ForEach-Object { Disable-NetAdapterBinding -Name $_.Name -ComponentID 'ms_msclient' -Confirm:$false }"

rem ::: Disable File and Printer Sharing for Microsoft Networks
powershell -Command "Get-NetAdapter -Physical | Where-Object {$_.Status -eq 'Up'} | ForEach-Object { Disable-NetAdapterBinding -Name $_.Name -ComponentID 'ms_server' -Confirm:$false }"

rem ::: Disable QoS Packet Scheduler
powershell -Command "Get-NetAdapter -Physical | Where-Object {$_.Status -eq 'Up'} | ForEach-Object { Disable-NetAdapterBinding -Name $_.Name -ComponentID 'ms_pacer' -Confirm:$false }"

rem ::: Disable Microsoft LLDP Protocol Driver
powershell -Command "Get-NetAdapter -Physical | Where-Object {$_.Status -eq 'Up'} | ForEach-Object { Disable-NetAdapterBinding -Name $_.Name -ComponentID 'ms_lldp' -Confirm:$false }"

rem ::: Disable Microsoft Network Adapter Multiplexor Protocol
powershell -Command "Get-NetAdapter -Physical | Where-Object {$_.Status -eq 'Up'} | ForEach-Object { Disable-NetAdapterBinding -Name $_.Name -ComponentID 'ms_implat' -Confirm:$false }"

rem ::: Disable Link-Layer Topology Discovery Responder
powershell -Command "Get-NetAdapter -Physical | Where-Object {$_.Status -eq 'Up'} | ForEach-Object { Disable-NetAdapterBinding -Name $_.Name -ComponentID 'ms_rspndr' -Confirm:$false }"

rem ::: Disable Link-Layer Topology Discovery Mapper I/O Driver
powershell -Command "Get-NetAdapter -Physical | Where-Object {$_.Status -eq 'Up'} | ForEach-Object { Disable-NetAdapterBinding -Name $_.Name -ComponentID 'ms_lltdio' -Confirm:$false }"

rem ::: Disable IPv6 (note: this doesn't fully disable IPv6 OS-wide)
powershell -Command "Disable-NetAdapterBinding -Name '*' -ComponentID 'ms_tcpip6' -Confirm:$false"

rem ::: Reset WINS server entries
wmic nicconfig where (IPEnabled=true) call SetWINSServer ""

rem ::: Disable NetBIOS over TCP/IP on all NICs
wmic nicconfig where (IPEnabled=true and TcpipNetbiosOptions!=2) call SetTcpipNetbios 2

rem ::: Disable LMHOSTS lookup
reg add "HKLM\SYSTEM\CurrentControlSet\Services\NetBT\Parameters" /v EnableLMHOSTS /t REG_DWORD /d 0 /f

@echo off

echo.

echo REBOOT YOUR PC

echo.

PAUSE
