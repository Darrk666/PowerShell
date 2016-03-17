$Credential = Get-Credential
Import-Module MsOnline
Connect-MsolService -Credential $Credential
Get-MsolUser | Select-Object FirstName, LastName, UserPrincipalName, @{n="Licenses Type";e={$_.Licenses.AccountSKUid}}, IsLicensed | Out-GridView