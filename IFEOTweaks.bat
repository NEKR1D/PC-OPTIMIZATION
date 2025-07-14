rem ::: Image File Execution Options [IFEO] Tweaks Batch

rem ::: Plundered by NEKR1D

rem ::: Defines CPU, I/O and Page Priority of games, system and software executables

rem ::: !!! Warning !!!
rem ::: !!! DO NOT INSTALL !!!
rem ::: !!! Use script as reference only, modify and add your own games/software !!!

rem ::: 1: Idle
rem ::: 2: Normal
rem ::: 3: High (Can lower performance)
rem ::: 4: Real Time (DO NOT USE THIS)
rem ::: 5: Below Normal
rem ::: 6: Above Normal

setlocal

set "IFEO_BASE=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options"

set "APP_KEY=%IFEO_BASE%\bf2042.exe\PerfOptions"
reg add "%APP_KEY%" /v CpuPriorityClass /t REG_DWORD /d 6 /f
reg add "%APP_KEY%" /v IoPriority /t REG_DWORD /d 6 /f
reg add "%APP_KEY%" /v PagePriority /t REG_DWORD /d 6 /f

set "APP_KEY=%IFEO_BASE%\cs2.exe\PerfOptions"
reg add "%APP_KEY%" /v CpuPriorityClass /t REG_DWORD /d 6 /f
reg add "%APP_KEY%" /v IoPriority /t REG_DWORD /d 6 /f
reg add "%APP_KEY%" /v PagePriority /t REG_DWORD /d 6 /f

set "APP_KEY=%IFEO_BASE%\csgo.exe\PerfOptions"
reg add "%APP_KEY%" /v CpuPriorityClass /t REG_DWORD /d 6 /f
reg add "%APP_KEY%" /v IoPriority /t REG_DWORD /d 6 /f
reg add "%APP_KEY%" /v PagePriority /t REG_DWORD /d 6 /f

set "APP_KEY=%IFEO_BASE%\csrss.exe\PerfOptions"
reg add "%APP_KEY%" /v CpuPriorityClass /t REG_DWORD /d 6 /f
reg add "%APP_KEY%" /v IoPriority /t REG_DWORD /d 6 /f
reg add "%APP_KEY%" /v PagePriority /t REG_DWORD /d 6 /f

set "APP_KEY=%IFEO_BASE%\dwm.exe\PerfOptions"
reg add "%APP_KEY%" /v CpuPriorityClass /t REG_DWORD /d 6 /f
reg add "%APP_KEY%" /v IoPriority /t REG_DWORD /d 6 /f
reg add "%APP_KEY%" /v PagePriority /t REG_DWORD /d 6 /f

set "APP_KEY=%IFEO_BASE%\HellDivers2.exe\PerfOptions"
reg add "%APP_KEY%" /v CpuPriorityClass /t REG_DWORD /d 6 /f
reg add "%APP_KEY%" /v IoPriority /t REG_DWORD /d 6 /f
reg add "%APP_KEY%" /v PagePriority /t REG_DWORD /d 6 /f

set "APP_KEY=%IFEO_BASE%\hl.exe\PerfOptions"
reg add "%APP_KEY%" /v CpuPriorityClass /t REG_DWORD /d 6 /f
reg add "%APP_KEY%" /v IoPriority /t REG_DWORD /d 6 /f
reg add "%APP_KEY%" /v PagePriority /t REG_DWORD /d 6 /f

set "APP_KEY=%IFEO_BASE%\hl2.exe\PerfOptions"
reg add "%APP_KEY%" /v CpuPriorityClass /t REG_DWORD /d 6 /f
reg add "%APP_KEY%" /v IoPriority /t REG_DWORD /d 6 /f
reg add "%APP_KEY%" /v PagePriority /t REG_DWORD /d 6 /f

