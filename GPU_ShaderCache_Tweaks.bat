rem ::: Clear NVIDIA GPU and DirectX Shaders and Cache

rem ::: Created by NEKR1D

rem ::: !!! Before running script set Shader Cache Size to "Disabled" in NVIDIA Control Panel then reboot PC
rem ::: !!! After running script set Shader Cache Size to "Enabled" in NVIDIA Control Panel and reboot PC

@echo off
echo.
echo Starting GPU and DirectX cache cleanup...
echo.

rem ::: Delete NVIDIA Shader Cache
echo Clearing NVIDIA Shader Cache...
echo.
del /q /f /s "%LOCALAPPDATA%\NVIDIA\DXCache\*" >nul 2>&1
for /d %%x in ("%LOCALAPPDATA%\NVIDIA\DXCache\*") do rd /s /q "%%x" >nul 2>&1

del /q /f /s "%LOCALAPPDATA%\NVIDIA\GLCache\*" >nul 2>&1
for /d %%x in ("%LOCALAPPDATA%\NVIDIA\GLCache\*") do rd /s /q "%%x" >nul 2>&1

del /q /f /s "%LOCALAPPDATA%\NVIDIA Corporation\NV_Cache\*" >nul 2>&1
for /d %%x in ("%LOCALAPPDATA%\NVIDIA Corporation\NV_Cache\*") do rd /s /q "%%x" >nul 2>&1

rem ::: Delete Windows DirectX Cache
echo Clearing Windows DirectX Cache...
echo.
del /q /f /s "%LOCALAPPDATA%\D3DSCache\*" >nul 2>&1
for /d %%x in ("%LOCALAPPDATA%\D3DSCache\*") do rd /s /q "%%x" >nul 2>&1

echo.
echo GPU and DirectX cache cleanup complete!
echo.
echo REBOOT YOUR PC
echo.
pause