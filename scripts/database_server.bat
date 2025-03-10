@echo off
setlocal enabledelayedexpansion

if not "%~1"=="" (
    for %%i in (%*) do (
        call :install_%%i
    )
    exit /b
)

:database_server_menu
cls
echo  DATABASE AND SERVER SOFTWARE
echo.
echo  Select database and server software to install:
echo.
echo  [1] MySQL
echo  [2] MariaDB
echo  [3] PostgreSQL
echo  [4] MongoDB
echo  [5] Redis
echo  [6] NGINX
echo  [7] Apache HTTP Server
echo  [8] XAMPP
echo  [9] Install All Database/Server Software
echo  [0] Back to Main Menu
echo.
choice /c 1234567890 /m "Enter your choice:"

if errorlevel 10 exit /b
if errorlevel 9 (
    call "%~dp0choco_installer.bat" mysql "MySQL"
    call "%~dp0choco_installer.bat" mariadb "MariaDB"
    call "%~dp0choco_installer.bat" postgresql "PostgreSQL"
    call "%~dp0choco_installer.bat" mongodb "MongoDB"
    call "%~dp0choco_installer.bat" redis-64 "Redis"
    call "%~dp0choco_installer.bat" nginx "NGINX"
    call "%~dp0choco_installer.bat" apache-httpd "Apache HTTP Server"
    call "%~dp0choco_installer.bat" xampp "XAMPP"
    goto database_server_menu
)
if errorlevel 8 call "%~dp0choco_installer.bat" xampp "XAMPP" & goto database_server_menu
if errorlevel 7 call "%~dp0choco_installer.bat" apache-httpd "Apache HTTP Server" & goto database_server_menu
if errorlevel 6 call "%~dp0choco_installer.bat" nginx "NGINX" & goto database_server_menu
if errorlevel 5 call "%~dp0choco_installer.bat" redis-64 "Redis" & goto database_server_menu
if errorlevel 4 call "%~dp0choco_installer.bat" mongodb "MongoDB" & goto database_server_menu
if errorlevel 3 call "%~dp0choco_installer.bat" postgresql "PostgreSQL" & goto database_server_menu
if errorlevel 2 call "%~dp0choco_installer.bat" mariadb "MariaDB" & goto database_server_menu
if errorlevel 1 call "%~dp0choco_installer.bat" mysql "MySQL" & goto database_server_menu 