set "APP_KEY=%IFEO_BASE%\HuntGame.exe\PerfOptions"
reg add "%APP_KEY%" /v CpuPriorityClass /t REG_DWORD /d 6 /f
reg add "%APP_KEY%" /v IoPriority /t REG_DWORD /d 6 /f
reg add "%APP_KEY%" /v PagePriority /t REG_DWORD /d 6 /f

set "APP_KEY=%IFEO_BASE%\LSASS.exe\PerfOptions"
reg add "%APP_KEY%" /v CpuPriorityClass /t REG_DWORD /d 1 /f
reg add "%APP_KEY%" /v IoPriority /t REG_DWORD /d 1 /f
reg add "%APP_KEY%" /v PagePriority /t REG_DWORD /d 1 /f

set "APP_KEY=%IFEO_BASE%\quake2.exe\PerfOptions"
reg add "%APP_KEY%" /v CpuPriorityClass /t REG_DWORD /d 6 /f
reg add "%APP_KEY%" /v IoPriority /t REG_DWORD /d 6 /f
reg add "%APP_KEY%" /v PagePriority /t REG_DWORD /d 6 /f

set "APP_KEY=%IFEO_BASE%\QuakeChampions.exe\PerfOptions"
reg add "%APP_KEY%" /v CpuPriorityClass /t REG_DWORD /d 6 /f
reg add "%APP_KEY%" /v IoPriority /t REG_DWORD /d 6 /f
reg add "%APP_KEY%" /v PagePriority /t REG_DWORD /d 6 /f

set "APP_KEY=%IFEO_BASE%\ReadyOrNot-Win64-Shipping.exe\PerfOptions"
reg add "%APP_KEY%" /v CpuPriorityClass /t REG_DWORD /d 6 /f
reg add "%APP_KEY%" /v IoPriority /t REG_DWORD /d 6 /f
reg add "%APP_KEY%" /v PagePriority /t REG_DWORD /d 6 /f

set "APP_KEY=%IFEO_BASE%\STRAFTAT.exe\PerfOptions"
reg add "%APP_KEY%" /v CpuPriorityClass /t REG_DWORD /d 6 /f
reg add "%APP_KEY%" /v IoPriority /t REG_DWORD /d 6 /f
reg add "%APP_KEY%" /v PagePriority /t REG_DWORD /d 6 /f

set "APP_KEY=%IFEO_BASE%\svchost.exe\PerfOptions"
reg add "%APP_KEY%" /v CpuPriorityClass /t REG_DWORD /d 1 /f
reg add "%APP_KEY%" /v IoPriority /t REG_DWORD /d 1 /f
reg add "%APP_KEY%" /v PagePriority /t REG_DWORD /d 1 /f

endlocal

rem ::: Enable Large Pages for games and system executables

rem ::: Originally created by Shoober420
rem ::: https://github.com/shoober420/windows11-scripts

rem ::: Enable Large System Cache
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "1" /f

rem ::: Enable Large Pages
reg add "HKLM\SYSTEM" /v "UseLargePages" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "UseLargePages" /t REG_DWORD /d "1" /f

rem ::: Enable Large Pages on specific Windows and Application processes
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\explorer.exe" /v "UseLargePages" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\dllhost.exe" /v "UseLargePages" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\dwm.exe" /v "UseLargePages" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\crss.exe" /v "UseLargePages" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\steam.exe" /v "UseLargePages" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\steamservice.exe" /v "UseLargePages" /t REG_DWORD /d "1" /f

rem ::: Enable Large Pages on specific Games
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\QuakeChampions.exe" /v "UseLargePages" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\quake2.exe" /v "UseLargePages" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\bf2042.exe" /v "UseLargePages" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\HuntGame.exe" /v "UseLargePages" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ReadyOrNot-Win64-Shipping.exe" /v "UseLargePages" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\HellDivers2.exe" /v "UseLargePages" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\STRAFTAT.exe" /v "UseLargePages" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\cs2.exe" /v "UseLargePages" /t REG_DWORD /d "1" /f

PAUSE
