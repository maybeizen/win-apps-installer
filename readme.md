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
cd win-apps-installer
WinAppsInstaller.bat
```

OR

Right-click on the `WinAppsInstaller.bat` file and select "Run as administrator"

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

## Available Applications

### Web Browsers

- Google Chrome
- Mozilla Firefox
- Microsoft Edge
- Brave Browser
- Opera
- Vivaldi
- Tor Browser
- LibreWolf

### Productivity Software

- Microsoft Office (Office 365 setup)
- LibreOffice
- Adobe Reader
- Foxit PDF Reader
- Notepad++
- 7-Zip
- WinRAR
- ShareX (Screen Capture)
- Notion
- Obsidian

### Media Players and Entertainment

- VLC Media Player
- Spotify
- iTunes
- GIMP (Image Editor)
- Audacity (Audio Editor)
- OBS Studio (Screen Recording)
- Blender (3D Creation)
- Krita (Digital Painting)
- HandBrake (Video Transcoder)

### Utilities and Tools

- CCleaner
- Malwarebytes
- TeamViewer
- qBittorrent
- WinDirStat (Disk Usage Analyzer)
- CPU-Z
- GPU-Z
- Everything (File Search)
- Rufus (USB Formatter)
- HWiNFO (Hardware Info)

### Development Tools

- Visual Studio Code
- Git
- Python
- Node.js
- Java Development Kit (JDK)
  - OpenJDK 8
  - OpenJDK 11
  - OpenJDK 17 (LTS)
  - OpenJDK 21 (LTS)
  - Oracle JDK 17
  - Oracle JDK 21
- Visual Studio Community
- Sublime Text
- Atom
- Cursor IDE (AI-based fork of Visual Studio Code)
- GoLang
- Docker Desktop
- Insomnia

### Security and Privacy Tools

- Bitwarden (Password Manager)
- KeePass (Password Manager)
- VeraCrypt (Disk Encryption)
- Cryptomator (File Encryption)
- ProtonVPN
- Signal Desktop
- Wireshark (Network Analyzer)
- OpenVPN

### Database and Server Software

- MySQL
- MariaDB
- PostgreSQL
- MongoDB
- Redis
- NGINX
- Apache HTTP Server
- XAMPP

## License

This project is licensed under the MIT License - see the [LICENSE](license) file for details.
