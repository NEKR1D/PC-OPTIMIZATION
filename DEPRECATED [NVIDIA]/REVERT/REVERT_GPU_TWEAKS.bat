@echo off
setlocal EnableExtensions DisableDelayedExpansion

rem ::: GPU Tweaks REVERSAL SCRIPT
rem ::: Removes registry keys added by the "GPU Tweaks" script.

echo Reverting changes...

rem ::: Reverting Miracast
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "PlatformSupportMiracast" /f

rem ::: Reverting Affinity tweak
rem ::: Note: The original script had a variable error here (%%i was undefined). 
rem ::: We are mirroring the logic, but this may result in an error if the original did not run correctly.
for /f "tokens=2 delims=^=" %%f in ('wmic cpu get NumberOfCores /value ^| find "="') do set Cores=%%f

if %Cores% gtr 4 (
  reg delete "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePolicy" /f
)

rem ::: Reverting DirectDraw Tweaks
reg delete "HKLM\SOFTWARE\Microsoft\DirectDraw" /v "DisableAGPSupport" /f
reg delete "HKCU\SOFTWARE\Microsoft\DirectDraw" /v "DisableAGPSupport" /f
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\DirectDraw" /v "DisableAGPSupport" /f

rem ::: Reverting Power/Latency Tweaks
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "ExitLatency" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "ExitLatencyCheckEnabled" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "Latency" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyToleranceDefault" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyToleranceFSVP" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyTolerancePerfOverride" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyToleranceScreenOffIR" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyToleranceVSyncEnabled" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "RtlCapabilityCheckLatency" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ExitLatency" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ExitLatencyCheckEnabled" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "Latency" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "LatencyToleranceDefault" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "LatencyToleranceFSVP" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "LatencyTolerancePerfOverride" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "LatencyToleranceScreenOffIR" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "LatencyToleranceVSyncEnabled" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "RtlCapabilityCheckLatency" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultD3TransitionLatencyActivelyUsed" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultD3TransitionLatencyIdleLongTime" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultD3TransitionLatencyIdleMonitorOff" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultD3TransitionLatencyIdleNoContext" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultD3TransitionLatencyIdleShortTime" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultD3TransitionLatencyIdleVeryLongTime" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultLatencyToleranceIdle0" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultLatencyToleranceIdle0MonitorOff" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultLatencyToleranceIdle1" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultLatencyToleranceIdle1MonitorOff" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultLatencyToleranceMemory" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultLatencyToleranceMemoryNoContext" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultLatencyToleranceNoContext" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultLatencyToleranceNoContextMonitorOff" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultLatencyToleranceOther" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultLatencyToleranceTimerPeriod" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultMemoryRefreshLatencyToleranceActivelyUsed" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultMemoryRefreshLatencyToleranceMonitorOff" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultMemoryRefreshLatencyToleranceNoContext" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "Latency" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "MaxIAverageGraphicsLatencyInOneBucket" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "MiracastPerfTrackGraphicsLatency" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "MonitorLatencyTolerance" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "MonitorRefreshLatencyTolerance" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "TransitionLatency" /f

rem ::: Reverting DPC ISP Latency tweaks
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DisableVsyncLatencyUpdate" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DisableSensorWatchdog" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyToleranceIdleResiliency" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MfBufferingThreshold" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "CsEnabled" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "QosManagesIdleProcessors" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "SleepReliabilityDetailedDiagnostics" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "EventProcessorEnabled" /f

rem ::: Reverting GPU Power Options
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "RmGpsPsEnablePerCpuCoreDpc" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "PowerSavingTweaks" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DisableWriteCombining" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "EnableRuntimePowerManagement" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "PrimaryPushBufferSize" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "FlTransitionLatency" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "D3PCLatency" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "RMDeepLlEntryLatencyUsec" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "Node3DLowLatency" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "LOWLATENCY" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "RmDisableRegistryCaching" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "RMDisablePostL2Compression" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "UseGpuTimer" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "F1TransitionLatency" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "RMDeepL1EntryLatencyUsec" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MSDisabled" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "FxAccountingTelemetryDisabled" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DisableIdleStatesAtBoot" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "SleepstudyAccountingEnabled" /f

