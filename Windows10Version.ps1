# Check WIndows 10 Version (used for invokation)
$winver = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" -Name ProductName).ProductName
if ($winver -like "Windows 10*") 
{Write-Host -ForegroundColor Green Windows 10}
else
{Write-Host -ForegroundColor Red Not Windows 10}

#----------------------------------------------------------------------------------------------------------------