Systeminfo | FIND "System Boot Time";
(Get-Date) - (Get-CimInstance Win32_OperatingSystem).LastBootUpTime
Write-Host -NoNewLine 'Press any key to continue...';
$x = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');