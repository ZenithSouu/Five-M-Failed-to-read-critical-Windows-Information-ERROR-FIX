@echo off
title Spoofer Cleanup - Reset Traces
color 0B

echo Resetting hardware-related registry keys...

:: Reset Machine GUID
reg add "HKLM\SOFTWARE\Microsoft\Cryptography" /v "MachineGuid" /t REG_SZ /d %random%%random%%random% /f

:: Reset Product ID
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "ProductId" /t REG_SZ /d 12345-67890-12345-67890 /f

:: Reset Install Date
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "InstallDate" /t REG_DWORD /d 0x63D9F5A5 /f

:: Flush DNS just in case
ipconfig /flushdns

echo.
echo Spoofer traces cleaned.
pause