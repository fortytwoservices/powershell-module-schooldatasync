<#
.SYNOPSIS
Adds a course to the School Data Sync V2 course collection

.EXAMPLE
Add-SchoolDataSyncV2Course -sourcedId "course1" -orgSourcedId "org1" -title "Course 1"
#>
function Add-SchoolDataSyncV2Course {
    [CmdletBinding()]

    Param(
        [Parameter(Mandatory = $true)]
        [String] $sourcedId,

        [Parameter(Mandatory = $true)]
        [String] $orgSourcedId,

        [Parameter(Mandatory = $true)]
        [String] $title,

        [Parameter(Mandatory = $false)]
        [String] $code = $null,

        [Parameter(Mandatory = $false)]
        [String] $schoolYearSourcedId = $null,
        
        [Parameter(Mandatory = $false)]
        [String] $subject = $null,
        
        [Parameter(Mandatory = $false)]
        [String] $grade = $null
    )

    Process {
        if ($script:Courses.ContainsKey($sourcedId)) {
            Write-Error "Course with sourcedId $sourcedId already exists"
            return
        }

        if (!$script:Orgs.ContainsKey($orgSourcedId)) {
            Write-Error "Org with sourcedId $orgSourcedId not found"
            return
        }

        if ($schoolYearSourcedId -and !$script:AcademicSessions.ContainsKey($schoolYearSourcedId)) {
            Write-Error "AcademicSession with sourcedId $schoolYearSourcedId not found"
            return
        }
        
        $key = "$($sourcedId)-$($orgSourcedId)"

        if($script:Courses.ContainsKey($key)) {
            Write-Error "Course with sourcedId $sourcedId and orgSourcedId $orgSourcedId already exists"
            return
        }

        $script:Courses[$key] = @{
            sourcedId           = $sourcedId
            orgSourcedId        = $orgSourcedId
            title               = $title ?? ""
            code                = $code ?? ""
            schoolYearSourcedId = $schoolYearSourcedId ?? ""
            subject             = $subject ?? ""
            grade               = $grade ?? ""
        }
    }
}