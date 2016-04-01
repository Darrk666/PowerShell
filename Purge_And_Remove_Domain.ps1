$Credential = Get-Credential
Import-Module MsOnline
Connect-MsolService -Credential $Credential
$Domain = Read-Host 'Domain Name'
Get-MsolUser -DomainName $Domain | %{Remove-MsolUser -UserPrincipalName $_.UserPrincipalName -Force}
Get-MsolContact -All | ?{$_.ProxyAddresses -Match $Domain} | %{Remove-MsolContact -Objectid $_.Objectid -Force}
Get-MsolGroup -All | ?{$_.ProxyAddresses -Match $Domain} | %{Remove-MsolGroup -Objectid $_.Objectid -Force}
Remove-MsolDomain -DomainName $Domain 