$Credential = Get-Credential
Import-Module MsOnline
Connect-MsolService -Credential $Credential
$LicenseList = Get-MsolAccountSku
Write-Host 'Licenses:'
ForEach ($LicenseList in $LicenseList){
Write-Host $LicenseList.AccountSkuId
}
Write-Host ' '
$FirstName = Read-Host -Prompt 'First Name'
$Surname = Read-Host -Prompt 'Surname'
$Displayname = Read-Host -Prompt 'Display Name'
$UserPrincipalName = Read-Host -Prompt 'Login Email'
$Location = Read-Host -Prompt 'Location'
$Password = Read-Host -Prompt 'Password'
$License = Read-Host -Prompt 'License'
New-MsolUser -FirstName $FirstName -LastName $Surname -DisplayName $Displayname -UserPrincipalName $UserPrincipalName -UsageLocation $Location -Password $Password -ForceChangePassword $true -LicenseAssignment $License