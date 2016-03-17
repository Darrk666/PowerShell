$UserCredential = Get-Credential
Import-Module MsOnline
Connect-MsolService -Credential $UserCredential
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
Import-PSSession $Session
$DistributionGroup = Read-Host -Prompt 'Distribution Group Name'
Get-DistributionGroupMember -Identity $DistributionGroup
Write-Host -NoNewLine 'Press any key to continue...';
$x = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');