@ECHO OFF
::Check Bitlockerstatus
Bitlocker

ECHO Please Wait...
:: Section 1: Checking
ECHO==========
ECHO Open Bitlocker
manage-bde -status

ECHO====
ECHO TMP version

wmic /namespace:\\root\cimv2\security\microsofttpm path win32_tpm get * /format:textvaluelist.xsl

@ECHO OFF
::This batch file update Windows defender
:: Defender update
TITLE Updating Windows Defender
ECHO Please Wait...
:: Section 1: moving to Defender folder
ECHO==========
cd C:\ProgramData\Microsoft\Windows Defender\Platform\4.18* 
MpCmdRun -SignatureUpdate
ECHO ==========
cd\
::Open powershell
ECHO TPM
powershell Get-TPM
ECHO
Secureboot
powershell Confirm-SecurebootUEFI

@ECHO OFF
::Check Computername

TITLE PC name
ECHO Please Wait...
:: Section 1: Checking
ECHO==========
ECHO Computer name
hostname

PAUSE