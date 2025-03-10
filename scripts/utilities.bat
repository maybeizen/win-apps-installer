@echo off
setlocal enabledelayedexpansion

if not "%~1"=="" (
    for %%i in (%*) do (
        call :install_%%i
    )
    exit /b
)

:utilities_menu
cls
echo  UTILITIES AND TOOLS
echo.
echo  Select utilities to install:
echo.
echo  [1] CCleaner
echo  [2] Malwarebytes
echo  [3] TeamViewer
echo  [4] qBittorrent
echo  [5] WinDirStat (Disk Usage Analyzer)
echo  [6] CPU-Z
echo  [7] GPU-Z
echo  [8] Everything (File Search)
echo  [9] Rufus (USB Formatter)
echo  [A] HWiNFO (Hardware Info)
echo  [B] Install All Utilities
echo  [C] Back to Main Menu
echo.
choice /c 123456789ABC /m "Enter your choice:"

if errorlevel 12 exit /b
if errorlevel 11 (
    call "%~dp0choco_installer.bat" ccleaner "CCleaner"
    call "%~dp0choco_installer.bat" malwarebytes "Malwarebytes"
    call "%~dp0choco_installer.bat" teamviewer "TeamViewer"
    call "%~dp0choco_installer.bat" qbittorrent "qBittorrent"
    call "%~dp0choco_installer.bat" windirstat "WinDirStat"
    call "%~dp0choco_installer.bat" cpu-z "CPU-Z"
    call "%~dp0choco_installer.bat" gpu-z "GPU-Z"
    call "%~dp0choco_installer.bat" everything "Everything Search"
    call "%~dp0choco_installer.bat" rufus "Rufus"
    call "%~dp0choco_installer.bat" hwinfo "HWiNFO"
    goto utilities_menu
)
if errorlevel 10 call "%~dp0choco_installer.bat" hwinfo "HWiNFO" & goto utilities_menu
if errorlevel 9 call "%~dp0choco_installer.bat" rufus "Rufus" & goto utilities_menu
if errorlevel 8 call "%~dp0choco_installer.bat" everything "Everything Search" & goto utilities_menu
if errorlevel 7 call "%~dp0choco_installer.bat" gpu-z "GPU-Z" & goto utilities_menu
if errorlevel 6 call "%~dp0choco_installer.bat" cpu-z "CPU-Z" & goto utilities_menu
if errorlevel 5 call "%~dp0choco_installer.bat" windirstat "WinDirStat" & goto utilities_menu
if errorlevel 4 call "%~dp0choco_installer.bat" qbittorrent "qBittorrent" & goto utilities_menu
if errorlevel 3 call "%~dp0choco_installer.bat" teamviewer "TeamViewer" & goto utilities_menu
if errorlevel 2 call "%~dp0choco_installer.bat" malwarebytes "Malwarebytes" & goto utilities_menu
if errorlevel 1 call "%~dp0choco_installer.bat" ccleaner "CCleaner" & goto utilities_menu