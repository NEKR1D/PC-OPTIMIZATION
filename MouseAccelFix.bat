rem ::: Mouse Acceleration Fix

rem ::: Plundered by NEKR1D

rem ::: Originally created by MarkC
rem ::: https://donewmouseaccel.blogspot.com/2010/03/markc-windows-7-mouse-acceleration-fix.html

rem ::: !!! WARNING !!!
rem ::: !!! Windows scaling size must be set to 100% !!!

PAUSE

rem ::: Disable WelcomeScreen and Login Accel
reg add "HKCU\Control Panel\Mouse" /v "MouseAccel" /t REG_SZ /d "0" /f
reg add "HKCU\Control Panel\Mouse" /v "MouseSpeed" /t REG_SZ /d "0" /f
reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold1" /t REG_SZ /d "0" /f
reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold2" /t REG_SZ /d "0" /f
reg add "HKU\.DEFAULT\Control Panel\Mouse" /v "MouseAccel" /t REG_SZ /d "0" /f
reg add "HKU\.DEFAULT\Control Panel\Mouse" /v "MouseSpeed" /t REG_SZ /d "0" /f
reg add "HKU\.DEFAULT\Control Panel\Mouse" /v "MouseThreshold1" /t REG_SZ /d "0" /f
reg add "HKU\.DEFAULT\Control Panel\Mouse" /v "MouseThreshold2" /t REG_SZ /d "0" /f

rem ::: Set Smooth Mouse Curves
reg add "HKCU\Control Panel\Mouse" /f /v "SmoothMouseXCurve" /t REG_BINARY /d 0000000000000000C0CC0C0000000000809919000000000040662600000000000033330000000000
reg add "HKCU\Control Panel\Mouse" /f /v "SmoothMouseYCurve" /t REG_BINARY /d 0000000000000000000038000000000000007000000000000000A800000000000000E00000000000
reg add "HKU\.DEFAULT\Control Panel\Mouse" /f /v "SmoothMouseXCurve" /t REG_BINARY /d 0000000000000000C0CC0C0000000000809919000000000040662600000000000033330000000000
reg add "HKU\.DEFAULT\Control Panel\Mouse" /f /v "SmoothMouseYCurve" /t REG_BINARY /d 0000000000000000000038000000000000007000000000000000A800000000000000E00000000000

rem ::: MouseSensitivity (10 = Normal, 20 = Max)
rem ::: Set this to 3 due to high DPI of 3200+, does not influence game engines but sometimes game menus
reg add "HKU\.DEFAULT\Control Panel\Mouse" /f /v "MouseSensitivity" /t REG_SZ /d "3"
reg add "HKCU\Control Panel\Mouse" /v "MouseSensitivity" /t REG_SZ /d "3" /f

rem ::: Enable RAW Input
reg add "HKCU\Control Panel\Mouse" /v RawInput /t REG_SZ /d "1" /f

rem ::: Activate a window by hovering over it with the mouse // allows hover scrolling
reg add "HKCU\Control Panel\Mouse" /v ActiveWindowTracking /t REG_DWORD /d "1" /f

PAUSE
