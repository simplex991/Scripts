# Preferance variables
$ErrorActionPreference = 'silentlycontinue'

# Remove TEMP file content
Write-Host 'Temp folder cleaned' -ForegroundColor green
Remove-Item -Path $env:TEMP -Recurse -Force -ErrorAction $ErrorActionPreference

# Empty Recycle bin


# Run Disk Cleanup
Write-Warning 'IF YOU RUN DISK CLEANUP IT WILL RESTART YOUR COMPUTER WHEN FINISHED'
Do{$disk_cleanup_question = Read-Host "Would you like to run disk cleanup? | Yes[Y] No[N]"}
Until(($disk_cleanup_question -eq 'y') -or ($disk_cleanup_question -eq 'n'))
if($disk_cleanup_question -eq 'y'){
    Do{$confirm_disk_cleanup = Read-Host "Are you sure? Your computer will restart when cleanup is done | Yes[Y] No[N]"}
    Until(($confirm_disk_cleanup -eq 'y') -or ($confirm_disk_cleanup -eq 'n'))
    if($confirm_disk_cleanup -eq 'y'){
        Write-Host 'Clearing CleanMgr.exe automation settings.'
        Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\*' -Name StateFlags0001 -ErrorAction $ErrorActionPreference | Remove-ItemProperty -Name StateFlags0001 -ErrorAction $ErrorActionPreference

        Write-Host 'Enabling Update Cleanup. This is done automatically in Windows 10 via a scheduled task.'
        New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\sExplorer\VolumeCaches\Update Cleanup' -Name StateFlags0001 -Value 2 -PropertyType DWord

        Write-Host 'Enabling Temporary Files Cleanup.'
        New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Temporary Files' -Name StateFlags0001 -Value 2 -PropertyType DWord

        Write-Host 'Starting CleanMgr.exe...'
        Start-Process -FilePath CleanMgr.exe -ArgumentList '/sagerun:1' -WindowStyle Hidden -Wait

        Write-Host 'Waiting for CleanMgr and DismHost processes. Second wait neccesary as CleanMgr.exe spins off separate processes.'
        Get-Process -Name cleanmgr,dismhost -ErrorAction $ErrorActionPreference | Wait-Process

        $UpdateCleanupSuccessful = $false
        if (Test-Path $env:SystemRoot\Logs\CBS\DeepClean.log) {
            $UpdateCleanupSuccessful = Select-String -Path $env:SystemRoot\Logs\CBS\DeepClean.log -Pattern 'Total size of superseded packages:' -Quiet
        }

        if ($UpdateCleanupSuccessful){
            Write-Host 'Rebooting to complete CleanMgr.exe Update Cleanup....'
            SHUTDOWN.EXE /r /f /t 0 /c 'Rebooting to complete CleanMgr.exe Update Cleanup....'
        }
    }elseif($confirm_disk_cleanup -eq 'n'){
        Continue
    }
}elseif($disk_cleanup_question -eq 'n'){
    Continue
}

# Reboot computer
Restart-Computer



