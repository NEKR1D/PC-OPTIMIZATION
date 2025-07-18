rem ::: Disable CPU Mitigations for Spectre and Meltdown attacks

rem ::: Plundered by NEKR1D

rem ::: Originally created by Shoober420
rem ::: https://github.com/shoober420/windows11-scripts

rem ::: !!! WARNING !!!

rem ::: SCRIPT FOR REFERENCE ONLY
rem ::: NOT RECOMENDED (BUT HAS POTENTIAL TO INCEASE YOUR CPU PERFORMANCE)
rem ::: USE ON GAMING IMAGE ONLY, DONT DO SENSITIVE TASKS SUCH AS BANKING

rem ::: !!! WARNING !!!

PAUSE

rem ::: CPU Mitigations for CVE-2017-5715 (Spectre Variant 2) and CVE-2017-5754 (Meltdown)
rem ::: Enable = 0 / Disable = 3 
reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d "3" /f
reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d "3" /f
reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettings" /t REG_DWORD /d "3" /f

rem ::: Windows Security Control Flow Guard
rem ::: Disable = 0 Enable = 1
rem ::: https://learn.microsoft.com/en-us/windows/win32/secbp/control-flow-guard
reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "EnableCfg" /t REG_DWORD /d "0" /f

PAUSE
