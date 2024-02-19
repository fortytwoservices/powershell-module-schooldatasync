<#
.SYNOPSIS
Adds a user to the School Data Sync V2 users collection

.EXAMPLE
Add-SchoolDataSyncV2Class -sourcedId "1234" -username "test@fortytwo.io"
#>
function Add-SchoolDataSyncV2AcademicSession {
    [CmdletBinding()]

    Param(
        [Parameter(Mandatory = $true)]
        [String] $sourcedId,

        [Parameter(Mandatory = $true)]
        [String] $title,

        [Parameter(Mandatory = $true)]
        [ValidateSet("schoolYear","semester","term","gradingPeriod","quarter")]
        [String] $type,

        [Parameter(Mandatory = $true)]
        [ValidateScript({ $_ -match "^2[0-9]{3}$" })]
        [String] $schoolYear,

        [Parameter(Mandatory = $true)]
        [DateTime] $startDate,

        [Parameter(Mandatory = $true)]
        [DateTime] $endDate
    )

    Process {
        if ($script:AcademicSessions.ContainsKey($sourcedId)) {
            Write-Error "AcademicSession with sourcedId $sourcedId already exists"
            return
        }
          
        $script:AcademicSessions[$sourcedId] = @{
            sourcedId  = $sourcedId
            title      = $title
            type       = $type
            schoolYear = $schoolYear
            startDate  = $startDate.ToString("yyyy-MM-dd")
            endDate    = $endDate.ToString("yyyy-MM-dd") 
        }
    }
}