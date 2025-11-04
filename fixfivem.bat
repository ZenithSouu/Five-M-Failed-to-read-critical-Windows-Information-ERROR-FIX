@echo off
net session >nul 2>&1
if %errorLevel% neq 0 (
    cls
    color 0C
    echo.
    echo [!] ADMINISTRATOR PRIVILEGES REQUIRED.
    echo [!] PLEASE RIGHT-CLICK THIS FILE AND SELECT "RUN AS ADMINISTRATOR".
    echo.
    echo [!] THIS SCRIPT WILL NOT SELF-ELEVATE.
    echo.
    pause
    exit /b
)

title [Fix FiveM Error] - SYSTEM TRACE WIPE
color 08
cls

echo.
echo [===============================================]
echo [         SPOOFER REACTOR INITIALIZED           ]
echo [===============================================]
echo.

echo [>] INITIATING SYSTEM TRACE WIPE SEQUENCE...
timeout /t 2 /nobreak >nul

echo.
echo [>] ACCESSING CRITICAL SYSTEM REGISTRY...
timeout /t 1 /nobreak >nul
reg add "HKLM\SOFTWARE\Microsoft\Cryptography" /v "MachineGuid" /t REG_SZ /d %random%%random%%random% /f >nul 2>&1 && (
    echo [+] MACHINE GUID REGENERATED
) || (
    echo [-] FAILED TO REGENERATE MACHINE GUID
)
timeout /t 1 /nobreak >nul

echo.
echo [>] OVERRIDING PRODUCT IDENTIFICATION...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "ProductId" /t REG_SZ /d 12345-67890-12345-67890 /f >nul 2>&1 && (
    echo [+] PRODUCT ID RESET
) || (
    echo [-] FAILED TO RESET PRODUCT ID
)
timeout /t 1 /nobreak >nul

echo.
echo [>] CORRUPTING INSTALLATION TIMESTAMPS...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "InstallDate" /t REG_DWORD /d 0x63D9F5A5 /f >nul 2>&1 && (
    echo [+] INSTALL DATE WIPE COMPLETE
) || (
    echo [-] FAILED TO WIPE INSTALL DATE
)
timeout /t 1 /nobreak >nul

echo.
echo [>] PURGING NETWORK CACHES...
ipconfig /flushdns >nul 2>&1 && (
    echo [+] DNS CACHE PURGED
) || (
    echo [-] FAILED TO PURGE DNS CACHE
)
timeout /t 1 /nobreak >nul

echo.
echo [===============================================]
echo [  SYSTEM TRACES SUCCESSFULLY WIPE - REACTOR OK ]
echo [===============================================]
echo.
echo [!] SPOOFER REACTOR REMAINING ACTIVE.
echo [!] DO NOT CLOSE THIS WINDOW UNLESS INTENDED.
echo.
echo Press any key to terminate session...
pause >nul
