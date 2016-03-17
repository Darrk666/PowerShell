$UserCredential = Get-Credential
Import-Module MsOnline
Connect-MsolService -Credential $UserCredential
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
Import-PSSession $Session
$Username = Read-Host -Prompt 'Username'
$DG = Get-DistributionGroup
ForEach ($DG in $DG){
    $Count = (Get-DistributionGroupMember $DG.Name | Where { $_.Name -eq $Username } | measure).Count
    IF ($Count -eq 0){
        Write-Host $DG
    }
}