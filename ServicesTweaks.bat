rem ::: Window Services Tweaks

rem ::: Created by NEKR1D

rem ::: Stops and disables unnecessary windows services
rem ::: Creates registry entry to force disable unnecessary windows services
rem ::: Requires administrative privileges

@echo On

echo Starting - Disabling and stopping Window services  
echo.

rem :::====================================================
rem ::: STOP unnecessary windows services one at a time
rem :::====================================================

rem ::: Disable Microsoft App-V Client
powershell -Command "Stop-Service -Name 'AppVClient' -Force -ErrorAction SilentlyContinue"
rem ::: Disable AssignedAccessManager Service
powershell -Command "Stop-Service -Name 'AssignedAccessManager' -Force -ErrorAction SilentlyContinue"
rem ::: Disable GameDVR and Broadcast User Service
powershell -Command "Stop-Service -Name 'BcastDVRUserService' -Force -ErrorAction SilentlyContinue"
rem ::: Disable Bluetooth User Support Service
powershell -Command "Stop-Service -Name 'BluetoothUserService' -Force -ErrorAction SilentlyContinue"
rem ::: Disable GameDVR and Broadcast User Service (duplicate)
powershell -Command "Stop-Service -Name 'BcastDVRUserService' -Force -ErrorAction SilentlyContinue"
rem ::: Disable Bluetooth Support Service
powershell -Command "Stop-Service -Name 'bthserv' -Force -ErrorAction SilentlyContinue"
rem ::: Disable Offline Files
powershell -Command "Stop-Service -Name 'CscService' -Force -ErrorAction SilentlyContinue"
rem ::: Disable Connected User Experiences and Telemetry
powershell -Command "Stop-Service -Name 'DiagTrack' -Force -ErrorAction SilentlyContinue"
rem ::: Disable Dialog Blocking Service
powershell -Command "Stop-Service -Name 'DialogBlockingS' -Force -ErrorAction SilentlyContinue"
rem ::: Disable Diagnostic Policy Service
powershell -Command "Stop-Service -Name 'DPS' -Force -ErrorAction SilentlyContinue"
rem ::: Disable Windows Event Log
powershell -Command "Stop-Service -Name 'EventLog' -Force -ErrorAction SilentlyContinue"
rem ::: Disable Intel(R) Dynamic Application Loader Host Interface Service
powershell -Command "Stop-Service -Name 'jhi_service' -Force -ErrorAction SilentlyContinue"
rem ::: Disable Link-Layer Topology Discovery Mapper
powershell -Command "Stop-Service -Name 'lltdsvc' -Force -ErrorAction SilentlyContinue"
rem ::: Disable TCP/IP NetBIOS Helper
powershell -Command "Stop-Service -Name 'lmhosts' -Force -ErrorAction SilentlyContinue"
rem ::: Disable Internet Connection Sharing (ICS)
powershell -Command "Stop-Service -Name 'icssvc' -Force -ErrorAction SilentlyContinue"
rem ::: Disable Messaging Service
powershell -Command "Stop-Service -Name 'MessagingService' -Force -ErrorAction SilentlyContinue"
rem ::: Disable Net.Tcp Port Sharing Service
powershell -Command "Stop-Service -Name 'NetTcpPortSharing' -Force -ErrorAction SilentlyContinue"
rem ::: Disable Network Location Awareness
powershell -Command "Stop-Service -Name 'NlaSvc' -Force -ErrorAction SilentlyContinue"
rem ::: Disable Sync Host
powershell -Command "Stop-Service -Name 'OneSyncSvc' -Force -ErrorAction SilentlyContinue"
rem ::: Disable Phone Service
powershell -Command "Stop-Service -Name 'PhoneSvc' -Force -ErrorAction SilentlyContinue"
rem ::: Disable Program Compatibility Assistant Service
powershell -Command "Stop-Service -Name 'PcaSvc' -Force -ErrorAction SilentlyContinue"
rem ::: Disable Print Workflow Device Installation Service
powershell -Command "Stop-Service -Name 'PrintDeviceConf' -Force -ErrorAction SilentlyContinue"
rem ::: Disable Print Workflow Service
powershell -Command "Stop-Service -Name 'PrintScanBrokerService' -Force -ErrorAction SilentlyContinue"
rem ::: Disable Quality Windows Audio Video Experience
powershell -Command "Stop-Service -Name 'QWAVE' -Force -ErrorAction SilentlyContinue"
rem ::: Disable Routing and Remote Access
powershell -Command "Stop-Service -Name 'remoteAccess' -Force -ErrorAction SilentlyContinue"
rem ::: Disable Remote Registry
powershell -Command "Stop-Service -Name 'remoteRegistry' -Force -ErrorAction SilentlyContinue"
rem ::: Disable Radio Management Service
powershell -Command "Stop-Service -Name 'RmSvc' -Force -ErrorAction SilentlyContinue"
rem ::: Disable Retail Demo Service
powershell -Command "Stop-Service -Name 'RetailDemo' -Force -ErrorAction SilentlyContinue"
rem ::: Disable Smart Card
powershell -Command "Stop-Service -Name 'SCardSvr' -Force -ErrorAction SilentlyContinue"
rem ::: Disable Shared PC Account Manager
powershell -Command "Stop-Service -Name 'shpamsvc' -Force -ErrorAction SilentlyContinue"
rem ::: Disable Internet Connection Sharing (ICS)
powershell -Command "Stop-Service -Name 'SharedAccess' -Force -ErrorAction SilentlyContinue"
rem ::: Disable Print Spooler
powershell -Command "Stop-Service -Name 'Spooler' -Force -ErrorAction SilentlyContinue"
rem ::: Disable OpenSSH Authentication Agent
powershell -Command "Stop-Service -Name 'ssh-agent' -Force -ErrorAction SilentlyContinue"
rem ::: Disable SysMain (Superfetch)
powershell -Command "Stop-Service -Name 'SysMain' -Force -ErrorAction SilentlyContinue"
rem ::: Disable Payments and NFC/SE Manager
powershell -Command "Stop-Service -Name 'SEMgrSvc' -Force -ErrorAction SilentlyContinue"
rem ::: Disable Tablet PC Input Service
powershell -Command "Stop-Service -Name 'TabletInputService' -Force -ErrorAction SilentlyContinue"
rem ::: Disable User Experience Virtualization Service
powershell -Command "Stop-Service -Name 'UevAgentService' -Force -ErrorAction SilentlyContinue"
rem ::: Disable Windows Biometric Service
powershell -Command "Stop-Service -Name 'WbioSrvc' -Force -ErrorAction SilentlyContinue"
rem ::: Disable Windows Event Collector
powershell -Command "Stop-Service -Name 'Wecsvc' -Force -ErrorAction SilentlyContinue"
rem ::: Disable Windows Error Reporting Service
powershell -Command "Stop-Service -Name 'WerSvc' -Force -ErrorAction SilentlyContinue"
rem ::: Disable Still Image Acquisition Events
powershell -Command "Stop-Service -Name 'WiaRpc' -Force -ErrorAction SilentlyContinue"
rem ::: Disable Windows Insider Service
powershell -Command "Stop-Service -Name 'wisvc' -Force -ErrorAction SilentlyContinue"
rem ::: Disable Windows Search
powershell -Command "Stop-Service -Name 'WSearch' -Force -ErrorAction SilentlyContinue"
rem ::: Disable Microsoft Account Sign-in Assistant
powershell -Command "Stop-Service -Name 'wlidsvc' -Force -ErrorAction SilentlyContinue"
rem ::: Disable Xbox Live Auth Manager
powershell -Command "Stop-Service -Name 'XblAuthManager' -Force -ErrorAction SilentlyContinue"
rem ::: Disable Xbox Live Game Save
powershell -Command "Stop-Service -Name 'XblGameSave' -Force -ErrorAction SilentlyContinue"
rem ::: Disable Xbox Accessory Management Service
powershell -Command "Stop-Service -Name 'XboxGipSvc' -Force -ErrorAction SilentlyContinue"
rem ::: Disable Xbox Live Networking Service
powershell -Command "Stop-Service -Name 'XboxNetApiSvc' -Force -ErrorAction SilentlyContinue"
rem ::: Disable ZT Helper Service
powershell -Command "Stop-Service -Name 'ZTHELPER' -Force -ErrorAction SilentlyContinue"

