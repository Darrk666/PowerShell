$UserCredential = Get-Credential
Import-Module MsOnline
Connect-MsolService -Credential $UserCredential
$Modules = @(
    [pscustomobject]@{Name="SharePoint Online"; Description="Start SharePoint Online"},
    [pscustomobject]@{Name="Lync / SFB"; Description="Start Lync / SFB"},
    [pscustomobject]@{Name="Exchange Online"; Description="Start Exchange Online"}
    [pscustomobject]@{Name="Compliance Center"; Description="Start Compliance Center"}
)
$Modules | Out-GridView -Title "Which module would you like to run?" -PassThru | ForEach-Object {
    switch ($_.Name)
    {
        'SharePoint Online' {
            $Domain = Read-Host -Prompt 'Domain'
            Import-Module Microsoft.Online.SharePoint.PowerShell -DisableNameChecking
            Connect-SPOService -Url https://$Domain-admin.sharepoint.com -credential $UserCredential
        }
        'Lync / SFB' {
            Import-Module LyncOnlineConnector
            $SFBOSession = New-CsOnlineSession -Credential $UserCredential
            Import-PSSession $SFBOSession
        }
        'Exchange Online' {
            $ExchangeSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri "https://outlook.office365.com/powershell-liveid/" -Credential $UserCredential -Authentication Basic -AllowRedirection
            Import-PSSession $ExchangeSession -DisableNameChecking
        }
        'Compliance Center' {
            $CCSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.compliance.protection.outlook.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
            Import-PSSession $CCSession -Prefix cc
        }
    }
}