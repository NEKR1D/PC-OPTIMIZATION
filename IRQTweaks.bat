rem ::: Message Signal Intterupt Priorites Batch

rem ::: Plundered and updated by NEKR1D

rem ::: Defines MSI options such as priority and intterupt assignment for all MSI enabled hardware in PC
rem ::: Disables MSI from devices (such as specific chipset drivers) that are not used, disabled in device manager and should be disabled system-wide
rem ::: Use Interupt Afinifty Policy Tool to set assigned cores per MSI

rem ::: !!! Warning !!!
rem ::: !!! DO NOT INSTALL !!!
rem ::: !!! Your hardware, chipset and devices are different !!!
rem ::: !!! Use script as reference only !!!

setlocal

set "AFFINITY_PATH=\Device Parameters\Interrupt Management\Affinity Policy"
set "MSI_PATH=\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties"

set "BASE=SYSTEM\CurrentControlSet\Enum\PCI\VEN_10DE&DEV_220A&SUBSYS_886B1043&REV_A1\4&26196085&0&0008"

reg add "%BASE%%AFFINITY_PATH%" /v DevicePriority /t REG_DWORD /d 3 /f 
reg add "%BASE%%AFFINITY_PATH%" /v DevicePolicy /t REG_DWORD /d 4 /f 
reg add "%BASE%%AFFINITY_PATH%" /v AssignmentSetOverride /t REG_BINARY /d c000000000000000 /f 
reg add "%BASE%%MSI_PATH%" /v MSISupported /t REG_DWORD /d 1 /f 
reg add "%BASE%%MSI_PATH%" /v MessageNumberLimit /t REG_DWORD /d 1 /f 

set "BASE=SYSTEM\CurrentControlSet\Enum\PCI\VEN_15B7&DEV_5011&SUBSYS_501115B7&REV_01\4&447857b&0&00D0"

reg add "%BASE%%AFFINITY_PATH%" /v DevicePriority /t REG_DWORD /d 3 /f 
reg add "%BASE%%AFFINITY_PATH%" /v DevicePolicy /t REG_DWORD /d 4 /f 
reg add "%BASE%%AFFINITY_PATH%" /v AssignmentSetOverride /t REG_BINARY /d 00ffff0000000000 /f 
reg add "%BASE%%MSI_PATH%" /v MSISupported /t REG_DWORD /d 1 /f 
reg add "%BASE%%MSI_PATH%" /v MessageNumberLimit /t REG_DWORD /d 64 /f 

set "BASE=SYSTEM\CurrentControlSet\Enum\PCI\VEN_1B21&DEV_0612&SUBSYS_10601B21&REV_02\4&356c68ea&0&00E3"

reg add "%BASE%%AFFINITY_PATH%" /v DevicePriority /t REG_DWORD /d 3 /f 
reg add "%BASE%%AFFINITY_PATH%" /v DevicePolicy /t REG_DWORD /d 4 /f 
reg add "%BASE%%AFFINITY_PATH%" /v AssignmentSetOverride /t REG_BINARY /d 0000ff0000000000 /f 
reg add "%BASE%%MSI_PATH%" /v MSISupported /t REG_DWORD /d 1 /f 
reg add "%BASE%%MSI_PATH%" /v MessageNumberLimit /t REG_DWORD /d 8 /f 

set "BASE=SYSTEM\CurrentControlSet\Enum\PCI\VEN_8086&DEV_15F3&SUBSYS_7D301462&REV_03\4&270211e3&0&00E1"

reg add "%BASE%%AFFINITY_PATH%" /v DevicePriority /t REG_DWORD /d 3 /f 
reg add "%BASE%%AFFINITY_PATH%" /v DevicePolicy /t REG_DWORD /d 4 /f 
reg add "%BASE%%AFFINITY_PATH%" /v AssignmentSetOverride /t REG_BINARY /d 1800000000000000 /f 
reg add "%BASE%%MSI_PATH%" /v MSISupported /t REG_DWORD /d 1 /f 
reg add "%BASE%%MSI_PATH%" /v MessageNumberLimit /t REG_DWORD /d 4 /f 