rem :::====================================================
rem ::: Disables unnecessary windows services one at a time
rem :::====================================================
rem ::: Disable Microsoft App-V Client
powershell -Command "Set-Service -Name 'AppVClient' -StartupType Disabled"
rem ::: Disable Assigned Access Manager Service
powershell -Command "Set-Service -Name 'AssignedAccessManager' -StartupType Disabled"
rem ::: Disable GameDVR and Broadcast User Service
powershell -Command "Set-Service -Name 'BcastDVRUserService' -StartupType Disabled"
rem ::: Disable Bluetooth User Support Service
powershell -Command "Set-Service -Name 'BluetoothUserService' -StartupType Disabled"
rem ::: Disable GameDVR and Broadcast User Service (duplicate)
powershell -Command "Set-Service -Name 'BcastDVRUserService' -StartupType Disabled"
rem ::: Disable Bluetooth Support Service
powershell -Command "Set-Service -Name 'bthserv' -StartupType Disabled"
rem ::: Disable Offline Files Service
powershell -Command "Set-Service -Name 'CscService' -StartupType Disabled"
rem ::: Disable Connected User Experiences and Telemetry
powershell -Command "Set-Service -Name 'DiagTrack' -StartupType Disabled"
rem ::: Disable Dialog Blocking Service
powershell -Command "Set-Service -Name 'DialogBlockingS' -StartupType Disabled"
rem ::: Disable Diagnostic Policy Service
powershell -Command "Set-Service -Name 'DPS' -StartupType Disabled"
rem ::: Disable Windows Event Log
powershell -Command "Set-Service -Name 'EventLog' -StartupType Disabled"
rem ::: Disable Intel Dynamic Application Loader Host Interface Service
powershell -Command "Set-Service -Name 'jhi_service' -StartupType Disabled"
rem ::: Disable Link-Layer Topology Discovery Mapper
powershell -Command "Set-Service -Name 'lltdsvc' -StartupType Disabled"
rem ::: Disable TCP/IP NetBIOS Helper
powershell -Command "Set-Service -Name 'lmhosts' -StartupType Disabled"
rem ::: Disable Internet Connection Sharing (ICS)
powershell -Command "Set-Service -Name 'icssvc' -StartupType Disabled"
rem ::: Disable MessagingService
powershell -Command "Set-Service -Name 'MessagingService' -StartupType Disabled"
rem ::: Disable Net.Tcp Port Sharing Service
powershell -Command "Set-Service -Name 'NetTcpPortSharing' -StartupType Disabled"
rem ::: Disable Network Location Awareness
powershell -Command "Set-Service -Name 'NlaSvc' -StartupType Disabled"
rem ::: Disable Sync Host
powershell -Command "Set-Service -Name 'OneSyncSvc' -StartupType Disabled"
rem ::: Disable Phone Service
powershell -Command "Set-Service -Name 'PhoneSvc' -StartupType Disabled"
rem ::: Disable Program Compatibility Assistant Service
powershell -Command "Set-Service -Name 'PcaSvc' -StartupType Disabled"
rem ::: Disable Print Workflow Service
powershell -Command "Set-Service -Name 'PrintDeviceConf' -StartupType Disabled"
rem ::: Disable Print Scan Broker Service
powershell -Command "Set-Service -Name 'PrintScanBrokerService' -StartupType Disabled"
rem ::: Disable Quality Windows Audio Video Experience
powershell -Command "Set-Service -Name 'QWAVE' -StartupType Disabled"
rem ::: Disable Routing and Remote Access
powershell -Command "Set-Service -Name 'remoteAccess' -StartupType Disabled"
rem ::: Disable Remote Registry
powershell -Command "Set-Service -Name 'remoteRegistry' -StartupType Disabled"
rem ::: Disable Radio Management Service
powershell -Command "Set-Service -Name 'RmSvc' -StartupType Disabled"
rem ::: Disable Retail Demo Service
powershell -Command "Set-Service -Name 'RetailDemo' -StartupType Disabled"
rem ::: Disable Smart Card Service
powershell -Command "Set-Service -Name 'SCardSvr' -StartupType Disabled"
rem ::: Disable Shared PC Account Manager
powershell -Command "Set-Service -Name 'shpamsvc' -StartupType Disabled"
rem ::: Disable Internet Connection Sharing
powershell -Command "Set-Service -Name 'SharedAccess' -StartupType Disabled"
rem ::: Disable Print Spooler
powershell -Command "Set-Service -Name 'Spooler' -StartupType Disabled"
rem ::: Disable OpenSSH Authentication Agent
powershell -Command "Set-Service -Name 'ssh-agent' -StartupType Disabled"
rem ::: Disable SysMain (Superfetch)
powershell -Command "Set-Service -Name 'SysMain' -StartupType Disabled"
rem ::: Disable Windows Management Service
powershell -Command "Set-Service -Name 'SEMgrSvc' -StartupType Disabled"
rem ::: Disable Tablet PC Input Service
powershell -Command "Set-Service -Name 'TabletInputService' -StartupType Disabled"
rem ::: Disable User Experience Virtualization Service
powershell -Command "Set-Service -Name 'UevAgentService' -StartupType Disabled"
rem ::: Disable Windows Biometric Service
powershell -Command "Set-Service -Name 'WbioSrvc' -StartupType Disabled"
rem ::: Disable Windows Event Collector
powershell -Command "Set-Service -Name 'Wecsvc' -StartupType Disabled"
rem ::: Disable Windows Error Reporting Service
powershell -Command "Set-Service -Name 'WerSvc' -StartupType Disabled"
rem ::: Disable WIA RPC Service
powershell -Command "Set-Service -Name 'WiaRpc' -StartupType Disabled"
rem ::: Disable Windows Insider Service
powershell -Command "Set-Service -Name 'wisvc' -StartupType Disabled"
rem ::: Disable Windows Search
powershell -Command "Set-Service -Name 'WSearch' -StartupType Disabled"
rem ::: Disable Microsoft Account Sign-in Assistant
powershell -Command "Set-Service -Name 'wlidsvc' -StartupType Disabled"
rem ::: Disable Xbox Live Auth Manager
powershell -Command "Set-Service -Name 'XblAuthManager' -StartupType Disabled"
rem ::: Disable Xbox Live Game Save Service
powershell -Command "Set-Service -Name 'XblGameSave' -StartupType Disabled"
rem ::: Disable Xbox Accessory Management Service
powershell -Command "Set-Service -Name 'XboxGipSvc' -StartupType Disabled"
rem ::: Disable Xbox Live Networking Service
powershell -Command "Set-Service -Name 'XboxNetApiSvc' -StartupType Disabled"
rem ::: Disable ZT Helper Service
powershell -Command "Set-Service -Name 'ZTHELPER' -StartupType Disabled"