rem ::: Reverting GraphicsDrivers Power Latency Repeat
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "ExitLatency" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "ExitLatencyCheckEnabled" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "Latency" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "LatencyToleranceDefault" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "LatencyToleranceFSVP" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "LatencyTolerancePerfOverride" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "LatencyToleranceScreenOffIR" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "LatencyToleranceVSyncEnabled" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "RtlCapabilityCheckLatency" /f

rem ::: Reverting DirectX Driver Service Tweaks
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v "MonitorLatencyTolerance" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v "MonitorRefreshLatencyTolerance" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v "DriverSupportsCddDwmInterop" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v "DxgkCddSyncDxAccess" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v "DxgkCddSyncGPUAccess" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v "DxgkCddWaitForVerticalBlankEvent" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v "DxgkCreateSwapChain" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v "DxgkFreeGpuVirtualAddress" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v "DxgkOpenSwapChain" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v "DxgkShareSwapChainObject" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v "DxgkWaitForVerticalBlankEvent" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v "DxgkWaitForVerticalBlankEvent2" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v "SwapChainBackBuffer" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v "TdrResetFromTimeoutAsync" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrLevel" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrDelay" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrDebugMode" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrDdiDelay" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrDodPresentDelay" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrDodVSyncDelay" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrLimitCount" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrLimitTime" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "UseGpuTimer" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "RmGpsPsEnablePerCpuCoreDpc" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "PowerSavingTweaks" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableWriteCombining" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableRuntimePowerManagement" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "PrimaryPushBufferSize" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "FlTransitionLatency" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "D3PCLatency" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "RMDeepLlEntryLatencyUsec" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "Node3DLowLatency" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "LOWLATENCY" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "RmDisableRegistryCaching" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "RMDisablePostL2Compression" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "F1TransitionLatency" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "RMDeepL1EntryLatencyUsec" /f

rem ::: Reverting Direct3D Tweaks

reg delete "HKLM\SOFTWARE\Microsoft\Direct3D" /v "DisableVidMemVBs" /f
reg delete "HKCU\SOFTWARE\Microsoft\Direct3D" /v "DisableVidMemVBs" /f
reg delete "HKLM\SOFTWARE\WOW6432Node\Microsoft\Direct3D" /v "DisableVidMemVBs" /f

reg delete "HKLM\SOFTWARE\Microsoft\Direct3D" /v "FlipNoVsync" /f
reg delete "HKCU\SOFTWARE\Microsoft\Direct3D" /v "FlipNoVsync" /f
reg delete "HKLM\SOFTWARE\WOW6432Node\Microsoft\Direct3D" /v "FlipNoVsync" /f

reg delete "HKLM\SOFTWARE\Microsoft\Direct3D\Drivers" /v "SoftwareOnly" /f
reg delete "HKCU\SOFTWARE\Microsoft\Direct3D\Drivers" /v "SoftwareOnly" /f
reg delete "HKLM\SOFTWARE\WOW6432Node\Microsoft\Direct3D\Drivers" /v "SoftwareOnly" /f

reg delete "HKLM\SOFTWARE\Microsoft\DirectDraw" /v "EmulationOnly" /f
reg delete "HKCU\SOFTWARE\Microsoft\DirectDraw" /v "EmulationOnly" /f
reg delete "HKLM\SOFTWARE\WOW6432Node\Microsoft\DirectDraw" /v "EmulationOnly" /f

