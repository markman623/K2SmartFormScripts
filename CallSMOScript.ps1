
# Find the K2 SmartObject Port
Get-NetTCPConnection -State Listen | Select-Object LocalAddress, LocalPort, OwningProcess | ForEach-Object {
    $_ | Add-Member -MemberType NoteProperty -Name ProcessName -Value (Get-Process -Id $_.OwningProcess).Name -PassThru
} | Format-Table -Property LocalAddress, LocalPort, OwningProcess, ProcessName -AutoSize

# Load assemblies needed
Add-Type -Path "C:\Program Files (x86)\K2 blackpearl\Bin\SourceCode.HostClientAPI.dll"
Add-Type -Path "C:\Program Files (x86)\K2 blackpearl\Bin\SourceCode.SmartObjects.Client.dll"

$cs = New-Object -TypeName SourceCode.Hosting.Client.BaseAPI.SCConnectionStringBuilder
$cs.Host = "localhost"
$cs.Port = 5555
$cs.Integrated = $true
$cs.IsPrimaryLogin = $true

# Create the SMO server
$smoServer = New-Object -TypeName SourceCode.SmartObjects.Client.SmartObjectClientServer
$smoServer.CreateConnection()
$smoServer.Connection.Open($cs.ConnectionString)

# Get an SMO
$leaveRequestSMO = $smoServer.GetSmartObject("Leave_Request")
$leaveRequestSMO.ListMethods
$leaveRequestSMO.MethodToExecute = "GetList"
$list_results = $smoServer.ExecuteList($leaveRequestSMO)
$list_results.SmartObjectsList | % {
    write-host "Result";  
    $_.Properties | % {
        Write-Host ("    " + $_.Name + ": " + $_.Value)
    } }

# Use the SMO create method

$leaveRequestSMO.AllMethods | % {$_.Name}
$leaveRequestSMO.MethodToExecute = "Create"
$leaveRequestSMO.Properties["Employee_Name"].Value = "Joe Biden"
$newLeave = $smoServer.ExecuteScalar($leaveRequestSMO)