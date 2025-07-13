rem ::: Network Tweaks

rem ::: Plundered and updated by NEKR1D
rem ::: Originally created by Shoober420

rem ::: !!! Warning !!!
rem ::: !!! Your hardware and devices are different !!!
rem ::: !!! May brick your NIC connectivity !!!
rem ::: !!! Use script as reference only !!!

if not exist C:\Windows\System32\wbem\WMIC.exe (
    echo Installing WMIC...
    DISM /Online /Add-Capability /CapabilityName:WMIC~~~~
    echo Done.
)

TIMEOUT 1

@echo off
echo.
echo Starting Network Tweaks Script...
echo.

echo Setting DNS as Cloudflare 1.1.1.1 / 1.0.0.1
netsh interface ipv4 set dnsservers name="Ethernet" static 1.1.1.1 primary
netsh interface ipv4 add dnsservers name="Ethernet" address=1.0.0.1 index=2

echo Enabling DNS over HTTPS (DoH)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "EnableAutoDoh" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "EnableDoh" /t REG_DWORD /d "2" /f

rem ::: Require DoH / 2 - Allow DoH / 1 - Prohibit DoH
echo Forcing requirement of DoH
reg add "HKLM\Software\Policies\Microsoft\Windows NT\DNSClient" /v "DoHPolicy" /t REG_DWORD /d "3" /f

echo Disable TCP/IP NetBIOS Helper (lmhosts)

net stop lmhosts
reg add "HKLM\SYSTEM\CurrentControlSet\Services\lmhosts" /v "Start" /t REG_DWORD /d "4" /f

echo "Setting default TTL value in TCP/IP parameters to 64."
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /t REG_DWORD /v DefaultTTL /d 64 /f

echo "Setting maximum user port number in TCP/IP parameters to 65534."
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /t REG_DWORD /v MaxUserPort /d 65534 /f

echo "Setting TCP timed wait delay in TCP/IP parameters to 30 seconds."
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /t REG_DWORD /v TcpTimedWaitDelay /d 30 /f

echo "Disabling non-best effort bandwidth limit in QoS policies."
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Psched" /t REG_DWORD /v NonBestEffortLimit /d 0 /f

echo "Configuring QoS to not use Network Layer Authentication."
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Tcpip\QoS" /t REG_SZ /v "Do not use NLA" /d 1 /f

echo "Adjusting LanmanServer parameters for optimized file sharing performance."
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /t REG_DWORD /v Size /d 3 /f

rem ::: Network Throttle // Default = 10 Unthrottled = 4294967295 [Decimal Values]
echo "Setting network throttling index in multimedia system profile"
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /t REG_DWORD /v NetworkThrottlingIndex /d 4294967295 /f

rem ::: Set system responsiveness
echo "Setting system responsiveness to maximum in multimedia system profile."
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /T REG_DWORD /v SystemResponsiveness /d 0 /f

echo "Applying NSI registry settings for network performance optimization."
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Nsi\{eb004a03-9b1a-11d4-9123-0050047759bc}\26" /v "00000000" /t REG_BINARY /d "0000000000000000000000000500000000000000000000000000000000000000ff00000000000000" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Nsi\{eb004a03-9b1a-11d4-9123-0050047759bc}\26" /v "04000000" /t REG_BINARY /d "0000000000000000000000000500000000000000000000000000000000000000ff00000000000000" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Nsi\{eb004a03-9b1a-11d4-9123-0050047759bc}\0" /v "0200" /t REG_BINARY /d "0000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000ff000000000000000000000000000000000000000000ff000000000000000000000000000000" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Nsi\{eb004a03-9b1a-11d4-9123-0050047759bc}\0" /v "1700" /t REG_BINARY /d "0000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000ff000000000000000000000000000000000000000000ff000000000000000000000000000000" /f

echo "Setting priority levels for DNS, Hosts, Local, and NetBT services."
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "DnsPriority" /t REG_DWORD /d "6" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "HostsPriority" /t REG_DWORD /d "5" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "LocalPriority" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "NetbtPriority" /t REG_DWORD /d "7" /f

echo "Setting IRPStackSize for LanmanServer to enhance file sharing capabilities."
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /t REG_DWORD /v IRPStackSize /d 30 /f

echo Setting Packet Scheduler Timer Resolution = 1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" /v "TimerResolution" /t REG_DWORD /d "1" /f

