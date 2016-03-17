$Credential = Get-Credential
Import-Module MsOnline
Connect-MsolService -Credential $Credential
$Username = Read-Host -Prompt 'Username'
$Password = Read-Host -Prompt 'Password'
Set-MsolUserPassword -UserPrincipalName $Username -NewPassword $Password -ForceChangePassword $true