reg delete "HKLM\SOFTWARE\Microsoft\Direct3D\ReferenceDevice" /v "AllowAsync" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "AllowDeepCStates" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "AdaptiveVsyncEnable" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "Disable_OverlayDSQualityEnhancement" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableAsyncPstates" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableDynamicPstate" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableGDIAcceleration" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableKmRender" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableKmRenderBoost" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableOverclockedPstates" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisablePFonDP" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableAggressivePStateBoost" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableAggressivePStateOnly" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableDirectFlip" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableIndependentFlip" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnablePerformanceMode" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "PreferSystemMemoryContiguous" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "RmClkPowerOffDramPllWhenUnused" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "RmFbsrPagedDMA" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableBadDriverCheckForHwProtection" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableBoostedVSyncVirtualization" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableIndependentVidPnVSync" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableMultiSourceMPOCheck" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableFbrValidation" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "KnownProcessBoostMode" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DefaultD3TransitionLatencyActivelyUsed" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DefaultD3TransitionLatencyIdleNoContext" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DefaultLatencyToleranceIdle0" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DefaultLatencyToleranceNoContext" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DefaultLatencyToleranceTimerPeriod" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableCABC" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableGpuTimeoutDetection" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableVerticalBlankInterrupt" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DriverProtection" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DxgkWaitForIdle" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableAdvancedMemoryTimings" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableGpuMemoryOvercommitment" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableOptimizedFlipQueue" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ForceLowLatencyDisplayMode" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ForceOffScreenTimeout" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "lowdebounce" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "MaxPreRenderedFrames" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "MonitorLatencyTolerance" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "MonitorRefreshLatencyTolerance" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "NumberOfIdleStates" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "OPMSetProtectionLevel" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "PanelSelfRefresh" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "PoFxPowerControl" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "PoFxStartDevicePowerManagement" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "PowerSavingModeEnabled" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "Protection" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ProtectionLevel" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ReduceFrameLatency" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "SchedulingDelay" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "SupportRuntimePowerManagement" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "PMMEnable" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "FlipModel" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableFlipDiscard" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableDwmVSync" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "AdjustWorkerThreadPriority" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "AudioDgAutoBoostPriority" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "AutoSyncToCPUPriority" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "DebugLargeSmoothenedDuration" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "FrameServerAutoBoostPriority" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "QueuedPresentLimit" /f

reg delete "HKLM\SOFTWARE\Microsoft\DirectX" /v "D3D12_ENABLE_UNSAFE_COMMAND_BUFFER_REUSE" /f
reg delete "HKLM\SOFTWARE\Microsoft\DirectX" /v "D3D12_ENABLE_RUNTIME_DRIVER_OPTIMIZATIONS" /f
reg delete "HKLM\SOFTWARE\Microsoft\DirectX" /v "D3D12_RESOURCE_ALIGNMENT" /f
reg delete "HKLM\SOFTWARE\Microsoft\DirectX" /v "D3D11_MULTITHREADED" /f
reg delete "HKLM\SOFTWARE\Microsoft\DirectX" /v "D3D12_MULTITHREADED" /f
reg delete "HKLM\SOFTWARE\Microsoft\DirectX" /v "D3D11_DEFERRED_CONTEXTS" /f
reg delete "HKLM\SOFTWARE\Microsoft\DirectX" /v "D3D12_DEFERRED_CONTEXTS" /f
reg delete "HKLM\SOFTWARE\Microsoft\DirectX" /v "D3D11_ALLOW_TILING" /f
reg delete "HKLM\SOFTWARE\Microsoft\DirectX" /v "D3D11_ENABLE_DYNAMIC_CODEGEN" /f
reg delete "HKLM\SOFTWARE\Microsoft\DirectX" /v "D3D12_ALLOW_TILING" /f
reg delete "HKLM\SOFTWARE\Microsoft\DirectX" /v "D3D12_CPU_PAGE_TABLE_ENABLED" /f
reg delete "HKLM\SOFTWARE\Microsoft\DirectX" /v "D3D12_HEAP_SERIALIZATION_ENABLED" /f
reg delete "HKLM\SOFTWARE\Microsoft\DirectX" /v "D3D12_MAP_HEAP_ALLOCATIONS" /f
reg delete "HKLM\SOFTWARE\Microsoft\DirectX" /v "D3D12_RESIDENCY_MANAGEMENT_ENABLED" /f

rem ::: Reverting Contiguous Memory
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DpiMapIommuContiguous" /f

rem ::: Reverting VSync Control
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "VsyncIdleTimeout" /f

rem ::: Reverting DXGI Tweaks
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows" /v "AllowDelayedFlips" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows" /v "UseDx" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows" /v "UseGpuForRender" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows" /v "UseTdx" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows" /v "UseThreadedOptimization" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows" /v "UseWddmForFullscreenVideo" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows" /v "UseSoftwareRender" /f