echo Setting Packet Scheduler - Limit outstanding packets = 0
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" /v "MaxOutstandingSends" /t REG_DWORD /d "0" /f

echo Setting Packet Scheduler - Limit reservable bandwidth = 0
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" /v "NonBestEffortLimit" /t REG_DWORD /d "0" /f

rem ::: Get the Sub ID of the Network Adapter

for /f %%n in ('Reg query "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4D36E972-E325-11CE-BFC1-08002bE10318}" /v "*SpeedDuplex" /s ^| findstr  "HKEY"') do (

rem ::: Speed & Duplex must be set to "Auto Negotiation" or internet borks unless you know correct value [6 = 2.5 Gbit]

echo Setting NIC SpeedDuplex to 2.5 Gbit [1Gbit = 6]
reg add "%%n" /v "*SpeedDuplex" /t REG_SZ /d "7" /f

rem ::: MIMO Power Save Mode - 3 Disable
echo Disabling MIMO Power Save Mode
reg add "%%n" /v "MIMOPowerSaveMode" /t REG_SZ /d "3" /f

rem ::: Disable most offloading settings on NIC [visible in device manager]
echo Disabling NIC offloading, rss, wake-on-LAN, mircast, etc.
reg add "%%n" /v "*WakeOnMagicPacket" /t REG_SZ /d "0" /f
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

rem ::: Enable Interrupt Moderation on NIC [visible in device manager properties]
rem ::: Set Interrupt Moderation Rate: Interrupt Throttling Rate (ITR) // 125 = Medium 0 = Off
echo Disabling Interrupt Moderation on NIC [visible in device manager properties]
reg add "%%n" /v "*InterruptModeration" /t REG_SZ /d "0" /f

reg add "%%n" /v "ITR" /t REG_SZ /d "125" /f

rem ::: JumboPacket: 1514 = Disabled
echo Disabling JumboPackets
reg add "%%n" /v "*JumboPacket" /t REG_SZ /d "1514" /f

rem ::: Disabling NIC QOS, setting buffer sizes = 4096, etc.
echo Disabling NIC QOS, setting buffer sizes = 4096, etc.
reg add "%%n" /v "LogLinkStateEvent" /t REG_SZ /d "0" /f
reg add "%%n" /v "*QoS" /t REG_SZ /d "0" /f
reg add "%%n" /v "*PriorityVLANTag" /t REG_SZ /d "0" /f
reg add "%%n" /v "*ReceiveBuffers" /t REG_SZ /d "4096" /f
reg add "%%n" /v "*TransmitBuffers" /t REG_SZ /d "4096" /f
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

rem ::: MSI mode support for NIC
for /f %%i in ('wmic path Win32_NetworkAdapter get PNPDeviceID ^| findstr /l "PCI\VEN_"') do (
	reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f
	reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePriority" /t REG_DWORD /d "0" /f
)

rem ::: NIC Tweaks

rem ::: Last key changes based on NIC card registry ID
rem ::: Find "Class Guid" under Device Manager > Network adapters > Properties > Details tab
rem ::: Go to "HKLM\SYSTEM\CurrentControlSet\Control\Network\"Class Guid"\<NIC ID>\Connection" to get NIC ID
rem ::: https://www.elevenforum.com/members/garlin.5387/
rem ::: https://www.elevenforum.com/t/find-nic-class-guid-in-batch-script-using-wmic-or-anything-else.30083/

rem ::: Disable Nagle's Algorithm and NETBIOS

for /f "delims=" %%n in ('wmic nic where "GUID is not null" get guid ^| findstr /v GUID') do (
   reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%n" /v TCPNoDelay /t REG_DWORD /d 1 /f
   reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%n" /v TcpNoDelay /t REG_DWORD /d 1 /f
   reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%n" /v TcpDelAckTicks /t REG_DWORD /d 1 /f
   reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%n" /v TcpAckFrequency /t REG_DWORD /d 1 /f
   reg add "HKLM\SYSTEM\CurrentControlSet\Services\NetBT\Parameters\Interfaces\Tcpip_%%n" /v NetbiosOptions /t REG_DWORD /d 2 /f
)

rem ::: Maximum Transmission Unit (MTU)

echo.

rem ::: FastSendDatagramThreshold / FastCopyReceiveThreshold should match MTU value in decimal, not hexadecimal (usually 1472)
echo Setting FastSendDatagram to match MTU value of 1500
echo Setting FastCopyReceiveThreshold to match MTU value of 1500
echo Disabling MTU Discovery/Auto Mode
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "FastSendDatagramThreshold" /t REG_DWORD /d 1500 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "FastCopyReceiveThreshold" /t REG_DWORD /d 1500 /f

rem ::: Disables MTU Discovery, which auto sets MTU value randomly based on traffic, never enable
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnablePMTUDiscovery" /t REG_DWORD /d "0" /f

rem ::: Set MTU = 1500 on NIC
echo Setting MTU size to 1500 on NIC
netsh interface ipv4 set subinterface "Ethernet" mtu=1500 store=persistent

rem ::: Setting congestion provider to BBR2 [new option available in Windows 11 is faster]
echo Setting Internet congestion provider to BBR2
echo Setting Datacenter congestion provider to BBR2
echo Setting Compat congestion provider to BBR2
echo Setting DatacenterCustom congestion provider to BBR2
echo Setting InternetCustom congestion provider to BBR2
powershell -Command "netsh int tcp set supplemental Template=Internet CongestionProvider=bbr2" >nul
powershell -Command "netsh int tcp set supplemental Template=Datacenter CongestionProvider=bbr2" >nul
powershell -Command "netsh int tcp set supplemental Template=Compat CongestionProvider=bbr2" >nul
powershell -Command "netsh int tcp set supplemental Template=DatacenterCustom CongestionProvider=bbr2" >nul
powershell -Command "netsh int tcp set supplemental Template=InternetCustom CongestionProvider=bbr2" >nul

echo Enabling Network Direct Memory Access and Disabling Direct Cache Access, RSS and RSC settings globally.
powershell -Command "netsh int tcp set global netdma=enabled dca=disabled rss=disabled rsc=disabled" >nul

echo Disabling TCP timestamps globally.
powershell -Command "netsh int tcp set global timestamps=disabled" >nul

echo Setting initial Retransmission Timeout (RTO) to 2000 milliseconds globally.
powershell -Command "netsh int tcp set global initialRto=2000" >nul

echo Disabling Non-SACK RTT Resiliency globally.
powershell -Command "netsh int tcp set global nonsackrttresiliency=disabled" >nul

echo Setting maximum SYN retransmissions to 2 globally.
powershell -Command "netsh int tcp set global maxsynretransmissions=2" >nul

echo Setting dynamic port range for TCP on IPv4.
powershell -Command "netsh int ipv4 set dynamicport tcp start=10000 num=3000" >nul

echo Disabling TCP Chimney Offload globally.
powershell -Command "Set-NetOffloadGlobalSetting -Chimney Disabled" >nul

echo Disabling Checksum Offload on all network adapters.
powershell -Command "Disable-NetAdapterChecksumOffload -Name * -Confirm:$false" >nul

echo Disabling Receive-Side Scaling on all network adapters.
powershell -Command "Disable-NetAdapterRss -Name * -Confirm:$false" >nul

echo Disabling Receive Segment Coalescing on all network adapters.
powershell -Command "Disable-NetAdapterRsc -Name * -Confirm:$false" >nul

echo Disabling Packet Coalescing Filter globally.
powershell -Command "Set-NetOffloadGlobalSetting -PacketCoalescingFilter Disabled" >nul

echo Disabling Large Send Offload on all network adapters.
powershell -Command "Disable-NetAdapterLso -Name * -Confirm:$false" >nul

echo Setting minimum RTO (Retransmission Timeout) to 300 milliseconds for InternetCustom profile.
powershell -Command "Set-NetTCPSetting -SettingName InternetCustom -MinRto 300" >nul

echo Setting Initial Congestion Window size to 10 segments for InternetCustom profile.
powershell -Command "Set-NetTCPSetting -SettingName InternetCustom -InitialCongestionWindow 10" >nul

echo Setting TCP AutoTuningLevel to Normal and disabling ScalingHeuristics for InternetCustom profile.
powershell -Command "Set-NetTCPSetting -SettingName InternetCustom -AutoTuningLevelLocal Normal -ScalingHeuristics Disabled" >nul

echo.

echo Network Tweaks Script Completed...

PAUSE
