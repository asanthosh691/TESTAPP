﻿Try
{
Remove-Item c:\Deployment -Force -Recurse -ErrorAction SilentlyContinue
Expand-Archive -LiteralPath C:\cfn\ebdata\source_bundle.zip -DestinationPath c:\Deployment -ErrorAction SilentlyContinue
$appPoolName = 'Teest'
$WebSiteName='TEST'
$WebAppName='Default Web Site'
$AppFolder='C:\inetpub\wwwroot'
if(Test-Path("IIS:\AppPools\" + $appPoolName))
{        
  Write-Host 'Web is Created with new App pool'`n
}else{
New-WebAppPool -Name $appPoolName -Force
Set-ItemProperty -Path IIS:\AppPools\$appPoolName -name processModel -value @{username="admin"; password="admin"; identitytype=3}
}
if (Test-Path("IIS:\Sites\$WebSiteName\$WebAppName")){
Write-Host "Web App $WebAppName already exists" -ForegroundColor Yellow
return
}
else {
New-Item -Name 'Engage' -ItemType directory -Path C:\inetpub\wwwroot -Force
New-WebApplication -Name $WebSiteName -Site $WebAppName -PhysicalPath C:\inetpub\wwwroot\'Engage' -ApplicationPool $appPoolName
}

        #  function installsevice($servicename,$svc_dir,$svc_folder)
        #  {
        #    $svc_exist=Get-Service -Name $servicename -ErrorAction SilentlyContinue
               
        #        if($svc_exist -ne $null)
        #        {
        #               C:\Windows\Microsoft.NET\Framework\v4.0.30319\installutil -u $svc_dir\"$servicename_exe.exe"
        #               Start-Sleep 5
        #               if($LASTEXITCODE -eq 0){write-host "OK"} else {  Write-Error "Error"}  
				#       Remove-Item $svc_dir -Force -Recurse
        #        }
        #    $svc_exist=Get-Service -Name $servicename -ErrorAction SilentlyContinue
         
        #        if($svc_exist -eq $null)
        #        {
        #          new-item $svc_dir -ItemType Directory -Force -ErrorAction SilentlyContinue
        #          Copy-Item "C:\Deployment\$svc_folder\*" $svc_dir -Force -Recurse
        #          C:\Windows\Microsoft.NET\Framework\v4.0.30319\installutil $svc_dir\"$servicename_exe.exe" 
        #          if($LASTEXITCODE -eq 0){write-host "OK"} else {  Write-Error "Error"}  
        #        }

        #        Start-Sleep 5
        #        Get-Service -Name $servicename | Start-Service
        #        Start-Sleep 5
               
        #    $checkstatus=(Get-Service -Name $servicename -ErrorAction SilentlyContinue).Status
        #       if($checkstatus -eq 'Running')
        #       {
        #          write-host "Service is up and running"
        #       }
        #       else
        #       {
	         
        #          write-host "Error: Sending failed singnal to EB" `n
        #          Remove-Item C:\Deployment -Force -Recurse -ErrorAction stop 
		    #         exit 1
        #       }
               
               
        #  }
         
#INSTALLING SERICES
#===================

# ###AppConfigService###
# $svc_dir="C:\Services\AppConfigService"
# $servicename_exe="AppConfigService"
# $servicename='TelStrat Engage Application Configuration Service'
# $svc_folder="AppConfigService-Build"
# installsevice $servicename $svc_dir $svc_folder


# # C:\Windows\Microsoft.NET\Framework\v4.0.30319\installutil -u $svc_dir\"$servicename_exe.exe"


# ###EngageWebService###
# $svc_dir="C:\Services\EngageWebService"
# $servicename_exe="EngageWebService"
# $servicename='TelStrat Engage Web Service'
# $svc_folder="EngageWebService-Build"
# installsevice $servicename $svc_dir $svc_folder

# ###SearchService###
# $svc_dir="C:\Services\SearchService"
# $servicename_exe="SearchService"
# $servicename='SearchService'
# $svc_folder="SearchService-Build"
# installsevice $servicename $svc_dir $svc_folder


Write-Host "Successfully installed all services.."

#INSTALLING WEB
#===================
#Write-Host "Deploying WEB contents."
#Remove-Item C:\inetpub\wwwroot\* -Force -Recurse -ErrorAction SilentlyContinue
#Start-Sleep 2
#Copy-Item C:\Deployment\WebApp\* -Destination C:\inetpub\wwwroot -Force -Recurse
Write-Host "Web app is up and running...."
}
catch
{
Write-Host $_.Exception.Message`n -ForegroundColor Red
  write-host "Error: Sending failed singnal to EB" `n
  Remove-Item C:\Deployment -Force -Recurse -ErrorAction SilentlyContinue
  exit 1
}