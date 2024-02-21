<#
.SYNOPSIS
Adds a user to the School Data Sync V2 users collection

.EXAMPLE
Add-SchoolDataSyncV2User -sourcedId "1234" -username "test@fortytwo.io"
#>
function Add-SchoolDataSyncV2User {
    [CmdletBinding()]

    Param(
        [Parameter(Mandatory = $true)]
        [String] $sourcedId,

        [Parameter(Mandatory = $true)]
        [ValidateScript({ $_ -like "*@*" })]
        [String] $username,

        [Parameter(Mandatory = $false)]
        [String] $givenName = $null,

        [Parameter(Mandatory = $false)]
        [String] $familyName = $null,

        [Parameter(Mandatory = $false)]
        [ValidateScript({ $_ -like "*@*" })]
        [String] $activeDirectoryMatchId = $null,
        
        [Parameter(Mandatory = $false)]
        [ValidateScript({ $_ -like "*@*" })]
        [String] $email = $null,

        [Parameter(Mandatory = $false)]
        [ValidateScript({ $_ -match "^+[1-9][0-9]+$" })]
        [String] $phone = $null,

        [Parameter(Mandatory = $false)]
        [ValidateScript({ $_ -match "^+[1-9][0-9]+$" })]
        [String] $sms = $null
    )

    Process {
        if ($script:Users.ContainsKey($sourcedId)) {
            Write-Error "User with sourcedId $sourcedId already exists"
            return
        }

        if ($script:Usernames.ContainsKey($username)) {
            Write-Error "Error adding user with sourcedId $($sourcedId): Username $username already in use by sourcedId $($script:Usernames[$username].sourcedId)"
            return
        }
          
        $script:Users[$sourcedId] = @{
            sourcedId              = $sourcedId
            username               = $username
            givenName              = $givenName ?? ""
            familyName             = $familyName ?? ""
            activeDirectoryMatchId = $activeDirectoryMatchId ?? ""
            email                  = $email ?? ""
            phone                  = $phone ?? ""
            sms                    = $sms ?? ""
        }
        $script:Usernames[$username] = $script:Users[$sourcedId]
    }
}