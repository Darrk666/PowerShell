$UserCredential = Get-Credential
$Domain = Read-Host -Prompt 'Domain'
Import-Module MsOnline
Connect-MsolService -Credential $UserCredential
Import-Module Microsoft.Online.SharePoint.PowerShell -DisableNameChecking
Connect-SPOService -Url https://$Domain-admin.sharepoint.com -credential $UserCredential
Import-Module LyncOnlineConnector
$SFBOSession = New-CsOnlineSession -Credential $UserCredential
Import-PSSession $SFBOSession
$ExchangeSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri "https://outlook.office365.com/powershell-liveid/" -Credential $UserCredential -Authentication Basic -AllowRedirection
Import-PSSession $ExchangeSession -DisableNameChecking
$CCSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.compliance.protection.outlook.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
Import-PSSession $CCSession -Prefix cc