reg delete "HKLM\SYSTEM\ControlSet001\Control\GraphicsDrivers" /v "SchedulingDelay" /f
reg delete "HKLM\SYSTEM\ControlSet001\Control\GraphicsDrivers" /v "SupportRuntimePowerManagement" /f
reg delete "HKLM\SYSTEM\ControlSet001\Control\GraphicsDrivers" /v "RuntimePowerManagement" /f
reg delete "HKLM\SYSTEM\ControlSet001\Control\GraphicsDrivers" /v "Protection" /f
reg delete "HKLM\SYSTEM\ControlSet001\Control\GraphicsDrivers" /v "ProtectionLevel" /f
reg delete "HKLM\SYSTEM\ControlSet001\Control\GraphicsDrivers" /v "OPMSetProtectionLevel" /f
reg delete "HKLM\SYSTEM\ControlSet001\Control\GraphicsDrivers" /v "NumberOfIdleStates" /f
reg delete "HKLM\SYSTEM\ControlSet001\Control\GraphicsDrivers" /v "EnableRuntimePowerManagement" /f
reg delete "HKLM\SYSTEM\ControlSet001\Control\GraphicsDrivers" /v "DriverProtection" /f
reg delete "HKLM\SYSTEM\ControlSet001\Control\GraphicsDrivers" /v "PoFxStartDevicePowerManagement" /f
reg delete "HKLM\SYSTEM\ControlSet001\Control\GraphicsDrivers" /v "PoFxPowerControl" /f
reg delete "HKLM\SYSTEM\ControlSet001\Control\GraphicsDrivers" /v "DxgkWaitForIdle" /f

reg delete "HKLM\SOFTWARE\Microsoft\Direct3D" /v "MMX Fast Path" /f
reg delete "HKCU\SOFTWARE\Microsoft\Direct3D" /v "MMX Fast Path" /f
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D" /v "MMX Fast Path" /f

