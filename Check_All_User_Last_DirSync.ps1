$Credential = Get-Credential
Import-Module MsOnline
Connect-MsolService -Credential $Credential
$UPN = Get-MsolUser
ForEach ($UPN in $UPN) {
        Write-Host $UPN.UserPrincipalName
        Write-Host $UPN.LastDirSyncTime 
}
Write-Host -NoNewLine 'Press any key to continue...';
$x = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');