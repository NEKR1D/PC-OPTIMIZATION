@echo off
setlocal EnableExtensions DisableDelayedExpansion

rem ::: NVIDIA GPU Tweaks REVERSAL SCRIPT
rem ::: Removes registry keys added by the "NVIDIA GPU Tweaks" script.

echo Reverting changes...

rem ::: Reverting WMI Start
rem ::: The original script set this to "2" (Automatic). We will leave it as is 
rem ::: because deleting this value breaks the WMI service.
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Winmgmt" /v "Start" /t REG_DWORD /d "2" /f

rem ::: Reverting Class ID Tweaks
rem ::: We loop through the NVIDIA devices just like the installer did, but DELETE the keys instead.

for /f %%i in ('wmic path Win32_VideoController get PNPDeviceID^| findstr /L "PCI\VEN_"') do (
	for /f "tokens=3" %%a in ('reg query "HKLM\SYSTEM\ControlSet001\Enum\%%i" /v "Driver"') do (
		for /f %%i in ('echo %%a ^| findstr "{"') do (

            echo Cleaning Device %%i ...

            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMHdcpKeyglobZero" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableOverlay" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "D3PCLatency" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "LOWLATENCY" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "Node3DLowLatency" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "PciLatencyTimerControl" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmGspcMaxFtuS" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmGspcMinFtuS" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmGspcPerioduS" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMLpwrEiIdleThresholdUs" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMLpwrGrIdleThresholdUs" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMLpwrGrRgIdleThresholdUs" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMLpwrMsIdleThresholdUs" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "VRDirectFlipDPCDelayUs" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "VRDirectFlipTimingMarginUs" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "VRDirectJITFlipMsHybridFlipDelayUs" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "vrrCursorMarginUs" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "vrrDeflickerMarginUs" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "vrrDeflickerMaxUs" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "PowerMizerEnable" /f
            rem reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "PerfLevelSrc" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "PowerMizerLevel" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "PowerMizerLevelAC" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "TCCSupported" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "Acceleration.Level" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DesktopStereoShortcuts" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "NVDeviceSupportKFilter" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmCacheLoc" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmFbsrPagedDMA" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "TrackResetEngine" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "ValidateBlitSubRects" /f

            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "AllowDeepCStates" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "NoFastLinkTrainingForeDP" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "PreferSystemMemoryContiguous" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisablePFonDP" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "AdaptiveVsyncEnable" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "BuffersInFlight" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableAcpPowerGating" /f

            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableAllClockGating" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableAsyncPstates" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableBlockWrite" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableCpPowerGating" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableDMACopy" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableDrmdmaPowerGating" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableDynamicPstate" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableGDIAcceleration" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableGDSPowerGating" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableGfxCGPowerGating" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableGfxClockGating" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableGFXPipelinePowerGating" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableGmcPowerGating" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableHdpClockPowerGating" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableHdpMGClockGating" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableKmRender" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableKmRenderBoost" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableOverclockedPstates" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisablePowerGating" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableSamuClockGating" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableSysClockGating" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableUVDPowerGating" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableVceClockGating" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableWriteCombining" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableXdmaPowerGating" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableXdmaSclkGating" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "Disable_OverlayDSQualityEnhancement" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DpiMapIommuContiguous" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "EnableAggressivePStateBoost" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "EnableAggressivePStateOnly" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "EnableDirectFlip" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "EnableIndependentFlip" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "EnablePerformanceMode" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "EnableRuntimePowerManagement" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "EnableUlps" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "FlTransitionLatency" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "MonitorLatencyTolerance" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "MonitorRefreshLatencyTolerance" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "PowerSavingTweaks" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "PP_SclkDeepSleepDisable" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "PP_ThermalAutoThrottlingEnable" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "PrimaryPushBufferSize" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmClkPowerOffDramPllWhenUnused" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMDeepLlEntryLatencyUsec" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMDisablePostL2Compression" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmDisableRegistryCaching" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmGpsPsEnablePerCpuCoreDpc" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "StutterMode" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "UseGpuTimer" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "EnableSystemMemoryTiling" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "ENABLE_OCA_LOGGING" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "PCIEPowerControl" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "PCIEPowerControl_8086191f50001458" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMClkSlowDown" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMDisableGpuASPMFlags" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmDisableHdcp22" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMEnableASPMAtLoad" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMEnableASPMDT" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmMIONoPowerOff" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmPerfRatedTdpLimit" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMSkipHdcp22Init" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmWotHdcpEnable" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "F1TransitionLatency" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMDeepL1EntryLatencyUsec" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "EnableCoreSlowdown" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "EnableMClkSlowdown" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "EnableNVClkSlowdown" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmDisableHwFaultBuffer" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_EnableGDIAcceleration" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "NVFBCEnable" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableBugcheckCallback" /f

            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmRcWatchdog" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMCtxswLog" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "EnableMidGfxpSharedBuffer" /f

            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\PowerSettings" /v "ConservationIdleTime" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\PowerSettings" /v "IdlePowerState" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\PowerSettings" /v "PerformanceIdleTime" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmEnableHda" /f
            reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "EnableHDAudioD3Cold" /f
        )
    )
)

