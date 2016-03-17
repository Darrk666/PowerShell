$UserCredential = Get-Credential
Import-Module MsOnline
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
$Identity = Read-Host -Prompt 'User'
Import-PSSession $Session
Set-Mailbox -Identity $Identity -ForwardingSMTPAddress $Null