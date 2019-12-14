# Windows 10 Exploit Guard and Protection Settings

## Get Current Settings

### Attack Surface Reducation Rules
Get-MpPreference | fl AttackSurfaceReductionRules_Ids, AttackSurfaceReductionRules_Actions, AttackSurfaceReductionOnlyExclusions

### Network Protection Current Settings
Get-MpPreference | fl EnableNetworkProtection 

### Windows Firewall Status
Get-NetFirewallProfile -All
Get-NetIPInterface

### ProcessMitigation Current Settings
Get-ProcessMitigation -FullPolicy

### Controlled Folder Access Settings
Get-MpPreference | fl EnableControlledFolderAccess

#-------------------------------------------------------------------------------------------------------------------------

# Enable Windows 10 Protection

### Enable Network Protection
Set-MpPreference -EnableNetworkProtection 1

## Enable All Attack Surface Reducation 

### Enable all Attack Surface Reducation rules in audit mode
Write-Host "Enabling Attack Surface Reducation rules and setting to audit mode"

### Block Office applications from injecting into other processes
Add-MpPreference -AttackSurfaceReductionRules_Ids 75668C1F-73B5-4CF0-BB93-3ECF5CB7CC84 -AttackSurfaceReductionRules_Actions Enabled

#Block Office applications from creating executable content
Add-MpPreference -AttackSurfaceReductionRules_Ids 3B576869-A4EC-4529-8536-B80A7769E899 -AttackSurfaceReductionRules_Actions Enabled

#Block Office applications from creating child processes
Add-MpPreference -AttackSurfaceReductionRules_Ids D4F940AB-401B-4EfC-AADC-AD5F3C50688A -AttackSurfaceReductionRules_Actions Enabled

#Impede JavaScript and VBScript to launch executables
Add-MpPreference -AttackSurfaceReductionRules_Ids D3E037E1-3EB8-44C8-A917-57927947596D -AttackSurfaceReductionRules_Actions Enabled

#Block execution of potentially obfuscated script
Add-MpPreference -AttackSurfaceReductionRules_Ids 5BEB7EFE-FD9A-4556-801D-275E5FFC04CC -AttackSurfaceReductionRules_Actions Enabled

#Block executable content from email client and webmail
Add-MpPreference -AttackSurfaceReductionRules_Ids BE9BA2D9-53EA-4CDC-84E5-9B1EEEE46550 -AttackSurfaceReductionRules_Actions Enabled

#Block Win32 imports from Macro code in Office
Add-MpPreference -AttackSurfaceReductionRules_Ids 92E97FA1-2EDF-4476-BDD6-9DD0B4DDDC7B -AttackSurfaceReductionRules_Actions Enabled