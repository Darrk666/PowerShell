$UserCredential = Get-Credential
Import-Module MsOnline
Connect-MsolService -Credential $UserCredential
Import-Module LyncOnlineConnector
$SFBOSession = New-CsOnlineSession -Credential $UserCredential
Import-PSSession $SFBOSession