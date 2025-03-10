@echo off
setlocal enabledelayedexpansion

if not "%~1"=="" (
    for %%i in (%*) do (
        call :install_%%i
    )
    exit /b
)

:browsers_menu
cls
echo  WEB BROWSERS
echo.
echo  Select browsers to install:
echo.
echo  [1] Google Chrome
echo  [2] Mozilla Firefox
echo  [3] Microsoft Edge (if not already installed)
echo  [4] Brave Browser
echo  [5] Opera
echo  [6] Vivaldi
echo  [7] Tor Browser
echo  [8] LibreWolf
echo  [9] Install All Browsers
echo  [0] Back to Main Menu
echo.
choice /c 1234567890 /m "Enter your choice:"

if errorlevel 10 exit /b
if errorlevel 9 (
    call "%~dp0choco_installer.bat" googlechrome "Google Chrome"
    call "%~dp0choco_installer.bat" firefox "Mozilla Firefox"
    call :install_edge
    call "%~dp0choco_installer.bat" brave "Brave Browser"
    call "%~dp0choco_installer.bat" opera "Opera Browser"
    call "%~dp0choco_installer.bat" vivaldi "Vivaldi Browser"
    call "%~dp0choco_installer.bat" tor-browser "Tor Browser"
    call "%~dp0choco_installer.bat" librewolf "LibreWolf Browser"
    goto browsers_menu
)
if errorlevel 8 call "%~dp0choco_installer.bat" librewolf "LibreWolf Browser" & goto browsers_menu
if errorlevel 7 call "%~dp0choco_installer.bat" tor-browser "Tor Browser" & goto browsers_menu
if errorlevel 6 call "%~dp0choco_installer.bat" vivaldi "Vivaldi Browser" & goto browsers_menu
if errorlevel 5 call "%~dp0choco_installer.bat" opera "Opera Browser" & goto browsers_menu
if errorlevel 4 call "%~dp0choco_installer.bat" brave "Brave Browser" & goto browsers_menu
if errorlevel 3 call :install_edge & goto browsers_menu
if errorlevel 2 call "%~dp0choco_installer.bat" firefox "Mozilla Firefox" & goto browsers_menu
if errorlevel 1 call "%~dp0choco_installer.bat" googlechrome "Google Chrome" & goto browsers_menu

:install_edge
echo Checking for Microsoft Edge...
if exist "%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe" (
    echo Microsoft Edge is already installed.
    timeout /t 2 >nul
) else (
    call "%~dp0choco_installer.bat" microsoft-edge "Microsoft Edge"
)
exit /b