<#
.SYNOPSIS
Adds an organization to the School Data Sync V2 organization collection

.EXAMPLE
Add-SchoolDataSyncV2Org -sourcedId "org1" -name "Org 1" -type "municipality"
#>
function Add-SchoolDataSyncV2Org {
    [CmdletBinding()]

    Param(
        [Parameter(Mandatory = $true)]
        [String] $sourcedId,

        [Parameter(Mandatory = $true)]
        [String] $name,

        [Parameter(Mandatory = $true)]
        [ValidateSet("school", "ministryOfEducation", "localAuthority", "department", "university", "region", "district", "college", "division", "local", "campus", "province", "state", "adultEducation", "researchCenter", "national", "municipality", "program", "departmentOfEducation", "academicTrust")]
        [String] $type,

        [Parameter(Mandatory = $false)]
        [String] $parentSourcedId = $null
    )

    Process {
        if ($script:Orgs.ContainsKey($sourcedId)) {
            Write-Error "Org with sourcedId $sourcedId already exists"
            return
        } 
        
        if ($parentSourcedId -and !$script:Orgs.ContainsKey($parentSourcedId)) {
            Write-Error "Parent org with sourcedId $parentSourcedId does not exist"
            return
        }
        
        $script:Orgs[$sourcedId] = @{
            sourcedId       = $sourcedId
            name            = $name
            type            = $type
            parentSourcedId = $parentSourcedId ?? ""
        }
    }
}