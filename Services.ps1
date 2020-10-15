Try
{
Remove-Item c:\Deployment -Force -Recurse -ErrorAction SilentlyContinue
Expand-Archive -LiteralPath C:\cfn\ebdata\source_bundle.zip -DestinationPath c:\Deployment -ErrorAction SilentlyContinue

$iisAppPoolName="TEMP"
cd IIS:\AppPools\

#check if the app pool exists
if (!(Test-Path $iisAppPoolName -pathType container))
{
    #create the app pool
    $appPool = New-Item $iisAppPoolName
    $appPool.managedRuntimeVersion ="V4.0"
    $appPool | Set-Item
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
