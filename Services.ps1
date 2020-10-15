$appPoolName = 'MyAppPool'
$scriptBlock = {
    Import-Module WebAdministration
    New-Item –Path IIS:\AppPools\$using:appPoolName
    Set-ItemProperty -Path
    IIS:\AppPools\$using:appPoolName -Name
    managedRuntimeVersion -Value 'v4.0'    
}
Invoke-Command  –ScriptBlock $scriptBlock