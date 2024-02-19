<#
.SYNOPSIS
Adds a user to the School Data Sync V2 users collection

.EXAMPLE
Add-SchoolDataSyncV2Enrollment -sourcedId "1234" -username "test@fortytwo.io"
#>
function Add-SchoolDataSyncV2Enrollment {
    [CmdletBinding()]

    Param(
        [Parameter(Mandatory = $true)]
        [String] $classSourcedId,

        [Parameter(Mandatory = $true)]
        [String] $userSourcedId,

        [Parameter(Mandatory = $true)]
        [ValidateSet("student","visionTherapist","substitute","aid","paraprofessional","principal","proctor","teacherAssistant","specialServices","teacher","professor","advisor","administrator","lecturer","coach","occupationalTherapist","affiliate","assistant","physicalTherapist","adjunct","staff","speechTherapist","instructor","alumni","chair","itAdmin","officeStaff")]
        [String] $role
    )

    Process {
        if (!$script:Classes.ContainsKey($classSourcedId)) {
            Write-Error "Class with sourcedId $classSourcedId does not exist"
            return
        }

        if (!$script:Users.ContainsKey($userSourcedId)) {
            Write-Error "User with sourcedId $userSourcedId does not exist"
            return
        }
        
        $key = "$($classSourcedId)-$($userSourcedId)-$($role)"

        if($script:Enrollments.ContainsKey($key)){
            Write-Error "Enrollment combination for class $classSourcedId, user $userSourcedId and role $role already exists"
            return
        }

        $script:Enrollments[$key] = @{
            classSourcedId = $classSourcedId
            userSourcedId  = $userSourcedId
            role           = $role 
        }
    }
}