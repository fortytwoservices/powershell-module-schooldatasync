<#
.SYNOPSIS
Adds a role for a user to the School Data Sync V2 collection

.EXAMPLE
Add-SchoolDataSyncV2Role -userSourcedId "1234" -orgSourcedId "org1" -role "student"
#>
function Add-SchoolDataSyncV2Role {
    [CmdletBinding()]

    Param(
        [Parameter(Mandatory = $true)]
        [String] $userSourcedId,

        [Parameter(Mandatory = $true)]
        [String] $orgSourcedId,

        [Parameter(Mandatory = $true)]
        [ValidateSet("principal", "chair", "professor", "researcher", "adjunct", "affiliate", "occupationalTherapist", "physicalTherapist", "speechTherapist", "visionTherapist", "paraprofessional", "specialServices", "advisor", "proctor", "nurse", "officeStaff", "lecturer", "itAdmin", "administrator", "teacher", "faculty", "staff", "teacherAssistant", "assistant", "instructor", "substitute", "coach", "alumni", "student", "other")]
        [String] $role,

        [Parameter(Mandatory = $false)]
        [String] $sessionSourcedId = $null,

        [Parameter(Mandatory = $false)]
        [String] $grade = $null,

        [Parameter(Mandatory = $false)]
        [Boolean] $isPrimary = $false,

        [Parameter(Mandatory = $false)]
        [DateTime] $roleStartDate,

        [Parameter(Mandatory = $false)]
        [DateTime] $roleEndDate
    )

    Process {
        if (!$script:Users.ContainsKey($userSourcedId)) {
            Write-Error "User with sourcedId $userSourcedId not found"
            return
        } 
        
        if (!$script:Orgs.ContainsKey($orgSourcedId)) {
            Write-Error "Org with sourcedId $orgSourcedId not found"
            return
        }

        if($grade -and $grade -notin "it", "pr", "pk", "tk", "kg", "01", "1", "02", "2", "03", "3", "04", "4", "05", "5", "06", "6", "07", "7", "08", "8", "09", "9", "10", "11", "12", "13", "14", "ps", "ug", "other", "ps1", "ps2", "ps3", "ps4", "undergraduate", "graduate", "postgraduate alumni", "adultEducation") {
            Write-Warning "Grade $grade is not in the default set of grades. Please ensure that the grade is correct. The default values are: it, pr, pk, tk, kg, 01, 1, 02, 2, 03, 3, 04, 4, 05, 5, 06, 6, 07, 7, 08, 8, 09, 9, 10, 11, 12, 13, 14, ps, ug, other, ps1, ps2, ps3, ps4, undergraduate, graduate, postgraduate alumni, adultEducation"
        }
        
        $key = "$($userSourcedId)-$($orgSourcedId)-$($role)"
        if($grade) {
            $key = "$($userSourcedId)-$($orgSourcedId)-$($role)-$($grade)"
        }

        if ($script:Roles.ContainsKey($key)) {
            Write-Error "Role combination for user '$userSourcedId', org '$orgSourcedId', role '$role' and grade '$grade' already exists"
            return
        }

        $script:Roles[$key] = @{
            userSourcedId    = $userSourcedId
            orgSourcedId     = $orgSourcedId
            role             = $role
            sessionSourcedId = $sessionSourcedId ?? ""
            grade            = $grade ?? ""
            isPrimary        = $isPrimary
            roleStartDate    = $roleStartDate ? $roleStartDate.ToString("yyyy-MM-dd") : ""
            roleEndDate      = $roleEndDate ? $roleEndDate.ToString("yyyy-MM-dd") : ""
        }
    }
}