### Script to start K2 Workflows via powershell
### Must be run on the K2 Server, or with access to the K2 server via RDP, typically port 5252
### Mainly used in load testing scenarios

# Load the SourceCode.Workflow.Client - You can find this dll in the K2 directory
[System.Console]::WriteLine("Sample powershell script to start a K2 process")
Add-Type -AssemblyName ("SourceCode.Workflow.Client, Version=4.0.0.0, Culture=neutral, PublicKeyToken=16a2c5aaaa1b130d")

# Create and open the connection
$conn = New-Object -TypeName SourceCode.Workflow.Client.Connection
$conn.Open("localhost")

#  Get a list of processes you can start
$conn.GetProcesses([ProcRights]::Admin)

# Create a Process Instance
$pi = $conn.CreateProcessInstance("WorkflowsTest\Timing Test - Between Decisions")
$pi.Folio = "[Folio value]"
$pi.DataFields["IntegerDatafield"].Value = 1;
$pi.DataFields["StringDataField"].Value = "somevalue";

#Start it
$conn.StartProcessInstance($pi);

# Example of using in a loop
for ($i = 0; $i -lt 5; $++){
    # Create a Process Instance
    $pi = $conn.CreateProcessInstance("WorkflowsTest\Timing Test - Between Decisions")
    $pi.Folio = "[Folio value]"
    $pi.DataFields["IntegerDatafield"].Value = 1;
    $pi.DataFields["StringDataField"].Value = "somevalue";

    #Start it
    $conn.StartProcessInstance($pi);
}

# Something more useful, Starting a Workflow for all uesrs in AD
# Import the Active Directory module
Import-Module ActiveDirectory

# Get all users in the domain
$users = Get-ADUser -Filter * -Property DisplayName, EmailAddress, Department

# Display the users
foreach ($user in $users) {
    Write-Output "Name: $($user.DisplayName), Email: $($user.EmailAddress), Department: $($user.Department)"
}