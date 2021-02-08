[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms') | Out-Null
$ICON = [System.Drawing.Icon]::FromHandle(([System.Drawing.Bitmap]::FromFile($(Join-Path $pwd '\icon.png'))).GetHicon()) # Convert my png (bitmap) to an icon
# $ICON = [System.Drawing.Icon]::ExtractAssociatedIcon() # Feel free to use a system icon
 
function NewTrayIcon(){
    $TrayIcon = New-Object System.Windows.Forms.NotifyIcon
    $TrayIcon.Text = "NumLock on"
    $TrayIcon.Icon = $ICON

    $TrayIcon.Add_Click({ # In case our script stops working, allow user to kill icon so that their system tray isn't cluttered
        $TrayIcon.Visible = $false
        $TrayIcon.Dispose()
        Stop-Process $pid
    })

    return $TrayIcon
}
While ($true) {
    While ($TrayIcon.Text) {
        If ([console]::numberlock) {
            If (!$TrayIcon.Visible) {
                $TrayIcon.Visible = $true
            }
        } ElseIf ($TrayIcon.Visible) {
            $TrayIcon.Visible = $false
        }
        Start-Sleep -Seconds 1 # Set this to whatever polling rate you want.
    }
    $TrayIcon = NewTrayIcon
}