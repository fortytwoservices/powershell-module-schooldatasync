<#
.SYNOPSIS
Adds a user to the School Data Sync V2 users collection

.EXAMPLE
Add-SchoolDataSyncV2Class -sourcedId "1234" -orgSourcedId "org1" -title "Class 1"

.EXAMPLE
Add-SchoolDataSyncV2Class -sourcedId "4321" -orgSourcedId "org1" -title "Class 2" -sessionSourcedIds "session1","session2" -courseSourcedId "course1" -code "class2code"
#>
function Add-SchoolDataSyncV2Class {
    [CmdletBinding()]

    Param(
        [Parameter(Mandatory = $true)]
        [String] $sourcedId,

        [Parameter(Mandatory = $true)]
        [String] $orgSourcedId,

        [Parameter(Mandatory = $true)]
        [String] $title,

        [Parameter(Mandatory = $false)]
        [String[]] $sessionSourcedIds = @(),

        [Parameter(Mandatory = $false)]
        [String] $courseSourcedId = $null,
        
        [Parameter(Mandatory = $false)]
        [String] $code = $null
    )

    Process {
        if ($script:Classes.ContainsKey($sourcedId)) {
            Write-Error "Class with sourcedId $sourcedId already exists"
            return
        }

        if (!$script:Orgs.ContainsKey($orgSourcedId)) {
            Write-Error "Org with sourcedId $orgSourcedId not found"
            return
        }

        $key = $sourcedId

        if ($script:Classes.ContainsKey($key)) {
            Write-Error "Class with sourcedId $sourcedId already exists"
            return
        }
          
        $script:Classes[$key] = @{
            sourcedId         = $sourcedId
            orgSourcedId      = $orgSourcedId ?? ""
            title             = $title ?? ""
            sessionSourcedIds = $sessionSourcedIds -join ","
            courseSourcedId   = $courseSourcedId ?? ""
            code              = $code ?? ""
        }
    }
}