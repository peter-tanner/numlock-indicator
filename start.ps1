# Ensures one copy of the program is always active. Not necessary for operation.
while (1) {
    powershell $(Join-Path $PSScriptRoot 'systray.ps1')
}