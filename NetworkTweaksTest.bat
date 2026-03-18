rem ::: Network Tweaks 
rem ::: Plundered by NEKR1D 

rem ::: !!! Warning !!!
rem ::: !!! Your hardware and devices are different !!!
rem ::: !!! May cause Network Adapter driver conflicts and break all connectivity !!!
rem ::: !!! Use script as reference only !!!

rem ::: (Revised for Stability and Latency)

rem ::: Installing WMIC...
if not exist C:\Windows\System32\wbem\WMIC.exe (
DISM /Online /Add-Capability /CapabilityName:WMIC~~~~
)

TIMEOUT 1

@echo off

rem ::: Disable Nagle's Algorithm and modify ACK
setlocal enabledelayedexpansion
for /f "tokens=2 delims==" %%A in ('wmic nic where "NetEnabled=true and AdapterTypeID=0" get DeviceID /value ^| find "DeviceID"') do (
set DEV_ID=%%A
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

set REG_PATH=HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%GUID%

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

rem ::: Setting DNS dynamically for active adapters
powershell -Command "Get-NetAdapter -Physical | Where-Object {$_.Status -eq 'Up'} | Set-DnsClientServerAddress -ServerAddresses '1.1.1.1','1.0.0.1'"

rem ::: Flush DNS & Reset Sockets
ipconfig /flushdns
netsh winsock reset

rem ::: Enabling DNS over HTTPS (DoH)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "EnableAutoDoh" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "EnableDoh" /t REG_DWORD /d "2" /f

rem ::: Require DoH = 3 / Enable DoH = 2 / Prohibit DoH = 1
rem ::: Requiring DoH (3) can cause conflicts with ISP DNS and third-party VPN DNS that aren't configurable and can't handle this flag correctly
rem ::: Enabling DoH (2) resolved conflicts and isn't worth investigating furthur. Just be aware forcing DoH (3) can cause unreachable network traffic/websites/services in some scenarios.
reg add "HKLM\Software\Policies\Microsoft\Windows NT\DNSClient" /v "DoHPolicy" /t REG_DWORD /d "2" /f

rem ::: Disable TCP/IP NetBIOS Helper Service (lmhosts)
net stop lmhosts
reg add "HKLM\SYSTEM\CurrentControlSet\Services\lmhosts" /v "Start" /t REG_DWORD /d "4" /f

rem ::: TCP/IP & QoS Parameters
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /t REG_DWORD /v DefaultTTL /d 64 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /t REG_DWORD /v MaxUserPort /d 65534 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /t REG_DWORD /v TcpTimedWaitDelay /d 30 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Psched" /t REG_DWORD /v NonBestEffortLimit /d 0 /f
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Tcpip\QoS" /t REG_SZ /v "Do not use NLA" /d 1 /f

rem ::: System Responsiveness & Throttling
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /t REG_DWORD /v NetworkThrottlingIndex /d 4294967295 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /T REG_DWORD /v SystemResponsiveness /d 0 /f

rem ::: Network Adapter Speed, Power, and Offloads
for /f %%n in ('Reg query "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4D36E972-E325-11CE-BFC1-08002bE10318}" /v "*SpeedDuplex" /s ^| findstr  "HKEY"') do (
reg add "%%n" /v "*SpeedDuplex" /t REG_SZ /d "0" /f
reg add "%%n" /v "MIMOPowerSaveMode" /t REG_SZ /d "3" /f
reg add "%%n" /v "PnPCapabilities" /t REG_DWORD /d "0x00000118" /f
reg add "%%n" /v "PnpDevicePowerManagement" /t REG_DWORD /d "0" /f
reg add "%%n" /v "*DeviceSleepOnDisconnect" /t REG_DWORD /d "0" /f
reg add "%%n" /v "*EEE" /t REG_SZ /d "0" /f
reg add "%%n" /v "*WakeOnMagicPacket" /t REG_SZ /d "0" /f
reg add "%%n" /v "WakeOnMagicPacketFromS5" /t REG_SZ /d 0 /f
reg add "%%n" /v "*WakeOnPattern" /t REG_SZ /d "0" /f
reg add "%%n" /v "WakeOnLink" /t REG_SZ /d "0" /f
reg add "%%n" /v "WakeOnPing" /t REG_SZ /d "0" /f
reg add "%%n" /v "WakeFromPowerOff" /t REG_SZ /d "0" /f
reg add "%%n" /v "*PacketCoalescing" /t REG_SZ /d "0" /f
reg add "%%n" /v "ThroughputBoosterEnabled" /t REG_SZ /d "1" /f
reg add "%%n" /v "FatChannelIntolerant" /t REG_SZ /d "0" /f
reg add "%%n" /v "*MiracastSupported" /t REG_DWORD /d "0" /f
reg add "%%n" /v "RoamAggressiveness" /t REG_SZ /d "0" /f
reg add "%%n" /v "RoamingPreferredBandType" /t REG_SZ /d "3" /f
reg add "%%n" /v "uAPSDSupport" /t REG_SZ /d "0" /f
reg add "%%n" /v "*FlowControl" /t REG_SZ /d "0" /f
reg add "%%n" /v "*RSS" /t REG_SZ /d "1" /f
reg add "%%n" /v "*InterruptModeration" /t REG_SZ /d "0" /f
reg add "%%n" /v "ITR" /t REG_SZ /d "0" /f
reg add "%%n" /v "*JumboPacket" /t REG_SZ /d "1514" /f
reg add "%%n" /v "LogLinkStateEvent" /t REG_SZ /d "0" /f
reg add "%%n" /v "*QoS" /t REG_SZ /d "0" /f
reg add "%%n" /v "*PriorityVLANTag" /t REG_SZ /d "0" /f
reg add "%%n" /v "*RscIPv4" /t REG_SZ /d "0" /f
reg add "%%n" /v "*RscIPv6" /t REG_SZ /d "0" /f
reg add "%%n" /v "TxIntDelay" /t REG_SZ /d "0" /f
reg add "%%n" /v "TxAbsIntDelay" /t REG_SZ /d "0" /f
reg add "%%n" /v "RxIntDelay" /t REG_SZ /d "0" /f
reg add "%%n" /v "RxAbsIntDelay" /t REG_SZ /d "0" /f
)

rem ::: MSI mode support for Network Adapter
for /f %%i in ('wmic path Win32_NetworkAdapter get PNPDeviceID ^| findstr /l "PCI\VEN_"') do (
reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePriority" /t REG_DWORD /d "3" /f
)

rem ::: Global TCP/IP Optimizations
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v Tcp1323Opts /t REG_DWORD /d "0" /f
powershell -Command "netsh int tcp set global congestionprovider=CUBIC" >nul
powershell -Command "netsh int tcp set supplemental Internet CongestionProvider=CUBIC" >nul
powershell -Command "netsh int tcp set global netdma=enabled" >nul
powershell -Command "netsh int tcp set global dca=disabled" >nul
powershell -Command "netsh int tcp set global rss=enabled" >nul
powershell -Command "netsh int tcp set global rsc=disabled" >nul
powershell -Command "netsh int tcp set global timestamps=disabled" >nul
powershell -Command "netsh int tcp set global initialRto=2000" >nul
powershell -Command "netsh int tcp set global nonsackrttresiliency=disabled" >nul
powershell -Command "netsh int tcp set global maxsynretransmissions=2" >nul
powershell -Command "netsh int ipv4 set dynamicport tcp start=10000 num=3000" >nul
powershell -Command "Set-NetOffloadGlobalSetting -Chimney Disabled" >nul
powershell -Command "Set-NetOffloadGlobalSetting -PacketCoalescingFilter Disabled" >nul

rem ::: InternetCustom Profile Optimizations
powershell -Command "Set-NetTCPSetting -SettingName InternetCustom -MinRto 300" >nul
powershell -Command "Set-NetTCPSetting -SettingName InternetCustom -InitialCongestionWindow 10" >nul
powershell -Command "Set-NetTCPSetting -SettingName InternetCustom -AutoTuningLevelLocal Enabled -ScalingHeuristics Disabled" >nul

rem ::: Remove all other NIC Bindings - Only IPv4 Enabled
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

rem ::: Disable IPv6 (note: this doesn't fully disable IPv6 OS-wide, just the binding)
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