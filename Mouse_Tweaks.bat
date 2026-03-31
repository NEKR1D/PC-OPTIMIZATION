rem ::: Mouse Acceleration Fix

rem ::: Plundered by NEKR1D

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
rem ::: Custom values that give the most linear mouse response curve possible under Windows' default mouse drivers
rem ::: A 1:1 input ratio (true value of 0 acceleration)
rem ::: Designed to counteract the built-in acceleration/prediction that happens even when the "Enhance pointer precision" setting is disabled in Control Panel.
rem ::: Setting these values to zero can make Windows ignore them and revert to its default, built-in acceleration curve. This default curve is the same one that is active when the "Enhance pointer precision" checkbox is on.
reg add "HKCU\Control Panel\Mouse" /f /v "SmoothMouseXCurve" /t REG_BINARY /d 000000000000000000a0000000000000004001000000000000800200000000000000050000000000
reg add "HKCU\Control Panel\Mouse" /f /v "SmoothMouseYCurve" /t REG_BINARY /d 000000000000000066a6020000000000cd4c050000000000a0990a00000000003833150000000000
reg add "HKU\.DEFAULT\Control Panel\Mouse" /f /v "SmoothMouseXCurve" /t REG_BINARY /d 000000000000000000a0000000000000004001000000000000800200000000000000050000000000
reg add "HKU\.DEFAULT\Control Panel\Mouse" /f /v "SmoothMouseYCurve" /t REG_BINARY /d 000000000000000066a6020000000000cd4c050000000000a0990a00000000003833150000000000

rem ::: Change Windows Desktop/Background Mouse Sensitivity (10 = Default, 20 = Max)
rem ::: Set this to 3 due to high DPI of 3200+
rem ::: Does not influence in-game engine mouse aim but will alter mouse speed of in-game menus only
reg add "HKU\.DEFAULT\Control Panel\Mouse" /f /v "MouseSensitivity" /t REG_SZ /d "3"
reg add "HKCU\Control Panel\Mouse" /v "MouseSensitivity" /t REG_SZ /d "3" /f

rem ::: Enable RAW Input
reg add "HKCU\Control Panel\Mouse" /v RawInput /t REG_SZ /d "1" /f

rem ::: Activate a window by hovering over it with the mouse // allows hover scrolling
reg add "HKCU\Control Panel\Mouse" /v ActiveWindowTracking /t REG_DWORD /d "1" /f

rem ::: Unlock Windows Desktop/Background mouse polling rate cap
reg add "HKCU\Control Panel\Mouse" /v "RawMouseThrottleEnabled" /t REG_DWORD /d "0" /f

PAUSE
