Import-Module WebAdministration
cd IIS:\AppPools\

#check if the app pool exists
if (!(Test-Path IIS:\AppPools\'TEST' -pathType container))
{
    #create the app pool
    $appPool = New-Item 'TEST'
    $appPool | Set-ItemProperty -Name -Path 'IIS:\AppPools\Teest' -name processModel -value @{username="admin"; password="admin"; identitytype=3}
}

 
