Import-Module WebAdministration
new-webapppool -Name 'Teest' -Force
set-item -Path 'IIS:\AppPools\Teest' -name processModel -value @{username="admin"; password="admin"; identitytype=3}
