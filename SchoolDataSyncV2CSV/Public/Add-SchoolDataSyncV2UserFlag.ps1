<#
.SYNOPSIS
Adds a user flag to the School Data Sync V2 userflags collection

.EXAMPLE
Add-SchoolDataSyncV2UserFlag -userSourcedId "1234" -flag "giftOrTalented"
#>
function Add-SchoolDataSyncV2UserFlag {
    [CmdletBinding()]

    Param(
        [Parameter(Mandatory = $true)]
        [String] $userSourcedId,

        [Parameter(Mandatory = $false)]
        [String] $flag
    )

    Process {
        if (!$script:Users.ContainsKey($userSourcedId)) {
            Write-Error "User with sourcedId $userSourcedId not found"
            return
        }

        $script:UserFlags["$($userSourcedId)-$($flag)"] = @{
            userSourcedId = $userSourcedId
            flag          = $flag
        }
    }
}