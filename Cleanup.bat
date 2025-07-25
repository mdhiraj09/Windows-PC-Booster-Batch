::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFDpQQQ2MAE+/Fb4I5/jH+O+F4kkcQOMDaoDY0bGabukQ5SU=
::YAwzuBVtJxjWCl3EqQJhSA==
::ZR4luwNxJguZRRnXoBtgSA==
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFDpQQQ2MAE+/Fb4I5/jH7vqX4kkcQOMDW4Pe27rONfBT+Ub2fIY56nlWncoCGQsWewquDg==
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
color 0A
title 💻 PC Booster Script by Dhiraj
echo ===============================
echo 🚀 Starting Cleanup...
echo ===============================

:: 1. Take Ownership of Key Folders
echo 🔐 Taking ownership...
takeown /f %TEMP% /r /d y >nul
icacls %TEMP% /grant %username%:F /t >nul
takeown /f C:\Windows\Temp /r /d y >nul
icacls C:\Windows\Temp /grant %username%:F /t >nul
takeown /f C:\Windows\Prefetch /r /d y >nul
icacls C:\Windows\Prefetch /grant %username%:F /t >nul

:: 2. Clean Junk Files
echo 🧹 Deleting Temp Files...
del /f /s /q /a %TEMP%\*
del /f /s /q /a C:\Windows\Temp\*
del /f /s /q /a C:\Windows\Prefetch\*
del /f /s /q /a "%LOCALAPPDATA%\Temp\*"

echo 🗑️ Clearing Recycle Bin...
for /d %%x in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
  if exist %%x:\$Recycle.Bin rd /s /q %%x:\$Recycle.Bin 2>nul
)

echo 🌐 Clearing Chrome & Edge Cache...
rd /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache"
rd /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Code Cache"
rd /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache"
rd /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Code Cache"

:: 3. Apply Registry Tweaks
echo 🧠 Applying Registry Performance Tweaks...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize" /v StartupDelayInMSec /t REG_DWORD /d 0 /f
reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v WaitToKillServiceTimeout /t REG_SZ /d 2000 /f
reg add "HKCU\Control Panel\Desktop" /v AutoEndTasks /t REG_SZ /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v NoWarnDiskSpace /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t REG_DWORD /d 1 /f

:: 4. Disable Unused Services
echo ⚙️ Disabling Unused Windows Services...
sc stop "WSearch"
sc config "WSearch" start= disabled
sc stop "XblGameSave"
sc config "XblGameSave" start= disabled
sc stop "XboxNetApiSvc"
sc config "XboxNetApiSvc" start= disabled
sc stop "RemoteRegistry"
sc config "RemoteRegistry" start= disabled
sc stop "DiagTrack"
sc config "DiagTrack" start= disabled

:: 5. Clear Windows Update Cache
echo 🔄 Resetting Windows Update Cache...
net stop wuauserv
net stop bits
rd /s /q C:\Windows\SoftwareDistribution
net start wuauserv
net start bits

:: 6. Flush DNS and Clipboard
echo 🧹 Flushing DNS and Clipboard...
ipconfig /flushdns
echo off | clip

echo ✅ All optimizations complete! Restart your PC for full effect.
pause
exit
