<#
.SYNOPSIS
Adds a user's demographic to the School Data Sync V2 collection

.EXAMPLE
Add-SchoolDataSyncV2Demographic -userSourcedId "1234"
#>
function Add-SchoolDataSyncV2Demographic {
    [CmdletBinding()]

    Param(
        [Parameter(Mandatory = $true)]
        [String] $userSourcedId,

        [Parameter(Mandatory = $false)]
        [String] $sex = "",

        [Parameter(Mandatory = $false)]
        [DateTime] $birthDate,

        [Parameter(Mandatory = $false)]
        [String] $birthCity = "",

        [Parameter(Mandatory = $false)]
        [String] $birthState = "",

        [Parameter(Mandatory = $false)]
        [String] $birthCountry = "",

        [Parameter(Mandatory = $false)]
        [String[]] $ethnicityCodes = @(),

        [Parameter(Mandatory = $false)]
        [String[]] $raceCodes = @()
    )

    Process {
        if ($sex -and $sex -notin "male", "female", "notSelected") {
            Write-Warning "sex $sex is not in the default set of values: male, female, notSelected"
        }

        if (!$script:Users.ContainsKey($userSourcedId)) {
            Write-Error "User with sourcedId $userSourcedId not found"
            return
        }

        if ($script:Demographics.ContainsKey($userSourcedId)) {
            Write-Warning "Overwriting existing demographic data for user with sourcedId $userSourcedId"
        }

        $script:Demographics[$userSourcedId] = @{
            userSourcedId = $userSourcedId
            sex = $sex ?? ""
            birthDate = $birthDate ? $birthDate.ToString("yyyy-MM-dd") : ""
            birthCity = $birthCity ?? ""
            birthState = $birthState ?? ""
            birthCountry = $birthCountry ?? ""
            ethnicityCodes = $ethnicityCodes -join ","
            raceCodes = $raceCodes -join ","
        }
    }
}