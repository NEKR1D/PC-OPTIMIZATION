rem # DPC Tweaks

rem # Deferred Procedure Call (DPC)
rem # Allows high-priority tasks to defer required but lower-priority tasks for later execution

rem # Thread DPC
rem # Prioritizes critial tasks to execute first

rem # https://forums.blurbusters.com/viewtopic.php?t=13323
rem # https://www.tenforums.com/performance-maintenance/146774-cacheawarescheduling-what-how-does-windows-benefit.html

@ECHO off
ECHO Adding values to the Registry...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v DpcWatchdogProfileOffset /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v DpcTimeout /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v IdealDpcRate /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v MaximumDpcQueueDepth /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v MinimumDpcRate /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v DpcWatchdogPeriod /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v UnlimitDpcQueue /t REG_DWORD /d 1 /f

rem # Disable Threaded DPCs
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "ThreadDpcEnable" /t REG_DWORD /d "0" /f

ECHO Completed adding values to the Registry.

PAUSE