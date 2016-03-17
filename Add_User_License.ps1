$Credential = Get-Credential
Import-Module MsOnline
Connect-MsolService -Credential $Credential
Get-MsolAccountSku | FL AccountSkuId
$Username = Read-Host -Prompt 'Username'
$License = Read-Host -Prompt 'License'
Set-MsolUserLicense -UserPrincipalName $Username -AddLicenses $License