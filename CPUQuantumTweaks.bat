rem ::: CPU Thread Quantum and Foreground Boost Priority Tweaks

rem ::: Created by NEKR1D

rem ::: No Foreground Boost (0)
rem ::: 0x18 Hex 24 Decimal = Long/Fixed/0 187.5ms/187.5ms/375ms (Windows Default for Processor Scheduling set to "Background Services")
rem ::: 0x24 Hex 36 Decimal = Short/Variable/0 31.25m/31.25ms/62.50ms
rem ::: 0x28 Hex 40 Decimal = Short/Fixed/0 93.75ms/93.75ms/281.25ms

rem ::: High Foreground Boost (2)
rem ::: 0x26 Hex 38 Decimal = Short/Variable/2 93.75ms/31.25ms/125.00ms (Windows Default for Processor Scheduling set to "Programs")
rem ::: 0x2A Hex 42 Decimal = Short/Fixed/2 93.75ms/93.75ms/281.25ms

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d 0x00000026 /f