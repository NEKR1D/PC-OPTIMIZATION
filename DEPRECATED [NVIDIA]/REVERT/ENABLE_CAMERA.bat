@echo off
echo =======================================================
echo Windows 11 Camera Access ^& Group Policy Reset Script
echo =======================================================
echo.

echo 1. Removing Group Policy restrictions...
:: Deletes the master camera disable policies
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Camera" /f >nul 2>&1
reg delete "HKCU\SOFTWARE\Policies\Microsoft\Camera" /f >nul 2>&1

:: Deletes the App Privacy policy that locks the camera toggle
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v LetAppsAccessCamera /f >nul 2>&1
reg delete "HKCU\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v LetAppsAccessCamera /f >nul 2>&1

echo.
echo 2. Enabling System-Wide Camera Access...
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam" /v Value /t REG_SZ /d "Allow" /f >nul 2>&1

echo.
echo 3. Enabling Current User Camera Access...
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam" /v Value /t REG_SZ /d "Allow" /f >nul 2>&1

echo.
echo 4. Restarting the Windows Settings app to apply changes...
taskkill /f /im SystemSettings.exe >nul 2>&1

echo.
echo =======================================================
echo Done! Open Settings ^> Privacy ^& Security ^> Camera.
echo The "controlled by your organization" message should be gone.
echo =======================================================
pause