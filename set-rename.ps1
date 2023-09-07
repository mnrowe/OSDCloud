$Global:Transcript = "$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-set-rename.log"
Start-Transcript -Path (Join-Path "$env:ProgramData\Microsoft\IntuneManagementExtension\Logs\OSD\" $Global:Transcript) -ErrorAction Ignore

Write-Host "Rename Computer" -ForegroundColor Green

Set-ExecutionPolicy -ExecutionPolicy Bypass -Force
Rename-Computer -DomainCredential $host.ui.PromptForCredential("Need credentials", "Please enter your user name and password.")

Stop-Transcript