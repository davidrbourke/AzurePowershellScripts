#Connect-AzureRmAccount

configuration IIS
{
    # One can evaluate expressions to get the node list
    # E.g: $AllNodes.Where("Role -eq Web").NodeName
    node ("localhost")
    {
        # Call Resource Provider
        # E.g: WindowsFeature, File
        WindowsFeature WebServer
        {
            #Use Ensure Absent or Present
           Ensure = "Present"
           # Use Get-WindowsFeature on Windows Server to get features for Feature Name
           Name   = "web-server"
           # Use Get-DscResource windowsfeature -Syntax to check Syntax of this WindowsFeature property
           IncludeAllSubFeature = $true
        }
    }
}

# The configuration declare above must be run, it will create a .mof file, then it must be pushed or pulled
# IIS

# Push the configuration from on the server itself
# Start-DscConfiguration -Path .\IIS -Wait # Wait added to run in the foreground

# Import-Module ServerManager
# Get-WindowsFeature Web-Server # Will show installed IIS
