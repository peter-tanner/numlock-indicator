# `numlock-indicator`

This powershell script adds a small indicator to the system tray to indicate when the numlock is enabled.

## Install

1. Run `install.ps1` in an **administrator** powershell terminal. This script will add a task scheduler task to start up the indicator on login. Admin privileges are required to add task scheduler tasks.

2. **\* ⚠Important: You'll need to manually use taskbar settings to pin the taskbar icon so it's always visible!**

## Old installation method

**\* ⚠Important: You'll need to manually use taskbar settings to pin the taskbar icon so it's always visible!**

Copy files to some directory and run `powershell systray.ps1`. You can also run `start.sh` to ensure that one copy of the script is always active.

I wrote this because for some reason, my laptop keyboard has no LED indicator for the numlock key (yet they have one for capslock and speakers???)

Feel free to replace `icon.png` with any bitmap icon if you don't like my terrible pixel art.
