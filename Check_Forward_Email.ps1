$UserCredential = Get-Credential
Import-Module MsOnline
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
$Identity = Read-Host -Prompt 'User'
Import-PSSession $Session
Get-Mailbox -Identity $Identity | FL ForwardingSMTPAddress
Write-Host -NoNewLine 'Press any key to continue...';
$x = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');