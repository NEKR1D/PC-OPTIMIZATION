rem ::: Window Services Tweaks

rem ::: Created by NEKR1D

rem ::: Stops and disables unnecessary windows services

@echo off   

echo Starting - Disabling and stopping Window services...  
echo.

setlocal

set SERVICES=^
AppVClient ^
AssignedAccessManager ^
BcastDVRUserService ^
DiagTrack ^
DialogBlockingS ^
DPS ^
EventLog ^
jhi_service ^
lmhosts ^
NetTcpPortSharing ^
NlaSvc ^
PcaSvc ^
PrintDeviceConf ^
PrintScanBrokerService ^
remoteAccess ^
remoteRegistry ^
RetailDemo ^
shpamsvc ^
Spooler ^
ssh-agent ^
SysMain ^
UevAgentService ^
WbioSrvc ^
Wecsvc ^
WerSvc ^
WSearch ^
XblAuthManager ^
XblGameSave ^
XboxGipSvc ^
XboxNetApiSvc ^
ZTHELPER 

for %%S in (%SERVICES%) do (
    echo Stopping service: %%S
    sc stop "%%S"
    timeout /t 0 >nul
    echo Disabling service: %%S
    sc config "%%S" start= disabled
    echo.
)

rem ::: Force Disabling Services via Registry

rem ::: Disable SysMain service (Superfetch)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SysMain" /v Start /t REG_DWORD /d 4 /f

rem ::: Disable WbioSrvc service (Windows Biometric Service)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WbioSrvc" /v Start /t REG_DWORD /d 4 /f

rem ::: Disable UevAgentService service (User Experience Virtualization Service)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\UevAgentService" /v Start /t REG_DWORD /d 4 /f

rem ::: Disable shpamsvc service (SHPA Management Service)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\shpamsvc" /v Start /t REG_DWORD /d 4 /f

rem ::: Disable RetailDemo service (Retail Demo Service)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\RetailDemo" /v Start /t REG_DWORD /d 4 /f

rem ::: Disable ssh-agent service (OpenSSH Authentication Agent)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\ssh-agent" /v Start /t REG_DWORD /d 4 /f

rem ::: Disable Spooler service (Print Spooler)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Spooler" /v Start /t REG_DWORD /d 4 /f

rem ::: Disable XboxGipSvc service (Xbox Game Input Service)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\XboxGipSvc" /v Start /t REG_DWORD /d 4 /f

rem ::: Disable XblGameSave service (Xbox Live Game Save)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\XblGameSave" /v Start /t REG_DWORD /d 4 /f

rem ::: Disable ZTHELPER service (ZTE Help Service)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\ZTHELPER" /v Start /t REG_DWORD /d 4 /f

rem ::: Disable XboxNetApiSvc service (Xbox Live Networking Service)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\XboxNetApiSvc" /v Start /t REG_DWORD /d 4 /f

rem ::: Disable WerSvc service (Windows Error Reporting Service)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WerSvc" /v Start /t REG_DWORD /d 4 /f

rem ::: Disable Wecsvc service (Windows Event Collector)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Wecsvc" /v Start /t REG_DWORD /d 4 /f

rem ::: Disable XblAuthManager service (Xbox Live Authentication Manager)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\XblAuthManager" /v Start /t REG_DWORD /d 4 /f

rem ::: Disable WSearch service (Windows Search)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WSearch" /v Start /t REG_DWORD /d 4 /f

rem ::: Disable DPS service (Diagnostic Policy Service)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DPS" /v Start /t REG_DWORD /d 4 /f

rem ::: Disable DialogBlockingS service (Dialog Blocking Service)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DialogBlockingS" /v Start /t REG_DWORD /d 4 /f

rem ::: Disable jhi_service service (Intel(R) Dynamic Application Loader Host Interface Service)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\jhi_service" /v Start /t REG_DWORD /d 4 /f

rem ::: Disable EventLog service (Windows Event Log)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\EventLog" /v Start /t REG_DWORD /d 4 /f

rem ::: Disable AssignedAccessManager service (Assigned Access Manager)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AssignedAccessManager" /v Start /t REG_DWORD /d 4 /f

rem ::: Disable AppVClient service (Microsoft Application Virtualization Client)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AppVClient" /v Start /t REG_DWORD /d 4 /f

rem ::: Disable DiagTrack service (Diagnostics Tracking Service)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DiagTrack" /v Start /t REG_DWORD /d 4 /f

rem ::: Disable BcastDVRUserService service (Broadcast DVR User Service)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\BcastDVRUserService" /v Start /t REG_DWORD /d 4 /f

rem ::: Disable PrintScanBrokerService service (Print Scan Broker Service)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\PrintScanBrokerService" /v Start /t REG_DWORD /d 4 /f

rem ::: Disable PrintDeviceConf service (Print Device Configuration Service)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\PrintDeviceConf" /v Start /t REG_DWORD /d 4 /f

rem ::: Disable rem :::oteRegistry service (rem :::ote Registry)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\remoteRegistry" /v Start /t REG_DWORD /d 4 /f

rem ::: Disable rem :::oteAccess service (Routing and rem :::ote Access)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\remoteAccess" /v Start /t REG_DWORD /d 4 /f

rem ::: Disable NetTcpPortSharing service (Net.Tcp Port Sharing Service)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\NetTcpPortSharing" /v Start /t REG_DWORD /d 4 /f

rem ::: Disable lmhosts service (TCP/IP NetBIOS Helper)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\lmhosts" /v Start /t REG_DWORD /d 4 /f

rem ::: Disable PcaSvc service (Program Compatibility Assistant Service)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\PcaSvc" /v Start /t REG_DWORD /d 4 /f

rem ::: Disable NlaSvc service (Network Location Awareness)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\NlaSvc" /v Start /t REG_DWORD /d 4 /f
   
echo  Completed - Windows Services have been stopped and disabled ...

pause
