<#
.SYNOPSIS
Adds a relationship to the School Data Sync V2 collection

.EXAMPLE
Add-SchoolDataSyncV2Relationship -userSourcedId "1234" -relationshipUserSourcedId "parent1" -relationshipRole "parent"
#>
function Add-SchoolDataSyncV2Relationship {
    [CmdletBinding()]

    Param(
        [Parameter(Mandatory = $true)]
        [String] $userSourcedId,

        [Parameter(Mandatory = $true)]
        [String] $relationshipUserSourcedId,

        [Parameter(Mandatory = $true)]
        [String] $relationshipRole
    )

    Process {
        if ($relationshipRole -notin "parent", "guardian", "relative", "other", "doctor", "aide") {
            Write-Warning "relationshipRole $relationshipRole is not in the default set of values: parent, guardian, relative, other, doctor, aide"
        }

        if (!$script:Users.ContainsKey($userSourcedId)) {
            Write-Error "User with sourcedId $userSourcedId not found"
            return
        }

        if (!$script:Users.ContainsKey($relationshipUserSourcedId)) {
            Write-Error "User with sourcedId $relationshipUserSourcedId not found"
            return
        }

        $relatedUser = $script:Users[$relationshipUserSourcedId]
        if (!$relatedUser.familyName) {
            Write-Error "User with sourcedId $relationshipUserSourcedId is a contact, and must have familyName set"
            return
        }

        if (!$relatedUser.givenName) {
            Write-Error "User with sourcedId $relationshipUserSourcedId is a contact, and must have givenName set"
            return
        }

        if (!$relatedUser.email) {
            Write-Error "User with sourcedId $relationshipUserSourcedId is a contact, and must have email set"
            return
        }

        $script:Relationships["$($userSourcedId)-$($relationshipUserSourcedId)-$($relationshipRole)"] = @{
            userSourcedId             = $userSourcedId
            relationshipUserSourcedId = $relationshipUserSourcedId
            relationshipRole          = $relationshipRole
        }
    }
}