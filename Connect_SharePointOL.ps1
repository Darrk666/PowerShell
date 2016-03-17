$UserCredential = Get-Credential
Import-Module MsOnline
Connect-MsolService -Credential $UserCredential
$Domain = Read-Host -Prompt 'Domain'
Import-Module Microsoft.Online.SharePoint.PowerShell -DisableNameChecking
Connect-SPOService -Url https://$Domain-admin.sharepoint.com -credential $UserCredential