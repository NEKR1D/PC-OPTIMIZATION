rem # CPU Tweak script

rem # Plundered and updated by NEKR1D
rem # Originally created by Shoober420

rem # AdditionalCriticalWorkerThreads value increases the number of critical worker threads created for a specified work queue
rem # By increasing the value of this one, you can get more additional worker threads which will allow for more queued I/O in the storage subsystem
rem # Allow more I/O to queue in the storage subsystem
rem # Value is determined by RAM size NOT thread or core count

PAUSE

rem # Add Critical and Delayed Worker Threads
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Executive" /v "AdditionalCriticalWorkerThreads" /t REG_DWORD /d "16" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Executive" /v "AdditionalDelayedWorkerThreads" /t REG_DWORD /d "16"  /f

rem # Disable Core Parking
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "CoreParkingDisabled" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HighPerformance" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HighestPerformance" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MinimumThrottlePercent" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MaximumThrottlePercent" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MaximumPerformancePercent" /t REG_DWORD /d "100" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "Class1InitialUnparkCount" /t REG_DWORD /d "100" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "InitialUnparkCount" /t REG_DWORD /d "100" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MaximumPerformancePercent" /t REG_DWORD /d "100" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "QosManagesIdleProcessors" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PDC\Activators\Default\VetoPolicy" /v "EA:EnergySaverEngaged" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PDC\Activators\28\VetoPolicy" /v "EA:PowerStateDischarging" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Misc" /v "DeviceIdlePolicy" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "PerfEnergyPreference" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "PerfEnergyPreference" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "CPMinCores" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "CPMaxCores" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "CPMinCores1" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "CPMaxCores1" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "CpLatencyHintUnpark1" /t REG_DWORD /d "100" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "CPDistribution" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "CpLatencyHintUnpark" /t REG_DWORD /d "100" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "MaxPerformance1" /t REG_DWORD /d "100" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "MaxPerformance" /t REG_DWORD /d "100" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "CPDistribution1" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "CPHEADROOM" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "ProccesorThrottlingEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleThreshold" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdle" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuLatencyTimer" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuSlowdown" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "Threshold" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuDebuggingEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "ProccesorLatencyThrottlingEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Processor" /v "AllowPepPerfStates" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Processor" /v "Cstates" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubDelay" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubInterval" /t REG_DWORD /d "0" /f

rem reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubPower" /t REG_DWORD /d "18" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubThreshold" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubType" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValue" /t REG_DWORD /d "100" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueMaximum" /t REG_DWORD /d "100" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueMinimum" /t REG_DWORD /d "100" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueStep" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueDefault" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueCurrent" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValuePrevious" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueNext" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueLast" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueFirst" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueCount" /t REG_DWORD /d "100" /f

rem reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueIndex" /t REG_DWORD /d "42" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueName" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueDescription" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueDisabled" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueVisible" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueHidden" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueReadOnly" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueReadnv11" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValuenv11Only" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueExecute" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueNoExecute" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueSystem" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueUser" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubPower" /t REG_DWORD /d "100" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueDisabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubPower" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueCustom" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueAuto" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueManual" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueAutomatic" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueDisabledByDefault" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueEnabledByDefault" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueDefaultEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueDefaultDisabled" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueDefaultAuto" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueDefaultManual" /t REG_DWORD /d "0" /f

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\GroupPolicy" /v "fDisablePowerManagement" /t REG_DWORD /d "1" /f

PAUSE