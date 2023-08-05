$TaskName = "numlock-indicator"
$ScriptPath = Join-Path $PSScriptRoot "start.ps1"
$Action = New-ScheduledTaskAction -Execute 'C:\Windows\System32\WindowsPowerShell\v1.0\PowerShell.exe' -Argument "-WindowStyle Hidden -File `"$ScriptPath`""
$Trigger = New-ScheduledTaskTrigger -AtLogon
$Settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries

if (!$(Get-ScheduledTask -TaskName $TaskName -ErrorAction SilentlyContinue)) {
        Register-ScheduledTask -TaskName $TaskName -Action $Action -Trigger $Trigger -Settings $Settings -User $env:USERNAME
    if (Get-ScheduledTask -TaskName $TaskName -ErrorAction SilentlyContinue) {
        Start-ScheduledTask -TaskName $TaskName
        Write-Output "Task '$TaskName' created successfully."
    } else {
        Write-Output "Failed task creation. Run this script in admin mode."
    }
} else {
    Write-Output "Task '$TaskName' already exists."
}
