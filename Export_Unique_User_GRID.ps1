$Credential = Get-Credential
Import-Module MsOnline
Connect-MsolService -Credential $Credential
$Username = Read-Host -Prompt 'Username'
Get-MsolUser -UserPrincipalName $Username | Select-Object FirstName, LastName, UserPrincipalName, @{n="Licenses Type";e={$_.Licenses.AccountSKUid}}, IsLicensed | Out-GridView