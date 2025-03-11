# Windows Software Installer

A collection of batch scripts to easily install common Windows software.

## Overview

This project provides a simple menu-driven interface to install various categories of software on Windows systems. It leverages the Chocolatey package manager to handle the actual installation process.

## Features

- Easy-to-use menu interface
- Multiple software categories:
  - Development Tools
  - Productivity Software
  - Web Browsers
  - Media Players and Entertainment
  - Utilities and Tools
  - Security and Privacy Tools
  - Database and Server Software
- JDK version selection
- Batch installation of multiple applications

## Prerequisites

- Windows operating system (Fresh install preferred, but not required.)
- Administrator privileges
- Internet connection
- [Chocolatey](https://chocolatey.org/install) package manager (Will be installed automatically if not already installed)

## Usage

1. Clone the repository:

```bash
git clone https://github.com/maybeizen/win-apps-installer.git
```

2. Run the main script as administrator

```bash
WinAppsInstaller.bat
```

3. Navigate through the menus to select software to install
4. Follow on-screen prompts

## Structure

- `scripts/` - Contains all the installation scripts
  - `choco_installer.bat` - Core installation handler using Chocolatey
  - `dev_tools.bat` - Development tools installation
  - `productivity.bat` - Productivity software installation
  - `browsers.bat` - Web browsers installation
  - `media.bat` - Media and entertainment software installation
  - `utilities.bat` - Utility software installation
  - `security_privacy.bat` - Security and privacy tools installation
  - `database_server.bat` - Database and server software installation

## License

This project is licensed under the MIT License - see the [LICENSE](license) file for details.
