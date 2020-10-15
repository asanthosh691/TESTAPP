Import-Module WebAdministration
$appPoolName = 'Teest'
$WebSiteName='TEST'
$WebAppName='Default Web Site'
$AppFolder='C:\inetpub\wwwroot'

New-WebAppPool -Name $appPoolName -Force
Set-ItemProperty -Path IIS:\AppPools\$appPoolName -name processModel -value @{username="admin"; password="admin"; identitytype=3}
