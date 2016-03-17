$Credential = Get-Credential
Import-Module MsOnline
Connect-MsolService -Credential $Credential
Get-MsolAccountSku | FL AccountSkuId
$UsernameR = Read-Host -Prompt 'Remove License from User'
$UsernameA = Read-Host -Prompt 'Add License from User'
$License = Read-Host -Prompt 'License to Swap'
Set-MsolUserLicense -UserPrincipalName $UsernameR -RemoveLicenses $License
Set-MsolUserLicense -UserPrincipalName $UsernameA -AddLicenses $License