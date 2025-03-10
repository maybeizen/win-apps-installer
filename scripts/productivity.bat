@echo off
setlocal enabledelayedexpansion

if not "%~1"=="" (
    for %%i in (%*) do (
        call :install_%%i
    )
    exit /b
)

:productivity_menu
cls
echo  PRODUCTIVITY SOFTWARE
echo.
echo  Select productivity software to install:
echo.
echo  [1] Microsoft Office (Office 365 setup)
echo  [2] LibreOffice
echo  [3] Adobe Reader
echo  [4] Foxit PDF Reader
echo  [5] Notepad++
echo  [6] 7-Zip
echo  [7] WinRAR
echo  [8] ShareX (Screen Capture)
echo  [9] Notion
echo  [A] Obsidian
echo  [B] Install All Productivity Apps
echo  [C] Back to Main Menu
echo.
choice /c 123456789ABC /m "Enter your choice:"

if errorlevel 12 exit /b
if errorlevel 11 (
    call :install_office365
    call "%~dp0choco_installer.bat" libreoffice-fresh "LibreOffice"
    call "%~dp0choco_installer.bat" adobereader "Adobe Reader"
    call "%~dp0choco_installer.bat" foxitreader "Foxit PDF Reader"
    call "%~dp0choco_installer.bat" notepadplusplus "Notepad++"
    call "%~dp0choco_installer.bat" 7zip "7-Zip"
    call "%~dp0choco_installer.bat" winrar "WinRAR"
    call "%~dp0choco_installer.bat" sharex "ShareX"
    call "%~dp0choco_installer.bat" notion "Notion"
    call "%~dp0choco_installer.bat" obsidian "Obsidian"
    goto productivity_menu
)
if errorlevel 10 call "%~dp0choco_installer.bat" obsidian "Obsidian" & goto productivity_menu
if errorlevel 9 call "%~dp0choco_installer.bat" notion "Notion" & goto productivity_menu
if errorlevel 8 call "%~dp0choco_installer.bat" sharex "ShareX" & goto productivity_menu
if errorlevel 7 call "%~dp0choco_installer.bat" winrar "WinRAR" & goto productivity_menu
if errorlevel 6 call "%~dp0choco_installer.bat" 7zip "7-Zip" & goto productivity_menu
if errorlevel 5 call "%~dp0choco_installer.bat" notepadplusplus "Notepad++" & goto productivity_menu
if errorlevel 4 call "%~dp0choco_installer.bat" foxitreader "Foxit PDF Reader" & goto productivity_menu
if errorlevel 3 call "%~dp0choco_installer.bat" adobereader "Adobe Reader" & goto productivity_menu
if errorlevel 2 call "%~dp0choco_installer.bat" libreoffice-fresh "LibreOffice" & goto productivity_menu
if errorlevel 1 call :install_office365 & goto productivity_menu

:install_office365
echo This will open the Microsoft Office 365 setup page in your browser.
echo You will need to sign in with your Microsoft account to download and install Office.
choice /c YN /m "Do you want to continue? (Y/N)"
if errorlevel 2 exit /b
if errorlevel 1 (
    start https://www.office.com/
    echo Microsoft Office 365 setup page opened in your browser.
    timeout /t 2 >nul
)
exit /b