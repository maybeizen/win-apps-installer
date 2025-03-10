@echo off
setlocal enabledelayedexpansion

if not "%~1"=="" (
    for %%i in (%*) do (
        call :install_%%i
    )
    exit /b
)

:media_menu
cls
echo  MEDIA PLAYERS AND ENTERTAINMENT
echo.
echo  Select media applications to install:
echo.
echo  [1] VLC Media Player
echo  [2] Spotify
echo  [3] iTunes
echo  [4] GIMP (Image Editor)
echo  [5] Audacity (Audio Editor)
echo  [6] OBS Studio (Screen Recording)
echo  [7] Blender (3D Creation)
echo  [8] Krita (Digital Painting)
echo  [9] HandBrake (Video Transcoder)
echo  [A] Install All Media Apps
echo  [B] Back to Main Menu
echo.
choice /c 123456789AB /m "Enter your choice:"

if errorlevel 11 exit /b
if errorlevel 10 (
    call "%~dp0choco_installer.bat" vlc "VLC Media Player"
    call "%~dp0choco_installer.bat" spotify "Spotify"
    call "%~dp0choco_installer.bat" itunes "iTunes"
    call "%~dp0choco_installer.bat" gimp "GIMP Image Editor"
    call "%~dp0choco_installer.bat" audacity "Audacity Audio Editor"
    call "%~dp0choco_installer.bat" obs-studio "OBS Studio"
    call "%~dp0choco_installer.bat" blender "Blender"
    call "%~dp0choco_installer.bat" krita "Krita"
    call "%~dp0choco_installer.bat" handbrake "HandBrake"
    goto media_menu
)
if errorlevel 9 call "%~dp0choco_installer.bat" handbrake "HandBrake" & goto media_menu
if errorlevel 8 call "%~dp0choco_installer.bat" krita "Krita" & goto media_menu
if errorlevel 7 call "%~dp0choco_installer.bat" blender "Blender" & goto media_menu
if errorlevel 6 call "%~dp0choco_installer.bat" obs-studio "OBS Studio" & goto media_menu
if errorlevel 5 call "%~dp0choco_installer.bat" audacity "Audacity Audio Editor" & goto media_menu
if errorlevel 4 call "%~dp0choco_installer.bat" gimp "GIMP Image Editor" & goto media_menu
if errorlevel 3 call "%~dp0choco_installer.bat" itunes "iTunes" & goto media_menu
if errorlevel 2 call "%~dp0choco_installer.bat" spotify "Spotify" & goto media_menu
if errorlevel 1 call "%~dp0choco_installer.bat" vlc "VLC Media Player" & goto media_menu