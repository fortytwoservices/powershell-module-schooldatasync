function Show-SchoolDataSyncV2Report {
    [CmdletBinding()]
    param ()

    Process {
        Write-Host "$($PSStyle.Foreground.BrightGreen)Orgs: $($PSStyle.Reset)$($script:Orgs.Count)"
        Write-Host "$($PSStyle.Foreground.BrightGreen)Users: $($PSStyle.Reset)$($script:Users.Count)"
        Write-Host "$($PSStyle.Foreground.BrightGreen)Roles: $($PSStyle.Reset)$($script:Roles.Count)"
    }
}