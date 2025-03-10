@echo off
setlocal enabledelayedexpansion

set "PACKAGE_NAME=%~1"
set "DISPLAY_NAME=%~2"
set "SPECIAL_ARGS=%~3"

if "%PACKAGE_NAME%"=="" (
    echo Error: No package name specified.
    exit /b 1
)

if "%DISPLAY_NAME%"=="" (
    set "DISPLAY_NAME=%PACKAGE_NAME%"
)

echo Installing %DISPLAY_NAME%...

if not "%SPECIAL_ARGS%"=="" (
    choco install %PACKAGE_NAME% %SPECIAL_ARGS% -y
) else (
    choco install %PACKAGE_NAME% -y
)

if %errorlevel% equ 0 (
    echo %DISPLAY_NAME% installed successfully.
) else (
    echo Failed to install %DISPLAY_NAME%. Error code: %errorlevel%
)

timeout /t 2 >nul
exit /b 0 