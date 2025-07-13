rem ::: Resolution Timer Tweaks

rem ::: Plundered and updated by NEKR1D
rem ::: Originally Created by Shoober420

rem ::: Leave HPET enabled in BIOS

rem ::: Timer Resolution Tweak
rem ::: Forces Windows 11 to obey timer resolution settings (otherwise timer settings in ILSC will not take effect)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "GlobalTimerResolutionRequests" /t REG_DWORD /d "1" /f

rem ::: Disable HPET in Windows
rem ::: useplatformclock not found by default, setting not present unless enabled prior
bcdedit /set useplatformclock no

rem ::: Disable RTC (Real Time Clock)
rem ::: Lowers FPS when enabled
bcdedit /set useplatformtick no

rem ::: Disable Power Saving Feature
bcdedit /set disabledynamictick yes

rem ::: TSC Sync Policy
bcdedit /set tscsyncpolicy enhanced

rem ::: Disable High Precision Event Timer

pnputil /disable-device "ACPI\PNP0103\0"

rem ::: Disable HPET (High Precision Event Timer)
reg add "HKLM\SYSTEM\CurrentControlSet\Enum\HARDWARE\DEVICEMAP\ACPI\HPET" /v "Enable" /t REG_DWORD /d "0" /f

PAUSE
