$Global:Transcript = "$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Set-Timezone.log"
Start-Transcript -Path (Join-Path "$env:ProgramData\Microsoft\IntuneManagementExtension\Logs\OSD\" $Global:Transcript) -ErrorAction Ignore

Write-Host "Setting Timezone" -ForegroundColor Green

Set-ExecutionPolicy -ExecutionPolicy Bypass -Force
Set-Timezone -Name 'Eastern Standard Time'

Stop-Transcript