reg delete "HKLM\SOFTWARE\Microsoft\DirectDraw" /v "UseNonLocalVidMem" /f
reg delete "HKCU\SOFTWARE\Microsoft\DirectDraw" /v "UseNonLocalVidMem" /f
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\DirectDraw" /v "UseNonLocalVidMem" /f
reg delete "HKLM\SOFTWARE\Microsoft\Direct3D" /v "UseNonLocalVidMem" /f
reg delete "HKCU\SOFTWARE\Microsoft\Direct3D" /v "UseNonLocalVidMem" /f
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D" /v "UseNonLocalVidMem" /f
reg delete "HKLM\SOFTWARE\Microsoft\DirectDraw" /v "DisableDDSCAPSInDDSD" /f
reg delete "HKCU\SOFTWARE\Microsoft\DirectDraw" /v "DisableDDSCAPSInDDSD" /f
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\DirectDraw" /v "DisableDDSCAPSInDDSD" /f
reg delete "HKLM\SOFTWARE\Microsoft\DirectDraw" /v "EmulatePointSprites" /f
reg delete "HKCU\SOFTWARE\Microsoft\DirectDraw" /v "EmulatePointSprites" /f
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\DirectDraw" /v "EmulatePointSprites" /f
reg delete "HKLM\SOFTWARE\Microsoft\Direct3D\Drivers" /v "ForceRgbRasterizer" /f
reg delete "HKCU\SOFTWARE\Microsoft\Direct3D\Drivers" /v "ForceRgbRasterizer" /f
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D\Drivers" /v "ForceRgbRasterizer" /f
reg delete "HKLM\SOFTWARE\Microsoft\DirectDraw" /v "EmulateStateBlocks" /f
reg delete "HKCU\SOFTWARE\Microsoft\DirectDraw" /v "EmulateStateBlocks" /f
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\DirectDraw" /v "EmulateStateBlocks" /f
reg delete "HKLM\SOFTWARE\Microsoft\Direct3D" /v "EnableDebugging" /f
reg delete "HKCU\SOFTWARE\Microsoft\Direct3D" /v "EnableDebugging" /f
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D" /v "EnableDebugging" /f
reg delete "HKLM\SOFTWARE\Microsoft\Direct3D" /v "FullDebug" /f
reg delete "HKCU\SOFTWARE\Microsoft\Direct3D" /v "FullDebug" /f
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D" /v "FullDebug" /f
reg delete "HKLM\SOFTWARE\Microsoft\Direct3D" /v "DisableDM" /f
reg delete "HKCU\SOFTWARE\Microsoft\Direct3D" /v "DisableDM" /f
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D" /v "DisableDM" /f
reg delete "HKLM\SOFTWARE\Microsoft\Direct3D" /v "EnableMultimonDebugging" /f
reg delete "HKCU\SOFTWARE\Microsoft\Direct3D" /v "EnableMultimonDebugging" /f
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D" /v "EnableMultimonDebugging" /f
reg delete "HKLM\SOFTWARE\Microsoft\Direct3D" /v "LoadDebugRuntime" /f
reg delete "HKCU\SOFTWARE\Microsoft\Direct3D" /v "LoadDebugRuntime" /f
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D" /v "LoadDebugRuntime" /f
reg delete "HKLM\SOFTWARE\Microsoft\Direct3D\Drivers" /v "EnumReference" /f
reg delete "HKCU\SOFTWARE\Microsoft\Direct3D\Drivers" /v "EnumReference" /f
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D\Drivers" /v "EnumReference" /f
reg delete "HKLM\SOFTWARE\Microsoft\Direct3D\Drivers" /v "EnumSeparateMMX" /f
reg delete "HKCU\SOFTWARE\Microsoft\Direct3D\Drivers" /v "EnumSeparateMMX" /f
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D\Drivers" /v "EnumSeparateMMX" /f
reg delete "HKLM\SOFTWARE\Microsoft\Direct3D\Drivers" /v "EnumRamp" /f
reg delete "HKCU\SOFTWARE\Microsoft\Direct3D\Drivers" /v "EnumRamp" /f
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D\Drivers" /v "EnumRamp" /f
reg delete "HKLM\SOFTWARE\Microsoft\Direct3D\Drivers" /v "EnumNullDevice" /f
reg delete "HKCU\SOFTWARE\Microsoft\Direct3D\Drivers" /v "EnumNullDevice" /f
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D\Drivers" /v "EnumNullDevice" /f
reg delete "HKLM\SOFTWARE\Microsoft\Direct3D" /v "FewVertices" /f
reg delete "HKCU\SOFTWARE\Microsoft\Direct3D" /v "FewVertices" /f
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D" /v "FewVertices" /f
reg delete "HKLM\SOFTWARE\Microsoft\DirectDraw" /v "DisableMMX" /f
reg delete "HKCU\SOFTWARE\Microsoft\DirectDraw" /v "DisableMMX" /f
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\DirectDraw" /v "DisableMMX" /f
reg delete "HKLM\SOFTWARE\Microsoft\Direct3D" /v "DisableMMX" /f
reg delete "HKCU\SOFTWARE\Microsoft\Direct3D" /v "DisableMMX" /f
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D" /v "DisableMMX" /f
reg delete "HKLM\SOFTWARE\Microsoft\Direct3D" /v "MMXFastPath" /f
reg delete "HKCU\SOFTWARE\Microsoft\Direct3D" /v "MMXFastPath" /f
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D" /v "MMXFastPath" /f
reg delete "HKLM\SOFTWARE\Microsoft\Direct3D" /v "UseMMXForRGB" /f
reg delete "HKCU\SOFTWARE\Microsoft\Direct3D" /v "UseMMXForRGB" /f
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D" /v "UseMMXForRGB" /f
reg delete "HKLM\SOFTWARE\Microsoft\Direct3D\Drivers" /v "UseMMXForRGB" /f
reg delete "HKCU\SOFTWARE\Microsoft\Direct3D\Drivers" /v "UseMMXForRGB" /f
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D\Drivers" /v "UseMMXForRGB" /f
reg delete "HKLM\SOFTWARE\Microsoft\Direct3D\Drivers" /v "EnumSeparateMMX" /f
reg delete "HKCU\SOFTWARE\Microsoft\Direct3D\Drivers" /v "EnumSeparateMMX" /f
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D\Drivers" /v "EnumSeparateMMX" /f
reg delete "HKLM\SOFTWARE\Microsoft\DirectDraw" /v "ForceNoSysLock" /f
reg delete "HKCU\SOFTWARE\Microsoft\DirectDraw" /v "ForceNoSysLock" /f
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\DirectDraw" /v "ForceNoSysLock" /f

reg delete "HKLM\SOFTWARE\Microsoft\DirectDraw" /v "DisableInactivate" /f
reg delete "HKCU\SOFTWARE\Microsoft\DirectDraw" /v "DisableInactivate" /f
reg delete "HKLM\SOFTWARE\WOW6432Node\Microsoft\DirectDraw" /v "DisableInactivate" /f

