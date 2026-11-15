@echo off
setlocal
cd /d "%~dp0"
start "FreeESPA" powershell.exe -NoLogo -NoProfile -NoExit -ExecutionPolicy Bypass -File "%~dp0FreeESPA.ps1"
