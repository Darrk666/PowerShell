$Credential = Get-Credential
Import-Module MsOnline
Connect-MsolService -Credential $Credential
$Username = Read-Host -Prompt 'Username'
Set-MsolUser -UserPrincipalName $Username -PasswordNeverExpires $true