$UserCredential = Get-Credential
Import-Module MsOnline
Connect-MsolService -Credential $UserCredential
$Title = "Office 365 Modules"
$Message = "Which Office 365 Modules Would You Like To Open?"
$All = New-Object System.Management.Automation.Host.ChoiceDescription "&All", `
    "Opening All Modules"
$EXOL = New-Object System.Management.Automation.Host.ChoiceDescription "&Exchange", `
    "Opening Exchange Online"
$EXCC = New-Object System.Management.Automation.Host.ChoiceDescription "&Compliance Center", `
    "Opening Compliance Center"
$SPOL = New-Object System.Management.Automation.Host.ChoiceDescription "&SharePoint", `
    "Opening SharePoint"
$SFBOL = New-Object System.Management.Automation.Host.ChoiceDescription "&Lync/SFB", `
    "Opening Lync/SFB"
$None = New-Object System.Management.Automation.Host.ChoiceDescription "&None", `
    "Opening Lync/SFB"
$Options = [System.Management.Automation.Host.ChoiceDescription[]]($All, $EXOL, $EXCC, $SPOL, $SFBOL, $None)
$Result = $host.ui.PromptForChoice($Title, $Message, $Options, 0) 
switch ($Result)
    {
        0 {$Domain = Read-Host -Prompt 'Domain'
            Import-Module Microsoft.Online.SharePoint.PowerShell -DisableNameChecking
            Connect-SPOService -Url https://$Domain-admin.sharepoint.com -credential $UserCredential
            Import-Module LyncOnlineConnector
            $SFBOSession = New-CsOnlineSession -Credential $UserCredential
            Import-PSSession $SFBOSession
            $ExchangeSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri "https://outlook.office365.com/powershell-liveid/" -Credential $UserCredential -Authentication "Basic" -AllowRedirection
            Import-PSSession $ExchangeSession -DisableNameChecking
            $CCSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.compliance.protection.outlook.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
            Import-PSSession $CCSession -Prefix cc
        }
        1 {$ExchangeSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri "https://outlook.office365.com/powershell-liveid/" -Credential $UserCredential -Authentication Basic -AllowRedirection
            Import-PSSession $ExchangeSession -DisableNameChecking
        }
        2 {$CCSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.compliance.protection.outlook.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
            Import-PSSession $CCSession -Prefix cc
        }
        3{$Domain = Read-Host -Prompt 'Domain'
            Import-Module Microsoft.Online.SharePoint.PowerShell -DisableNameChecking
            Connect-SPOService -Url https://$Domain-admin.sharepoint.com -credential $UserCredential
        }
        4{Import-Module LyncOnlineConnector
            $SFBOSession = New-CsOnlineSession -Credential $UserCredential
            Import-PSSession $SFBOSession
        }
        5{
        }
    }