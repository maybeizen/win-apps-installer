@echo off
setlocal enabledelayedexpansion

title Windows Essential Apps Installer

color 0B
mode con: cols=110 lines=45

echo Checking for administrator privileges...
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo This script requires administrator privileges.
    echo Please right-click and select "Run as administrator".
    pause
    exit /b 1
)

set "SCRIPTS_DIR=%~dp0scripts"

set "TEMP_DIR=%TEMP%\win_essentials_installer"
if not exist "%TEMP_DIR%" mkdir "%TEMP_DIR%"

call :check_required_files

cls
echo  WINDOWS ESSENTIAL APPS INSTALLER
echo.
echo  This script will install commonly used applications on your Windows system.
echo  Each application is optional and you can choose which ones to install.
echo.
echo  Press any key to continue...
pause >nul

:install_chocolatey
cls
echo  INSTALLING CHOCOLATEY PACKAGE MANAGER 
echo.
echo  Chocolatey is a package manager for Windows that makes installing
echo  and updating applications easier.
echo.
choice /c YN /m "Do you want to install Chocolatey? (Y/N)"
if errorlevel 2 goto main_menu
if errorlevel 1 (
    echo Installing Chocolatey...
    @powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
    echo Chocolatey installed successfully.
    timeout /t 2 >nul
)

:main_menu
cls
echo  WINDOWS ESSENTIAL APPS INSTALLER
echo.
echo  Please select a category:
echo.
echo  [1] Web Browsers
echo  [2] Productivity Software
echo  [3] Media Players and Entertainment
echo  [4] Utilities and Tools
echo  [5] Development Tools
echo  [6] Database and Server Software
echo  [7] Security and Privacy Tools
echo  [8] Install All Recommended Apps
echo  [9] Exit
echo.
choice /c 123456789 /m "Enter your choice:"

if errorlevel 9 goto exit
if errorlevel 8 goto install_all
if errorlevel 7 call "%SCRIPTS_DIR%\security_privacy.bat" & goto main_menu
if errorlevel 6 call "%SCRIPTS_DIR%\database_server.bat" & goto main_menu
if errorlevel 5 call "%SCRIPTS_DIR%\dev_tools.bat" & goto main_menu
if errorlevel 4 call "%SCRIPTS_DIR%\utilities.bat" & goto main_menu
if errorlevel 3 call "%SCRIPTS_DIR%\media.bat" & goto main_menu
if errorlevel 2 call "%SCRIPTS_DIR%\productivity.bat" & goto main_menu
if errorlevel 1 call "%SCRIPTS_DIR%\browsers.bat" & goto main_menu

:install_all
cls
echo  INSTALLING ALL RECOMMENDED APPS
echo.
echo  This will install a selection of recommended applications:
echo  - Google Chrome
echo  - Mozilla Firefox
echo  - Adobe Reader
echo  - 7-Zip
echo  - VLC Media Player
echo  - Notepad++
echo  - Malwarebytes
echo  - Visual Studio Code
echo  - Git
echo.
echo  This process may take some time.
echo.
choice /c YN /m "Do you want to proceed? (Y/N)"
if errorlevel 2 goto main_menu

echo Installing recommended applications...
call "%SCRIPTS_DIR%\choco_installer.bat" googlechrome "Google Chrome"
call "%SCRIPTS_DIR%\choco_installer.bat" firefox "Mozilla Firefox"
call "%SCRIPTS_DIR%\choco_installer.bat" adobereader "Adobe Reader"
call "%SCRIPTS_DIR%\choco_installer.bat" 7zip "7-Zip"
call "%SCRIPTS_DIR%\choco_installer.bat" vlc "VLC Media Player"
call "%SCRIPTS_DIR%\choco_installer.bat" notepadplusplus "Notepad++"
call "%SCRIPTS_DIR%\choco_installer.bat" malwarebytes "Malwarebytes"
call "%SCRIPTS_DIR%\choco_installer.bat" vscode "Visual Studio Code"
call "%SCRIPTS_DIR%\choco_installer.bat" git "Git"

cls
echo  INSTALLATION COMPLETE
echo.
echo  All recommended applications have been installed successfully.
echo.
pause
goto main_menu

:exit
if exist "%TEMP_DIR%" rd /s /q "%TEMP_DIR%"

cls
echo  WINDOWS ESSENTIAL APPS INSTALLER
echo.
echo  Thank you for using the Windows Essential Apps Installer.
echo  All selected applications have been installed.
echo.
echo  Press any key to exit...
pause >nul
exit /b 0

:check_required_files
if not exist "%SCRIPTS_DIR%" (
    echo ERROR: Scripts directory not found.
    echo Please create a 'scripts' folder in the same directory as this installer.
    echo You can download the required script files from GitHub.
    pause
    exit /b 1
)

set "missing_files="
if not exist "%SCRIPTS_DIR%\choco_installer.bat" set "missing_files=!missing_files! choco_installer.bat"
if not exist "%SCRIPTS_DIR%\browsers.bat" set "missing_files=!missing_files! browsers.bat"
if not exist "%SCRIPTS_DIR%\productivity.bat" set "missing_files=!missing_files! productivity.bat"
if not exist "%SCRIPTS_DIR%\media.bat" set "missing_files=!missing_files! media.bat"
if not exist "%SCRIPTS_DIR%\utilities.bat" set "missing_files=!missing_files! utilities.bat"
if not exist "%SCRIPTS_DIR%\dev_tools.bat" set "missing_files=!missing_files! dev_tools.bat"
if not exist "%SCRIPTS_DIR%\database_server.bat" set "missing_files=!missing_files! database_server.bat"
if not exist "%SCRIPTS_DIR%\security_privacy.bat" set "missing_files=!missing_files! security_privacy.bat"

if not "!missing_files!"=="" (
    echo ERROR: The following script files are missing:!missing_files!
    echo.
    echo Please download these files from GitHub and place them in the 'scripts' folder.
    echo https://github.com/maybeizen/win-apps-installer
    pause
    exit /b 1
)

exit /b