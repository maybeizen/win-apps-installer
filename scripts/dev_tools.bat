@echo off
setlocal enabledelayedexpansion

if not "%~1"=="" (
    for %%i in (%*) do (
        call :install_%%i
    )
    exit /b
)

:dev_tools_menu
cls
echo  DEVELOPMENT TOOLS
echo.
echo  Select development tools to install:
echo.
echo  [1] Visual Studio Code
echo  [2] Git
echo  [3] Python
echo  [4] Node.js
echo  [5] Java Development Kit (JDK)
echo  [6] Visual Studio Community
echo  [7] Sublime Text
echo  [8] Atom
echo  [9] Cursor
echo  [A] GoLang
echo  [B] Docker Desktop
echo  [D] JDK Version Selection
echo  [E] Insomnia
echo  [F] Install All Development Tools
echo  [G] Back to Main Menu
echo.
choice /c 123456789ABCDEFG /m "Enter your choice:"

if errorlevel 15 exit /b
if errorlevel 14 (
    call "%~dp0choco_installer.bat" vscode "Visual Studio Code"
    call "%~dp0choco_installer.bat" git "Git"
    call "%~dp0choco_installer.bat" python "Python"
    call "%~dp0choco_installer.bat" nodejs-lts "Node.js LTS"
    call :jdk_selection
    call "%~dp0choco_installer.bat" visualstudio2022community "Visual Studio Community 2022"
    call "%~dp0choco_installer.bat" sublimetext3 "Sublime Text"
    call "%~dp0choco_installer.bat" atom "Atom"
    call "%~dp0choco_installer.bat" cursoride "Cursor"
    call "%~dp0choco_installer.bat" golang "GoLang"
    call "%~dp0choco_installer.bat" docker-desktop "Docker Desktop"
    call "%~dp0choco_installer.bat" insomnia-rest-api-client "Insomnia"
    goto dev_tools_menu
)
if errorlevel 13 call "%~dp0choco_installer.bat" insomnia-rest-api-client "Insomnia" & goto dev_tools_menu
if errorlevel 12 call :jdk_selection & goto dev_tools_menu
if errorlevel 11 call "%~dp0choco_installer.bat" docker-desktop "Docker Desktop" & goto dev_tools_menu
if errorlevel 10 call  "%~dp0choco_installer.bat" golang "GoLang" & goto dev_tools_menu
if errorlevel 9 call "%~dp0choco_installer.bat" cursoride "Cursor" & goto dev_tools_menu
if errorlevel 8 call "%~dp0choco_installer.bat" atom "Atom" & goto dev_tools_menu
if errorlevel 7 call "%~dp0choco_installer.bat" sublimetext3 "Sublime Text" & goto dev_tools_menu
if errorlevel 6 call "%~dp0choco_installer.bat" visualstudio2022community "Visual Studio Community 2022" & goto dev_tools_menu
if errorlevel 5 call "%~dp0choco_installer.bat" openjdk17 "OpenJDK 17" & goto dev_tools_menu
if errorlevel 4 call "%~dp0choco_installer.bat" nodejs-lts "Node.js LTS" & goto dev_tools_menu
if errorlevel 3 call "%~dp0choco_installer.bat" python "Python" & goto dev_tools_menu
if errorlevel 2 call "%~dp0choco_installer.bat" git "Git" & goto dev_tools_menu
if errorlevel 1 call "%~dp0choco_installer.bat" vscode "Visual Studio Code" & goto dev_tools_menu

:jdk_selection
cls
echo JAVA DEVELOPMENT KIT VERSIONS
echo.
echo  Select JDK version to install:
echo.
echo  [1] OpenJDK 8
echo  [2] OpenJDK 11
echo  [3] OpenJDK 17 (LTS)
echo  [4] OpenJDK 21 (LTS)
echo  [5] Oracle JDK 17
echo  [6] Oracle JDK 21
echo  [7] Back to Development Tools
echo.
choice /c 1234567 /m "Enter your choice:"

if errorlevel 7 goto dev_tools_menu
if errorlevel 6 call "%~dp0choco_installer.bat" oraclejdk21 "Oracle JDK 21" & goto jdk_selection
if errorlevel 5 call "%~dp0choco_installer.bat" oraclejdk17 "Oracle JDK 17" & goto jdk_selection
if errorlevel 4 call "%~dp0choco_installer.bat" openjdk21 "OpenJDK 21" & goto jdk_selection
if errorlevel 3 call "%~dp0choco_installer.bat" openjdk17 "OpenJDK 17" & goto jdk_selection
if errorlevel 2 call "%~dp0choco_installer.bat" openjdk11 "OpenJDK 11" & goto jdk_selection
if errorlevel 1 call "%~dp0choco_installer.bat" openjdk8 "OpenJDK 8" & goto jdk_selection 