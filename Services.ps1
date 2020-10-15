Import-Module WebAdministration
$appPoolName = 'Teest'
$WebSiteName='TEST'
$WebAppName='Default Web Site'
$AppFolder='C:\inetpub\wwwroot'
if(Test-Path(IIS:\AppPools\$appPoolName))
{        
  Write-Host 'Web is Created with new App pool'`n
}else{
New-WebAppPool -Name $appPoolName -Force
Set-ItemProperty -Path IIS:\AppPools\$appPoolName -name processModel -value @{username="admin"; password="admin"; identitytype=3}
}
if (Test-Path(IIS:\Sites\$WebSiteName\$WebAppName)){
Write-Host "Web App $WebAppName already exists" -ForegroundColor Yellow
return
}
else {
New-Item -Name 'Engage' -ItemType directory -Path C:\inetpub\wwwroot -Force
New-WebApplication -Name $WebSiteName -Site $WebAppName -PhysicalPath C:\inetpub\wwwroot\'Engage' -ApplicationPool $appPoolName
}