set "BASE=SYSTEM\CurrentControlSet\Enum\PCI\VEN_8086&DEV_460D&SUBSYS_7D301462&REV_02\3&11583659&0&08"

reg delete "%BASE%%AFFINITY_PATH%" /v DevicePriority /f 
reg delete "%BASE%%AFFINITY_PATH%" /v DevicePolicy /f 
reg delete "%BASE%%AFFINITY_PATH%" /v AssignmentSetOverride /f 
reg delete "%BASE%%MSI_PATH%" /v MSISupported /f 
reg delete "%BASE%%MSI_PATH%" /v MessageNumberLimit /f 

set "BASE=SYSTEM\CurrentControlSet\Enum\PCI\VEN_8086&DEV_464D&SUBSYS_00000000&REV_02\3&11583659&0&30"

reg delete "%BASE%%AFFINITY_PATH%" /v DevicePriority /f 
reg delete "%BASE%%AFFINITY_PATH%" /v DevicePolicy /f 
reg delete "%BASE%%AFFINITY_PATH%" /v AssignmentSetOverride /f 
reg delete "%BASE%%MSI_PATH%" /v MSISupported /f 
reg delete "%BASE%%MSI_PATH%" /v MessageNumberLimit /f 

set "BASE=SYSTEM\CurrentControlSet\Enum\PCI\VEN_8086&DEV_4660&SUBSYS_7D301462&REV_02\3&11583659&0&00"

reg delete "%BASE%%AFFINITY_PATH%" /v DevicePriority /f 
reg delete "%BASE%%AFFINITY_PATH%" /v DevicePolicy /f 
reg delete "%BASE%%AFFINITY_PATH%" /v AssignmentSetOverride /f 
reg delete "%BASE%%MSI_PATH%" /v MSISupported /f 
reg delete "%BASE%%MSI_PATH%" /v MessageNumberLimit /f 

set "BASE=SYSTEM\CurrentControlSet\Enum\PCI\VEN_8086&DEV_7A84&SUBSYS_7D301462&REV_11\3&11583659&0&F8"

reg delete "%BASE%%AFFINITY_PATH%" /v DevicePriority /f 
reg delete "%BASE%%AFFINITY_PATH%" /v DevicePolicy /f 
reg delete "%BASE%%AFFINITY_PATH%" /v AssignmentSetOverride /f 
reg delete "%BASE%%MSI_PATH%" /v MSISupported /f 
reg delete "%BASE%%MSI_PATH%" /v MessageNumberLimit /f 

set "BASE=SYSTEM\CurrentControlSet\Enum\PCI\VEN_8086&DEV_7AB8&SUBSYS_00000000&REV_11\3&11583659&0&E0"

reg delete "%BASE%%AFFINITY_PATH%" /v DevicePriority /f 
reg delete "%BASE%%AFFINITY_PATH%" /v DevicePolicy /f 
reg delete "%BASE%%AFFINITY_PATH%" /v AssignmentSetOverride /f 
reg delete "%BASE%%MSI_PATH%" /v MSISupported /f 
reg delete "%BASE%%MSI_PATH%" /v MessageNumberLimit /f 

set "BASE=SYSTEM\CurrentControlSet\Enum\PCI\VEN_8086&DEV_7AB9&SUBSYS_7D301462&REV_11\3&11583659&0&E1"

reg delete "%BASE%%AFFINITY_PATH%" /v DevicePriority /f 
reg delete "%BASE%%AFFINITY_PATH%" /v DevicePolicy /f 
reg delete "%BASE%%AFFINITY_PATH%" /v AssignmentSetOverride /f 
reg delete "%BASE%%MSI_PATH%" /v MSISupported /f 
reg delete "%BASE%%MSI_PATH%" /v MessageNumberLimit /f 

set "BASE=SYSTEM\CurrentControlSet\Enum\PCI\VEN_8086&DEV_7ABB&SUBSYS_7D301462&REV_11\3&11583659&0&E3"

