[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms') | Out-Null
$ICON_ON  = [System.Drawing.Icon]::FromHandle(([System.Drawing.Bitmap]::FromFile($(Join-Path $PSScriptRoot '\icon_on.png'))).GetHicon()) # Convert my png (bitmap) to an icon
$ICON_OFF = [System.Drawing.Icon]::FromHandle(([System.Drawing.Bitmap]::FromFile($(Join-Path $PSScriptRoot '\icon_off.png'))).GetHicon())
# $ICON_ON = [System.Drawing.Icon]::ExtractAssociatedIcon() # Feel free to use a system icon
# $ICON_OFF = [System.Drawing.Icon]::ExtractAssociatedIcon()
 
function NewTrayIcon(){
    $TrayIcon = New-Object System.Windows.Forms.NotifyIcon
    $TrayIcon.Text = "NumLock on"
    $TrayIcon.Icon = If ([console]::numberlock) {$ICON_ON} Else {$ICON_OFF}
    $TrayIcon.Visible = $true

    $TrayIcon.Add_Click({ # In case our script stops working, allow user to kill icon so that their system tray isn't cluttered
        $TrayIcon.Visible = $false
        $TrayIcon.Dispose()
        Stop-Process $pid
    })

    return $TrayIcon
}
While ($true) {
    While ($TrayIcon.Text) {
        $TrayIcon.Icon = If ([console]::numberlock) {$ICON_ON} Else {$ICON_OFF}
        Start-Sleep -Seconds 1 # Set this to whatever polling rate you want.
    }
    $TrayIcon = NewTrayIcon
}