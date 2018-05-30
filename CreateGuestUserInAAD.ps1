$tenant = 'riskaad.onmicrosoft.com'
$userDisplayName = 'David02 Bourke02'
$userEmailAddress = 'davidbourke02@outlook.com'
$redirectUrl = 'http:\\localhost:8080'
$givenName = 'David02'
$surname = 'Bourke02'
$location = 'GB'
$userType = 'Guest' # Guest|Member

$filter = "DisplayName eq '$($userDisplayName)'"

$AzureAdCred = Get-Credential
Connect-AzureAD -Credential $AzureAdCred -TenantId $tenant
$foundUser = Get-AzureADUser -Filter $filter

If ($foundUser -eq $null)
{
    $messageInfo = New-Object Microsoft.Open.MSGraph.Model.InvitedUserMessageInfo

    $messageInfo.customizedMessageBody = “You have been invited to use the Risk Application. Please click on the 'Get Started' button to activate your account. `
    The application can be accessed at https://riskapp-preprod.sainsburys.co.uk”

    $newUser = New-AzureADMSInvitation -InvitedUserDisplayName $userDisplayName `
    -InvitedUserEmailAddress $userEmailAddress -SendInvitation $True -InviteRedirectUrl $redirectUrl -InvitedUserType $userType -InvitedUserMessageInfo $messageInfo

    $newUser

    # $newUser = Get-AzureADUser -Filter "displayName eq 'davidbourke01'"
    # $newUser | Remove-AzureADUser

    Set-AzureADUser -ObjectId $newUser.InvitedUser.Id -GivenName $givenName -Surname $surname -UsageLocation $location
}