reg delete "%BASE%%AFFINITY_PATH%" /v DevicePriority /f 
reg delete "%BASE%%AFFINITY_PATH%" /v DevicePolicy /f 
reg delete "%BASE%%AFFINITY_PATH%" /v AssignmentSetOverride /f 
reg delete "%BASE%%MSI_PATH%" /v MSISupported /f 
reg delete "%BASE%%MSI_PATH%" /v MessageNumberLimit /f 

set "BASE=SYSTEM\CurrentControlSet\Enum\PCI\VEN_8086&DEV_7AC0&SUBSYS_00000000&REV_11\3&11583659&0&D8"

reg delete "%BASE%%AFFINITY_PATH%" /v DevicePriority /f 
reg delete "%BASE%%AFFINITY_PATH%" /v DevicePolicy /f 
reg delete "%BASE%%AFFINITY_PATH%" /v AssignmentSetOverride /f 
reg delete "%BASE%%MSI_PATH%" /v MSISupported /f 
reg delete "%BASE%%MSI_PATH%" /v MessageNumberLimit /f 

set "BASE=SYSTEM\CurrentControlSet\Enum\PCI\VEN_8086&DEV_7AC4&SUBSYS_7D301462&REV_11\3&11583659&0&DC"

reg delete "%BASE%%AFFINITY_PATH%" /v DevicePriority /f 
reg delete "%BASE%%AFFINITY_PATH%" /v DevicePolicy /f 
reg delete "%BASE%%AFFINITY_PATH%" /v AssignmentSetOverride /f 
reg delete "%BASE%%MSI_PATH%" /v MSISupported /f 
reg delete "%BASE%%MSI_PATH%" /v MessageNumberLimit /f 

set "BASE=SYSTEM\CurrentControlSet\Enum\PCI\VEN_8086&DEV_7AC8&SUBSYS_001A0100&REV_11\3&11583659&0&D0"

reg delete "%BASE%%AFFINITY_PATH%" /v DevicePriority /f 
reg delete "%BASE%%AFFINITY_PATH%" /v DevicePolicy /f 
reg delete "%BASE%%AFFINITY_PATH%" /v AssignmentSetOverride /f 
reg delete "%BASE%%MSI_PATH%" /v MSISupported /f 
reg delete "%BASE%%MSI_PATH%" /v MessageNumberLimit /f 

set "BASE=SYSTEM\CurrentControlSet\Enum\PCI\VEN_8086&DEV_7AE0&SUBSYS_7D301462&REV_11\3&11583659&0&A0"

reg add "%BASE%%AFFINITY_PATH%" /v DevicePriority /t REG_DWORD /d 3 /f 
reg add "%BASE%%AFFINITY_PATH%" /v DevicePolicy /t REG_DWORD /d 4 /f 
reg add "%BASE%%AFFINITY_PATH%" /v AssignmentSetOverride /t REG_BINARY /d 0600000000000000 /f 
reg add "%BASE%%MSI_PATH%" /v MSISupported /t REG_DWORD /d 1 /f 
reg add "%BASE%%MSI_PATH%" /v MessageNumberLimit /t REG_DWORD /d 8 /f 

set "BASE=SYSTEM\CurrentControlSet\Enum\PCI\VEN_8086&DEV_7AE2&SUBSYS_7D301462&REV_11\3&11583659&0&B8"

reg add "%BASE%%AFFINITY_PATH%" /v DevicePriority /t REG_DWORD /d 3 /f 
reg add "%BASE%%AFFINITY_PATH%" /v DevicePolicy /t REG_DWORD /d 4 /f 
reg add "%BASE%%AFFINITY_PATH%" /v AssignmentSetOverride /t REG_BINARY /d 00ffff0000000000 /f 
reg add "%BASE%%MSI_PATH%" /v MSISupported /t REG_DWORD /d 1 /f 
reg add "%BASE%%MSI_PATH%" /v MessageNumberLimit /t REG_DWORD /d 1 /f 

endlocal
