$Credential = Get-Credential
Import-Module MsOnline
Connect-MsolService -Credential $Credential
$Username = Read-Host -Prompt 'Enable Skype UI for User'
Grant-CsClientPolicy -PolicyName ClientPolicyEnableSkypeUI -Identity $Username