
@echo off

:: Download scripts from your GitHub repo
curl -s -L -o login.py https://raw.githubusercontent.com/efajtahamid/Rustdesk.Rdp/refs/heads/main/login.py
curl -s -L -o loop.bat https://raw.githubusercontent.com/efajtahamid/Rustdesk.Rdp/refs/heads/main/Loop.bat
curl -s -L -o show.bat https://raw.githubusercontent.com/efajtahamid/Rustdesk.Rdp/refs/heads/main/Show.bat
curl -s -L -o timelimit.py https://raw.githubusercontent.com/efajtahamid/Rustdesk.Rdp/refs/heads/main/timelimit.py
curl -s -L -o wall.bat https://gitlab.com/chamod12/changewallpaper-win10/-/raw/main/wall.bat

:: Download RustDesk
certutil -urlcache -split -f "https://github.com/rustdesk/rustdesk/releases/download/1.2.3-1/rustdesk-1.2.3-1-x86_64.exe" rustdesk.exe

:: Download other tools
curl -s -L -o C:\Users\Public\Desktop\Telegram.exe https://telegram.org/dl/desktop/win64
curl -s -L -o C:\Users\Public\Desktop\Winrar.exe https://www.rarlab.com/rar/winrar-x64-621.exe
powershell -Command "Invoke-WebRequest 'https://github.com/chieunhatnang/VM-QuickConfig/releases/download/1.6.1/VMQuickConfig.exe' -OutFile 'C:\Users\Public\Desktop\VMQuickConfig.exe'"

:: Install Python dependencies
pip install pyautogui --quiet
pip install psutil --quiet

:: Install Telegram and WinRAR silently
C:\Users\Public\Desktop\Telegram.exe /VERYSILENT /NORESTART
del C:\Users\Public\Desktop\Telegram.exe
C:\Users\Public\Desktop\Winrar.exe /S
del C:\Users\Public\Desktop\Winrar.exe

:: Remove unwanted shortcuts
del /f "C:\Users\Public\Desktop\Epic Games Launcher.lnk"
del /f "C:\Users\Public\Desktop\Unity Hub.lnk"

:: Set Windows username and password
net user Admin CryptoHunters

:: Optional GUI click if needed for VMQuickConfig
python -c "import pyautogui as pag; pag.click(906, 73, duration=2)"

:: Start RustDesk
start "" "rustdesk.exe"

:: Run login script
python login.py

:: Download and set custom wallpaper
curl -s -L -o C:\Users\Public\Pictures\RifatWallpaper.jpg https://i.supaimg.com/7739d6cc-992f-4956-87c0-859c079bf0fd.jpg
reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "C:\Users\Public\Pictures\RifatWallpaper.jpg" /f
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters

:: Start background monitoring scripts
start "" loop.bat
start "" python timelimit.py

:: Install Firefox silently
curl -s -L -o C:\Users\Public\Desktop\FirefoxSetup.exe "https://download.mozilla.org/?product=firefox-latest&os=win64&lang=en-US"
C:\Users\Public\Desktop\FirefoxSetup.exe /S
del C:\Users\Public\Desktop\FirefoxSetup.exe

:: Install Google Chrome silently
curl -s -L -o C:\Users\Public\Desktop\ChromeSetup.exe "https://dl.google.com/chrome/install/standalonesetup64.exe"
C:\Users\Public\Desktop\ChromeSetup.exe /silent /install
del C:\Users\Public\Desktop\ChromeSetup.exe
