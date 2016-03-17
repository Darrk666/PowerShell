$UserCredential = Get-Credential
Import-Module MsOnline
Connect-MsolService -Credential $UserCredential
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
Import-PSSession $Session
$MB = Get-Mailbox
$DG = Read-Host 'Distribution Group'
ForEach ($MB in $MB) {
$DGM = Get-DistributionGroupMember $DG
IF ($MB.Name -notin $DGM.Name){
Write-host $MB.Name
    }
}