$Credential = Get-Credential
Import-Module MsOnline
Connect-MsolService -Credential $Credential
Get-MsolAccountSku | FL AccountSkuId
$LicenseR = Read-Host -Prompt 'License to Remove'
$LicenseA = Read-Host -Prompt 'License to Add'
$LicenseSwitch = $Username = Get-MsolUser -All | Where-Object { ($_.Licenses | Where-Object { $_.AccountSkuId -eq $LicenseR}).Length -gt 0}
ForEach ($LicenseSwitch in $LicenseSwitch){
Set-MsolUserLicense -UserPrincipalName $Username -RemoveLicenses $LicenseR -AddLicenses $LicenseA
}