reg delete "HKLM\SOFTWARE\Microsoft\DirectDraw" /v "DisableNoSysLock" /f
reg delete "HKCU\SOFTWARE\Microsoft\DirectDraw" /v "DisableNoSysLock" /f
reg delete "HKLM\SOFTWARE\WOW6432Node\Microsoft\DirectDraw" /v "DisableNoSysLock" /f

rem ::: Reverting Multi-GPU Selection
reg delete "HKLM\Software\Microsoft\DirectX\GraphicsSettings" /v "SpecificGPUOptionApplicable" /f
reg delete "HKCU\Software\Microsoft\DirectX\GraphicsSettings" /v "SpecificGPUOptionApplicable" /f

rem ::: Reverting Environment Variables
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "ANGLE_DISABLE_D3D11" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "ANGLE_DISABLE_VULKAN" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "CEF_DISABLE_GPU" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "__COMPAT_LAYER" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DISABLE_DYNAMIC_FPS" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DisableGPUTimeout" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DX_ENABLE_HIGH_SPEED_PRESENT" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DXGIFlipModel" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DXGI_FLIP_SEQUENTIAL" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DXGI_MAX_FRAME_LATENCY" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DX_LOW_LATENCY_MODE" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DX_MaxFramesToRenderAhead" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DX_MaxLatency" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "EnableAdaptiveSync" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "EnableExclusiveFullScreen" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "EnableGameMode" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "FlipEx" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "FORCE_GPU_TIMINGS" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "ForceThreadedRendering" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "HWACCEL" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "LatencyReductionMode" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "MaxFPS" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "MaxPendingFrames" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "UseFastWindowFlip" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "UseLowLatencyInputDriver" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "UseNewScheduler" /f

rem ::: Original script deleted keys for GPUPerf here. We cannot easily restore them without original backup.

reg delete "HKLM\SOFTWARE\Microsoft\Direct2D" /v "EnableRect" /f
reg delete "HKLM\SOFTWARE\Microsoft\Direct2D" /v "Sharpness" /f
reg delete "HKLM\SOFTWARE\Microsoft\Direct2D" /v "DisableGammaCorrection" /f
reg delete "HKLM\SOFTWARE\Microsoft\Direct2D" /v "DisableClearType" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "MaximumAllowedPreemptionDelay" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnableFlipOnVSyncHwFlipQueue" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnableFlipOnVSyncSwFlipQueue" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnableFlipImmediateHwFlipQueue" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnableFlipImmediateSwFlipQueue" /f

rem ::: Reverting HwQueuedRenderPacketGroupLimit
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "HwQueuedRenderPacketGroupLimit" /f

rem ::: Reverting more Environment Variables
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "CLOUDSDK_CORE_DISABLE_PROMPTS" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "CONFIG_HZ" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DIRECT_CPU" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DIRECT_GPU" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DOCKER_CLI_TELEMETRY_OPTOUT" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DOTNET_CLI_TELEMETRY_OPTOUT" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DOTNET_TRY_CLI_TELEMETRY_OPTOUT" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "ELECTRON_DISABLE_GPU" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "ELECTRON_ENABLE_CPU_RENDERING" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "HZ" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "KERNEL_HZ" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "MOZ_OMTC_ENABLED" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "MOZ_USE_OMTC" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "VS_TELEMETRY_OPT_OUT" /f

rem ::: Reverting setx/environment variables
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DXGL_FRAME_LATENCY_WAITABLE_OBJECT" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DXGI_FRAME_LATENCY_WAITABLE_OBJECT" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DXGI_SWAPCHAIN_FLUSH" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "GPU_MAX_ALLOC_PERCENT" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "GPU_SINGLE_ALLOC_PERCENT" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DX12_AGGRESSIVE_PIPELINE" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DX12_FORCE_WARP" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "GPU_SYNC_OBJECTS" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "GPU_MAX_HEAP_SIZE" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "GPU_FORCE_64BIT_PTR" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DXGI_ALLOW_TEARING" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DXGI_PRESENT_ALLOW_TEARING" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DXGI_SWAP_CHAIN_FLAG_ALLOW_TEARING" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "CHROME_HEADLESS" /f

