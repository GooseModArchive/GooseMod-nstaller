@echo off
set path=%appdata%\discord\settings.json
echo Installing GooseMod, please wait about 10 seconds... (your Discord will close/restart)

C:\Windows\System32\TASKKILL.exe /f /im Discord.exe >nul 2>&1
C:\Windows\System32\TASKKILL.exe /f /im Discord.exe >nul 2>&1
C:\Windows\System32\TASKKILL.exe /f /im Discord.exe >nul 2>&1

C:\Windows\System32\TIMEOUT.exe /t 3 /nobreak >nul 2>&1

copy "%path%" temp1.json
(
  for /F "tokens=*" %%A in (temp1.json) do (
    echo %%A
    if "%%A" equ "{" (
      echo "UPDATE_ENDPOINT": "https://web.archive.org/web/20220910153702/https://updates.goosemod.com/goosemod",
      echo "NEW_UPDATE_ENDPOINT": "https://web.archive.org/web/20220910153702/https://updates.goosemod.com/goosemod/",
    )
  )
) >temp2.json
move /y temp2.json "%path%"
del temp1.json

start "" "%localappdata%\Discord\Update.exe" --processStart Discord.exe

echo.
echo Please restart Discord from the system tray ^(bottom right icons^) by right clicking the icon ^> quit^, then reopen it^. You MUST do this even if this script restarted Discord for you^. Thanks^!
pause

goto 2>nul & del "%~f0"