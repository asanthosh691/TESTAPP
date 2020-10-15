Import-Module WebAdministration
$appPoolName = 'Teest'
$WebSiteName='TEST'
$WebAppName='Default Web Site'
$AppFolder='C:\inetpub\wwwroot'

New-WebAppPool -Name 'Teest' -Force
Set-ItemProperty -Path 'IIS:\AppPools\Teest' -name processModel -value @{username="admin"; password="admin"; identitytype=3}
