@echo off
setlocal enabledelayedexpansion

if not "%~1"=="" (
    for %%i in (%*) do (
        call :install_%%i
    )
    exit /b
)

:security_privacy_menu
cls
echo  SECURITY AND PRIVACY TOOLS
echo.
echo  Select security and privacy tools to install:
echo.
echo  [1] Bitwarden (Password Manager)
echo  [2] KeePass (Password Manager)
echo  [3] VeraCrypt (Disk Encryption)
echo  [4] Cryptomator (File Encryption)
echo  [5] ProtonVPN
echo  [6] Signal Desktop
echo  [7] Wireshark (Network Analyzer)
echo  [8] OpenVPN
echo  [9] Install All Security/Privacy Tools
echo  [0] Back to Main Menu
echo.
choice /c 1234567890 /m "Enter your choice:"

if errorlevel 10 exit /b
if errorlevel 9 (
    call "%~dp0choco_installer.bat" bitwarden "Bitwarden"
    call "%~dp0choco_installer.bat" keepass "KeePass"
    call "%~dp0choco_installer.bat" veracrypt "VeraCrypt"
    call "%~dp0choco_installer.bat" cryptomator "Cryptomator"
    call "%~dp0choco_installer.bat" protonvpn "ProtonVPN"
    call "%~dp0choco_installer.bat" signal "Signal Desktop"
    call "%~dp0choco_installer.bat" wireshark "Wireshark"
    call "%~dp0choco_installer.bat" openvpn "OpenVPN"
    goto security_privacy_menu
)
if errorlevel 8 call "%~dp0choco_installer.bat" openvpn "OpenVPN" & goto security_privacy_menu
if errorlevel 7 call "%~dp0choco_installer.bat" wireshark "Wireshark" & goto security_privacy_menu
if errorlevel 6 call "%~dp0choco_installer.bat" signal "Signal Desktop" & goto security_privacy_menu
if errorlevel 5 call "%~dp0choco_installer.bat" protonvpn "ProtonVPN" & goto security_privacy_menu
if errorlevel 4 call "%~dp0choco_installer.bat" cryptomator "Cryptomator" & goto security_privacy_menu
if errorlevel 3 call "%~dp0choco_installer.bat" veracrypt "VeraCrypt" & goto security_privacy_menu
if errorlevel 2 call "%~dp0choco_installer.bat" keepass "KeePass" & goto security_privacy_menu
if errorlevel 1 call "%~dp0choco_installer.bat" bitwarden "Bitwarden" & goto security_privacy_menu 