rem ::: Reverting NVIDIA service tweaks
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "NVFBCEnable" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\services\nvlddmkm" /v "DisableWriteCombining" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "RmGpsPsEnablePerCpuCoreDpc" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "PreferSystemMemoryContiguous" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "PrimaryPushBufferSize" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "EnablePerformanceMode" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisableBugcheckCallback" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "EnableMidGfxpSharedBuffer" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "RMHdcpKeyglobZero" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisableOverlay" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisableDynamicPstate" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "D3PCLatency" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "F1TransitionLatency" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "LOWLATENCY" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "Node3DLowLatency" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "PciLatencyTimerControl" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "RMDeepL1EntryLatencyUsec" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "RmGspcMaxFtuS" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "RmGspcMinFtuS" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "RmGspcPerioduS" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "RMLpwrEiIdleThresholdUs" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "RMLpwrGrIdleThresholdUs" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "RMLpwrGrRgIdleThresholdUs" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "RMLpwrMsIdleThresholdUs" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "VRDirectFlipDPCDelayUs" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "VRDirectFlipTimingMarginUs" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "VRDirectJITFlipMsHybridFlipDelayUs" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "vrrCursorMarginUs" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "vrrDeflickerMarginUs" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "vrrDeflickerMaxUs" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "PowerMizerEnable" /f
rem reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "PerfLevelSrc" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "PowerMizerLevel" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "PowerMizerLevelAC" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "TCCSupported" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DesktopStereoShortcuts" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "NVDeviceSupportKFilter" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "RmCacheLoc" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "RmFbsrPagedDMA" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "TrackResetEngine" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "ValidateBlitSubRects" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "AllowDeepCStates" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "NoFastLinkTrainingForeDP" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "PreferSystemMemoryContiguous" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisablePFonDP" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "AdaptiveVsyncEnable" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "BuffersInFlight" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisableAcpPowerGating" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisableAllClockGating" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisableAsyncPstates" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisableBlockWrite" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisableCpPowerGating" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisableDMACopy" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisableDrmdmaPowerGating" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisableDynamicPstate" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisableGDIAcceleration" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisableGDSPowerGating" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisableGfxCGPowerGating" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisableGfxClockGating" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisableGFXPipelinePowerGating" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisableGmcPowerGating" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisableHdpClockPowerGating" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisableHdpMGClockGating" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisableKmRender" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisableKmRenderBoost" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisableOverclockedPstates" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisablePowerGating" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisableSamuClockGating" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisableSysClockGating" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisableUVDPowerGating" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisableVceClockGating" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisableWriteCombining" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisableXdmaPowerGating" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisableXdmaSclkGating" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "Disable_OverlayDSQualityEnhancement" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DpiMapIommuContiguous" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "EnableAggressivePStateBoost" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "EnableAggressivePStateOnly" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "EnableDirectFlip" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "EnableIndependentFlip" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "EnablePerformanceMode" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "EnableRuntimePowerManagement" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "EnableUlps" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "FlTransitionLatency" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "MonitorLatencyTolerance" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "MonitorRefreshLatencyTolerance" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "PowerSavingTweaks" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "PP_SclkDeepSleepDisable" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "PP_ThermalAutoThrottlingEnable" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "PrimaryPushBufferSize" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "RmClkPowerOffDramPllWhenUnused" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "RMDeepLlEntryLatencyUsec" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "RMDisablePostL2Compression" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "RmDisableRegistryCaching" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "RmFbsrPagedDMA" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "RmGpsPsEnablePerCpuCoreDpc" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "StutterMode" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "UseGpuTimer" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "EnableSystemMemoryTiling" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "ENABLE_OCA_LOGGING" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "PCIEPowerControl" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "PCIEPowerControl_8086191f50001458" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "RMClkSlowDown" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "RMDisableGpuASPMFlags" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "RmDisableHdcp22" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "RMEnableASPMAtLoad" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "RMEnableASPMDT" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "RmMIONoPowerOff" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "RmPerfRatedTdpLimit" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "RMSkipHdcp22Init" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "RmWotHdcpEnable" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "F1TransitionLatency" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "RMDeepL1EntryLatencyUsec" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "EnableCoreSlowdown" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "EnableMClkSlowdown" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "EnableNVClkSlowdown" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "RmDisableHwFaultBuffer" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "KMD_EnableGDIAcceleration" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "RmRcWatchdog" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "RMCtxswLog" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "EnableMidGfxpSharedBuffer" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "RmEnableHda" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "EnableHDAudioD3Cold" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v "EnableRID61684" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v "EnableRID73779" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v "EnableRID73780" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v "EnableRID74361" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\NVAPI" /v "RmGpsPsEnablePerCpuCoreDpc" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\NVTweak" /v "RmGpsPsEnablePerCpuCoreDpc" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\NVTweak" /v "DisplayPowerSaving" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "AllowMaxPerf" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "EnableMemoryTiling" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "EnableSystemMemoryTiling" /f

