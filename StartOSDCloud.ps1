Write-Host -ForegroundColor Blue "Starting OSDDCloud ZTI"
Start-Sleep -Seconds 5

Start-OSDCloud -OSVersion 'Windows 11' -OSBuild 22H2 -OSEdition Pro -OSLicense Retail

Start-Sleep -Seconds 5

$OOBEDeployJson = @'
{
    "UpdateDrivers":  {
                          "IsPresent":  true
                      },
    "UpdateWindows":  {
                          "IsPresent":  true
                      }
}
'@

If (!(Test-Path "C:\ProgramData\OSDeploy")) {
    New-Item "C:\ProgramData\OSDeploy" -ItemType Directory -Force | Out-Null
}
$OOBEDeployJson | Out-File -FilePath "C:\ProgramData\OSDeploy\OSDeploy.OOBEDeploy.json" -Encoding ascii -Force

Start-Sleep -Seconds 5

$AssignedComputerName = Read-Host "Computer name:" 


$AutopilotOOBEJson = @"
    {
        "Assign":  {
                        "IsPresent":  true
                    },
        "GroupTag":  "$AssignedComputerName",
        "AddToGroup": "autopilot",
        "Hidden":  [
                        "AssignedComputerName",
                        "AssignedUser",
                        "PostAction",
                        "Assign"
                    ],
        "PostAction":  "Quit",
        "Run":  "NetworkingWireless",
        "Title":  "Manual Autopilot Register"
    }
"@


 if (!(Test-Path "C:\ProgramData\OSDeploy")) {
	New-Item "C:\ProgramData\OSDeploy" -ItemType Directory -Force | Out-Null
 }
$AutopilotOOBEJson | Out-File -FilePath "C:\ProgramData\OSDeploy\OSDeploy.AutopilotOOBE.json" -Encoding ascii -Force 