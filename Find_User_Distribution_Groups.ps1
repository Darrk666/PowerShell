$UserCredential = Get-Credential
Import-Module MsOnline
Connect-MsolService -Credential $UserCredential
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
Import-PSSession $Session
$Username = Read-Host -Prompt 'Username'
$DG = Get-DistributionGroup
ForEach ($DG in $DG) {
    $DGM = Get-DistributionGroupMember $DG.Name
    ForEach ($DGM in $DGM) {
        If($Username -eq $DGM) {
            Write-Host $DG
        }
    }
}