reg delete "HKLM\SYSTEM\ControlSet001\Services\NVDisplay.ContainerLocalSystem\LocalSystem\NvcDispCorePlugin" /v "DisableLoad" /f
reg delete "HKLM\SYSTEM\ControlSet001\Services\NVDisplay.ContainerLocalSystem\LocalSystem\NvcDispCorePlugin" /v "LogLevel" /f

reg delete "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v "EnableRID44231" /f
reg delete "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v "EnableRID64640" /f
reg delete "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v "EnableRID66610" /f

rem ::: Reverting Telemetry
rem ::: Note: The original script deleted the 'NvBackend' run key. We cannot restore it blindly
rem ::: because the path varies by system. Reinstall drivers if you need GeForce Experience auto-start.

reg delete "HKLM\SOFTWARE\NVIDIA Corporation\NvControlPanel2\Client" /v "OptInOrOutPreference" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\Startup" /v "SendTelemetryData" /f

rem ::: Re-enabling Scheduled Tasks
schtasks /change /enable /tn "NvTmRep_CrashReport1_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}"
schtasks /change /enable /tn "NvTmRep_CrashReport2_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}"
schtasks /change /enable /tn "NvTmRep_CrashReport3_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}"
schtasks /change /enable /tn "NvTmRep_CrashReport4_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}"
schtasks /change /enable /tn "NvDriverUpdateCheckDaily_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}"
schtasks /change /enable /tn "NVIDIA GeForce Experience SelfUpdate_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}"
schtasks /change /enable /tn "NvTmMon_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}"

rem ::: Reverting DPC
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "RmGpsPsEnablePerCpuCoreDpc" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\NVAPI" /v "RmGpsPsEnablePerCpuCoreDpc" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\NVTweak" /v "RmGpsPsEnablePerCpuCoreDpc" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "RmGpsPsEnablePerCpuCoreDpc" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "RmGpsPsEnablePerCpuCoreDpc" /f

rem ::: Reverting Tray Icon
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\NVIDIA Corporation\NvTray" /v "StartOnLogin" /f

rem ::: Reverting Advanced 3D Settings
reg delete "HKEY_CURRENT_USER\Software\NVIDIA Corporation\Global\NVTweak" /v "Gestalt" /f

rem ::: Reverting Sharpening Filter
reg delete "HKLM\SYSTEM\CurrentControlSet\services\nvlddmkm\FTS" /v "EnableGR535" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Parameters\FTS" /v "EnableGR535" /f

echo Done. Please restart your computer.
PAUSE