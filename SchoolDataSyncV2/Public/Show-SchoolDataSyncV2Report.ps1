function Show-SchoolDataSyncV2Report {
    [CmdletBinding()]
    param ()

    Process {
        Write-Host "$($PSStyle.Foreground.BrightGreen)Orgs:             $($PSStyle.Reset)$($script:Orgs.Count)"
        Write-Host "$($PSStyle.Foreground.BrightGreen)Users:            $($PSStyle.Reset)$($script:Users.Count)"
        Write-Host "$($PSStyle.Foreground.BrightGreen)Roles:            $($PSStyle.Reset)$($script:Roles.Count)"
        Write-Host "$($PSStyle.Foreground.BrightGreen)Classes:          $($PSStyle.Reset)$($script:Classes.Count)"
        Write-Host "$($PSStyle.Foreground.BrightGreen)Enrollments:      $($PSStyle.Reset)$($script:Enrollments.Count)"
        Write-Host "$($PSStyle.Foreground.BrightGreen)AcademicSessions: $($PSStyle.Reset)$($script:AcademicSessions.Count)"
        Write-Host "$($PSStyle.Foreground.BrightGreen)Courses:          $($PSStyle.Reset)$($script:Courses.Count)"
        Write-Host "$($PSStyle.Foreground.BrightGreen)Relationships:    $($PSStyle.Reset)$($script:Relationships.Count)"
        Write-Host "$($PSStyle.Foreground.BrightGreen)Demographics:     $($PSStyle.Reset)$($script:Demographics.Count)"
        Write-Host "$($PSStyle.Foreground.BrightGreen)UserFlags:        $($PSStyle.Reset)$($script:UserFlags.Count)"
    }
}