$Credential = Get-Credential
Import-Module MsOnline
Connect-MsolService -Credential $Credential
$Folder = Read-Host -Prompt 'Folder Location'
$FileName = Read-Host -Prompt 'File Name'
$Username = Read-Host -Prompt 'Username'
Get-MsolUser -UserPrincipalName $Username | Select-Object FirstName, LastName, UserPrincipalName, @{n="Licenses Type";e={$_.Licenses.AccountSKUid}}, IsLicensed | Export-Csv $Folder\$Filename.csv