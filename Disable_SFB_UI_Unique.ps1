$Credential = Get-Credential
Import-Module MsOnline
Connect-MsolService -Credential $Credential
$Username = Read-Host -Prompt 'Disable Skype UI for User'
Grant-CsClientPolicy -PolicyName ClientPolicyDisableSkypeUI -Identity $Username