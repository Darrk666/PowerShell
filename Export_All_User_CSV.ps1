$Credential = Get-Credential
Import-Module MsOnline
Connect-MsolService -Credential $Credential
$Folder = Read-Host -Prompt 'Folder Location'
$FileName = Read-Host -Prompt 'File Name'
Get-MsolUser | Select-Object FirstName, LastName, UserPrincipalName, @{n="Licenses Type";e={$_.Licenses.AccountSKUid}}, IsLicensed | Export-Csv $Folder\$Filename.csv