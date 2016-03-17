$Credential = Get-Credential
Import-Module MsOnline
Connect-MsolService -Credential $Credential
Grant-CsClientPolicy -PolicyName ClientPolicyDisableSkypeUI