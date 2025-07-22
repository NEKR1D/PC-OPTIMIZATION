rem ::: Window Services Tweaks

rem ::: Created by NEKR1D

rem ::: Stops then disables unnecessary windows services
rem ::: Creates registry entry for each to force disable (added as an extra measure)
rem ::: Requires administrative privileges

@echo Off

echo. 
echo ===============================================================================
echo     ... Starting - Stopping and Disabling Unnecessary Windows Services ...
echo ===============================================================================
echo.

@echo On

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

@echo Off

echo. 
echo ===============================================================================
echo ... Completed - Unnecessary Windows Services have been stopped and disabled ...
echo ===============================================================================
echo.

pause
