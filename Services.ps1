Import-Module WebAdministration

    #create the app pool
    $appPool = New-Item 'TEST'
    $appPool | Set-ItemProperty -Path 'IIS:\AppPools\Teest' -name processModel -value @{username="admin"; password="admin"; identitytype=3}


 
