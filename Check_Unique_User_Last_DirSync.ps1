$Credential = Get-Credential
Import-Module MsOnline
Connect-MsolService -Credential $Credential
$Username = Read-Host -Prompt 'Username'
Get-MsolUser -UserPrincipalName $Username | SELECT LastDirsyncTime
Write-Host -NoNewLine 'Press any key to continue...';
$x = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');