rem :::==================================================================================
rem ::: Adds registry entries to force disable unnecessary windows services one at a time
rem :::==================================================================================
rem ::: Disable Microsoft App-V Client
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AppVClient" /v "Start" /t REG_DWORD /d 4 /f
rem ::: Disable Assigned Access Manager Service
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AssignedAccessManager" /v "Start" /t REG_DWORD /d 4 /f
rem ::: Disable GameDVR and Broadcast User Service
reg add "HKLM\SYSTEM\CurrentControlSet\Services\BcastDVRUserService" /v "Start" /t REG_DWORD /d 4 /f
rem ::: Disable Bluetooth User Support Service
reg add "HKLM\SYSTEM\CurrentControlSet\Services\BluetoothUserService" /v "Start" /t REG_DWORD /d 4 /f
rem ::: Disable GameDVR and Broadcast User Service (duplicate)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\BcastDVRUserService" /v "Start" /t REG_DWORD /d 4 /f
rem ::: Disable Bluetooth Support Service
reg add "HKLM\SYSTEM\CurrentControlSet\Services\bthserv" /v "Start" /t REG_DWORD /d 4 /f
rem ::: Disable Offline Files Service
reg add "HKLM\SYSTEM\CurrentControlSet\Services\CscService" /v "Start" /t REG_DWORD /d 4 /f
rem ::: Disable Connected User Experiences and Telemetry
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DiagTrack" /v "Start" /t REG_DWORD /d 4 /f
rem ::: Disable Dialog Blocking Service
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DialogBlockingS" /v "Start" /t REG_DWORD /d 4 /f
rem ::: Disable Diagnostic Policy Service
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DPS" /v "Start" /t REG_DWORD /d 4 /f
rem ::: Disable Windows Event Log
reg add "HKLM\SYSTEM\CurrentControlSet\Services\EventLog" /v "Start" /t REG_DWORD /d 4 /f
rem ::: Disable Intel Dynamic Application Loader Host Interface Service
reg add "HKLM\SYSTEM\CurrentControlSet\Services\jhi_service" /v "Start" /t REG_DWORD /d 4 /f
rem ::: Disable Link-Layer Topology Discovery Mapper
reg add "HKLM\SYSTEM\CurrentControlSet\Services\lltdsvc" /v "Start" /t REG_DWORD /d 4 /f
rem ::: Disable TCP/IP NetBIOS Helper
reg add "HKLM\SYSTEM\CurrentControlSet\Services\lmhosts" /v "Start" /t REG_DWORD /d 4 /f
rem ::: Disable Internet Connection Sharing (ICS)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\icssvc" /v "Start" /t REG_DWORD /d 4 /f
rem ::: Disable MessagingService
reg add "HKLM\SYSTEM\CurrentControlSet\Services\MessagingService" /v "Start" /t REG_DWORD /d 4 /f
rem ::: Disable Net.Tcp Port Sharing Service
reg add "HKLM\SYSTEM\CurrentControlSet\Services\NetTcpPortSharing" /v "Start" /t REG_DWORD /d 4 /f
rem ::: Disable Network Location Awareness
reg add "HKLM\SYSTEM\CurrentControlSet\Services\NlaSvc" /v "Start" /t REG_DWORD /d 4 /f
rem ::: Disable Sync Host
reg add "HKLM\SYSTEM\CurrentControlSet\Services\OneSyncSvc" /v "Start" /t REG_DWORD /d 4 /f
rem ::: Disable Phone Service
reg add "HKLM\SYSTEM\CurrentControlSet\Services\PhoneSvc" /v "Start" /t REG_DWORD /d 4 /f
rem ::: Disable Program Compatibility Assistant Service
reg add "HKLM\SYSTEM\CurrentControlSet\Services\PcaSvc" /v "Start" /t REG_DWORD /d 4 /f
rem ::: Disable Print Workflow Service
reg add "HKLM\SYSTEM\CurrentControlSet\Services\PrintDeviceConf" /v "Start" /t REG_DWORD /d 4 /f
rem ::: Disable Print Scan Broker Service
reg add "HKLM\SYSTEM\CurrentControlSet\Services\PrintScanBrokerService" /v "Start" /t REG_DWORD /d 4 /f
rem ::: Disable Quality Windows Audio Video Experience
reg add "HKLM\SYSTEM\CurrentControlSet\Services\QWAVE" /v "Start" /t REG_DWORD /d 4 /f
rem ::: Disable Routing and Remote Access
reg add "HKLM\SYSTEM\CurrentControlSet\Services\remoteAccess" /v "Start" /t REG_DWORD /d 4 /f
rem ::: Disable Remote Registry
reg add "HKLM\SYSTEM\CurrentControlSet\Services\remoteRegistry" /v "Start" /t REG_DWORD /d 4 /f
rem ::: Disable Radio Management Service
reg add "HKLM\SYSTEM\CurrentControlSet\Services\RmSvc" /v "Start" /t REG_DWORD /d 4 /f
rem ::: Disable Retail Demo Service
reg add "HKLM\SYSTEM\CurrentControlSet\Services\RetailDemo" /v "Start" /t REG_DWORD /d 4 /f
rem ::: Disable Smart Card Service
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SCardSvr" /v "Start" /t REG_DWORD /d 4 /f
rem ::: Disable Shared PC Account Manager
reg add "HKLM\SYSTEM\CurrentControlSet\Services\shpamsvc" /v "Start" /t REG_DWORD /d 4 /f
rem ::: Disable Internet Connection Sharing
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SharedAccess" /v "Start" /t REG_DWORD /d 4 /f
rem ::: Disable Print Spooler
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Spooler" /v "Start" /t REG_DWORD /d 4 /f
rem ::: Disable OpenSSH Authentication Agent
reg add "HKLM\SYSTEM\CurrentControlSet\Services\ssh-agent" /v "Start" /t REG_DWORD /d 4 /f
rem ::: Disable SysMain (Superfetch)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SysMain" /v "Start" /t REG_DWORD /d 4 /f
rem ::: Disable Windows Management Service
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SEMgrSvc" /v "Start" /t REG_DWORD /d 4 /f
rem ::: Disable Tablet PC Input Service
reg add "HKLM\SYSTEM\CurrentControlSet\Services\TabletInputService" /v "Start" /t REG_DWORD /d 4 /f
rem ::: Disable User Experience Virtualization Service
reg add "HKLM\SYSTEM\CurrentControlSet\Services\UevAgentService" /v "Start" /t REG_DWORD /d 4 /f
rem ::: Disable Windows Biometric Service
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WbioSrvc" /v "Start" /t REG_DWORD /d 4 /f
rem ::: Disable Windows Event Collector
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Wecsvc" /v "Start" /t REG_DWORD /d 4 /f
rem ::: Disable Windows Error Reporting Service
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WerSvc" /v "Start" /t REG_DWORD /d 4 /f
rem ::: Disable WIA RPC Service
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WiaRpc" /v "Start" /t REG_DWORD /d 4 /f
rem ::: Disable Windows Insider Service
reg add "HKLM\SYSTEM\CurrentControlSet\Services\wisvc" /v "Start" /t REG_DWORD /d 4 /f
rem ::: Disable Windows Search
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WSearch" /v "Start" /t REG_DWORD /d 4 /f
rem ::: Disable Microsoft Account Sign-in Assistant
reg add "HKLM\SYSTEM\CurrentControlSet\Services\wlidsvc" /v "Start" /t REG_DWORD /d 4 /f
rem ::: Disable Xbox Live Auth Manager
reg add "HKLM\SYSTEM\CurrentControlSet\Services\XblAuthManager" /v "Start" /t REG_DWORD /d 4 /f
rem ::: Disable Xbox Live Game Save Service
reg add "HKLM\SYSTEM\CurrentControlSet\Services\XblGameSave" /v "Start" /t REG_DWORD /d 4 /f
rem ::: Disable Xbox Accessory Management Service
reg add "HKLM\SYSTEM\CurrentControlSet\Services\XboxGipSvc" /v "Start" /t REG_DWORD /d 4 /f
rem ::: Disable Xbox Live Networking Service
reg add "HKLM\SYSTEM\CurrentControlSet\Services\XboxNetApiSvc" /v "Start" /t REG_DWORD /d 4 /f
rem ::: Disable ZT Helper Service
reg add "HKLM\SYSTEM\CurrentControlSet\Services\ZTHELPER" /v "Start" /t REG_DWORD /d 4 /f

echo. 
echo  Completed - Unnecessary Windows Services have been stopped and disabled ...
echo.
pause
