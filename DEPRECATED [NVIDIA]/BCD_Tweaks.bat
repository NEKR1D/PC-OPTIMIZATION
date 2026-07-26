rem ::: BCDEDIT Tweaks

rem ::: Plundered by NEKR1D

rem ::: Originally created by Shoober420
rem ::: https://github.com/shoober420/windows11-scripts

if not exist C:\Windows\System32\wbem\WMIC.exe (
    echo Installing WMIC...
    DISM /Online /Add-Capability /CapabilityName:WMIC~~~~
    echo Done.
)

rem ::: Processor x2APIC Support helps operating systems run more efficiently on high core count configurations
bcdedit /set x2apicpolicy Enable

rem ::: Enable MSI
bcdedit /set configaccesspolicy Default
bcdedit /set MSI Default
bcdedit /set usephysicaldestination No
bcdedit /set usefirmwarepcisettings No

rem ::: Avoid the use of uncontiguous portions of low-memory from the OS
bcdedit /set firstmegabytepolicy UseAll
bcdedit /set avoidlowmemory 0x8000000
bcdedit /set nolowmem Yes

rem ::: Enable Physical Address Extension (PAE)
bcdedit /set pae ForceEnable

rem ::: Disable 57-bits 5-level paging, also known as "Linear Address 57". Only 100% effective on 10th gen Intel. 256 TB of virtual memory per-disk is way much more than enough anyway
bcdedit /set linearaddress57 OptOut
bcdedit /set increaseuserva 268435328

bcdedit /set disableelamdrivers Yes
bcdedit /set highestmode Yes
bcdedit /set forcefipscrypto No
bcdedit /set noumex Yes
bcdedit /set uselegacyapicmode No
bcdedit /set ems No
bcdedit /set extendedinput Yes
bcdedit /set debug No
bcdedit /set debugstart Disable
bcdedit /set bootdebug Off
bcdedit /set bootlog No
bcdedit /bootdebug Off
bcdedit /bootems Off
bcdedit /debug Off
bcdedit /ems Off

bcdedit /set sos On
bcdedit /set onecpu No
bcdedit /set halbreakpoint No
bcdedit /set bootmenupolicy Legacy
bcdedit /set graphicsmodedisabled No

rem ::: Set Number of Processors 
rem ::: define processor count (includes counting cores with HT on as 2 processors example; 8 cores = 16 processor threads if HT is on)
rem ::: intel 12900K with HT disabled = 16 cores/processors (8 P-core and 8 E-core)
bcdedit /set numproc 24

PAUSE