reg delete "HKLM\SOFTWARE\Microsoft\DirectX" /v "DisableHWOverlay" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "AMD_ASYNC_SHADERS" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "AMD_FORCE_LOW_LATENCY_MODE" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DX_ENABLE_MULTITHREADED_OPTIMIZATIONS" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DX_MaxFrameBufferSize" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DX_USE_DXGI_FLIP_MODE" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "ENABLE_LOW_LATENCY_MODE" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "ENABLE_MEMORY_PREFETCH" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "FAST_RESPONSE_MODE" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "FlipEx" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "FORCE_HIGH_PRIORITY_THREAD_SCHEDULING" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "ForceThreadedRendering" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "__GL_MAX_FRAMES_ALLOWED" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "__GL_NO_SWAPLIMIT" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "__GL_SYNC_TO_VBLANK" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "GPU_ALLOW_HIGH_PRIORITY_TASKS" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "GPU_ASYNC_COMPUTE" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "GPU_DEFERRED_RENDERING" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "GPU_DISCARD_PENDING_WORK" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "GPU_DYNAMIC_PRIORITY" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "GPU_ENABLE_ASYNC_COMPUTE" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DX_ENABLE_MULTITHREADED_OPTIMIZATIONS" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "GPU_FRAME_TIME_LIMIT" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "GPU_MAX_FRAMERATE" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "GPU_MAX_TASK_PRIORITY" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "GPU_MAX_WORKGROUP_SIZE" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "GPU_MINIMUM_BATCH_SIZE" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "GPU_USE_DEDICATED_MEMORY" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "GPU_USE_SHARED_MEMORY" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "GPU_WAIT_FOR_FLIP" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "GPU_WAIT_ON_SWAPCHAIN" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "npm_config_loglevel" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "NVIDIA_MULTI_DISPLAY_POWER_SAVER" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "NVIDIA_SINGLE_DISP_MEM_OPTIMIZATION" /f

reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "AlwaysUseDirectFlip" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "AllowTearing" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "AwayModeEnabled" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultD3TransitionLatencyActivelyUsed" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultD3TransitionLatencyIdleLongTime" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultD3TransitionLatencyIdleMonitorOff" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultD3TransitionLatencyIdleNoContext" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultD3TransitionLatencyIdleShortTime" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultD3TransitionLatencyIdleVeryLongTime" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceIdle0" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceIdle0MonitorOff" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceIdle1" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceIdle1MonitorOff" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceMemory" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceMemoryNoContext" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceNoContext" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceNoContextMonitorOff" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceOther" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceTimerPeriod" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultMemoryRefreshLatencyToleranceActivelyUsed" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultMemoryRefreshLatencyToleranceMonitorOff" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultMemoryRefreshLatencyToleranceNoContext" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DisableThrottlingDuringGaming" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "EcoMode" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "EnableIdleStates" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "ForceMaxPerformance" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "FxVsyncEnabled" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HighestPerformance" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HighPerformance" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "IdleDisable" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "IgnoreCsComplianceCheck" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MaxIAverageGraphicsLatencyInOneBucket" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MonitorLatencyTolerance" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MonitorRefreshLatencyTolerance" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "OverrideMaxPerformance" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "PowerThrottling" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "ProcessorIdleDisable" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "TransitionLatency" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "VideoIdleTimeout" /f

reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows" /v "DCEInUseTelemetryDisabled" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows" /v "EnableRIMPnpThreadDelayBugcheck" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows" /v "RITdemonTimerPowerSaveCoalescing" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows" /v "RITdemonTimerPowerSaveElapse" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows" /v "TimerCoalescing" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "CrtcPhaseFrames" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableAsyncShaderCompile" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableGdiContextGpuVa" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableMonitoredFenceGpuVa" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisablePagingContextGpuVa" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableSecondaryIFlipSupport" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableVaBackedVm" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableVerticalBlankInterrupts" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DriverManagesResidencyOverride" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DRTTestEnable" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableAcmSupportDeveloperPreview" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableBasicRenderGpuPv" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableDecodeMPO" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableFuzzing" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableHMDTestMode" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableIntegratedPanelAcmByault" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableIntegratedPanelAcmByDefault" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableOfferReclaimOnDriver" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnablePanelFitterSupport" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableTimedCalls" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ExternalDiagnosticsBufferMultiplier" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ExternalDiagnosticsBufferSize" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "Force32BitFences" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ForceAccessedPhysically" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ForceBddFallbackOnly" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ForceEnableDWMClone" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ForceEnableDxgMms2" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ForceExplicitResidencyNotification" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ForceInitPagingProcessVaSpace" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ForceReplicateGdiContent" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ForceDirectFlip" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ForceSecondaryIFlipSupport" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ForceSecondaryMPOSupport" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "BuffersInFlight" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableWDDM23Synchronization" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "UnsupportedMonitorModesAllowed" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "UseXPModel" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableVersionMismatchCheck" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableIgnoreWin32ProcessStatus" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v "CreateGdiPrimaryOnSlaveGPU" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "PciLatencyTimerControl" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ForceSurpriseRemovalSupport" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ForceToMapGpuVa" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ForceUsb4MonitorSupport" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ForceVariableRefresh" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HighPriorityCompletionMode" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "InternalDiagnosticsBufferMultiplier" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "InternalDiagnosticsBufferSize" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "InvestigationDebugParameter" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "IoMmuFlags" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "IsInternalRelease" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "LimitNumberOfVfs" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "MultiMonSupport" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "NumVirtualFunctions" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "OutputDuplicationSessionApplicationLimit" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "PageFaultDebugMode" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "PreserveFirmwareMode" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "PreventFullscreenWireFormatChange" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "RapidHPDThresholdCount" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "SmallQuantumMode" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "SupportMultipleIntegratedDisplays" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TreatUsb4MonitorAsNormal" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "Usb4MonitorPowerOnDelayInSeconds" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ValidateWDDMCaps" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "VirtualGpuOnly" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "WDDM2LockManagement" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v "EnableFlipEx" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v "EnableFramePacing" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v "EnableHDASurfaces" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v "EnableIndependentFlip" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v "EnableSoftwarePaging" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v "EnableTiledResources" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v "ReduceStalls" /f

reg delete "HKLM\System\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "CarryOverUsedQuantum" /f
reg delete "HKLM\System\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "CountFlipTowardHwLimit" /f
reg delete "HKLM\System\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "CountPresentTowardHwLimit" /f
reg delete "HKLM\System\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnableFrameBufferCompression" /f
reg delete "HKLM\System\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnableGpuBoost" /f
reg delete "HKLM\System\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "HistoryLogSize" /f
reg delete "HKLM\System\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "HwQueuePacketCap" /f
reg delete "HKLM\System\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "PerSourceCustomDuration" /f
reg delete "HKLM\System\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "PfnCpuOverride" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\PnP\Pci" /v "AffinitizeAllInterrupts" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\PnP\Pci" /v "EnableMSI" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\PnP\Pci" /v "ForceMSI" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\PnP\Pci" /v "InterruptSteeringEnabled" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\PnP\Pci" /v "LowLatencyMode" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\PnP\Pci" /v "MSIEnable" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\PnP\Pci" /v "PCIDelayTransaction" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\PnP\Pci" /v "PCIPrefetchEnable" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\PnP\Pci" /v "UseMPSCap" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\PnP\Pci" /v "InterruptSteeringDisabled" /f

reg delete "HKLM\SOFTWARE\Microsoft\PolicyManager\default\System\DisableDirectXDatabaseUpdate" /v "value" /f

reg delete "HKCU\SOFTWARE\Microsoft\DirectDraw" /v "EnableWARP" /f
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\DirectDraw" /v "EnableWARP" /f
reg delete "HKLM\SOFTWARE\Microsoft\Direct3D" /v "AsyncFlip" /f
reg delete "HKLM\SOFTWARE\Microsoft\Direct3D" /v "DisablePresentationInterval" /f
reg delete "HKLM\SOFTWARE\Microsoft\Direct3D" /v "EnableFramePacing" /f
reg delete "HKLM\SOFTWARE\Microsoft\Direct3D" /v "EnableWARP" /f
reg delete "HKLM\SOFTWARE\Microsoft\Direct3D" /v "ForceWARP" /f
reg delete "HKLM\SOFTWARE\Microsoft\Direct3D" /v "RenderAheadLimit" /f
reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Direct3D" /v "EnableWARP" /f
reg delete "HKLM\SOFTWARE\Microsoft\Direct3D\Drivers" /v "EnableWARP" /f
reg delete "HKCU\SOFTWARE\Microsoft\Direct3D\Drivers" /v "EnableWARP" /f
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D\Drivers" /v "EnableWARP" /f

echo Done. Please restart your computer.
pause