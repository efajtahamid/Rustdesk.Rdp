@echo off
echo Alive 👾...

:recheck
REM Check if provisioner.exe is running
tasklist | find /i "provisioner.exe" >nul
if %errorlevel%==0 (
    REM Still alive, wait a bit and check again
    ping 127.0.0.1 -n 2 >nul
    goto recheck
) else (
    echo Dead 💀...
)
