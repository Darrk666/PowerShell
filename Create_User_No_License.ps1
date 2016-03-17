$Credential = Get-Credential
Import-Module MsOnline
Connect-MsolService -Credential $Credential
$FirstName = Read-Host -Prompt 'First Name'
$Surname = Read-Host -Prompt 'Surname'
$Displayname = Read-Host -Prompt 'Display Name'
$UserPrincipalName = Read-Host -Prompt 'Login Email'
$Location = Read-Host -Prompt 'Location'
$Password = Read-Host -Prompt 'Password'
New-MsolUser -FirstName $FirstName -LastName $Surname -DisplayName $Displayname -UserPrincipalName $UserPrincipalName -UsageLocation $Location -Password $Password -ForceChangePassword $true