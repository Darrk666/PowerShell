$UserCredential = Get-Credential
Import-Module MsOnline
Connect-MsolService -Credential $UserCredential
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
Import-PSSession $Session
$Folder = Read-Host -Prompt 'Folder Location'
$FileName = Read-Host -Prompt 'File Name'
Get-StaleMailboxDetailReport | Sort Username -Unique | SELECT Username, WindowsLiveID, LastLogin, DaysInactive |Export-Csv $Folder\$Filename.csv