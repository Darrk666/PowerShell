$Credential = Get-Credential
Import-Module MsOnline
Connect-MsolService -Credential $Credential
Get-MsolAccountSku | FL AccountSkuId
$Username = Read-Host -Prompt 'Username'
$LicenseR = Read-Host -Prompt 'License to Remove'
$LicenseA = Read-Host -Prompt 'License to Add'
Set-MsolUserLicense -UserPrincipalName $Username -RemoveLicenses $LicenseR -AddLicenses $LicenseA