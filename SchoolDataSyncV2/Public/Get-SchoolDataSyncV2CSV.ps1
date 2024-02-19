function Get-SchoolDataSyncV2CSV {
    [CmdletBinding()]
    param ()

    Process {
        if($script:Orgs.Count -eq 0) {
            Write-Error "No orgs have been added"
            return
        }

        if($script:Users.Count -eq 0) {
            Write-Error "No users have been added"
            return
        }

        if($script:Roles.Count -eq 0) {
            Write-Error "No roles have been added"
            return
        }
    

        @{
            "orgs.csv" = $script:Orgs.GetEnumerator() | ForEach-Object {$_.Value} | ConvertTo-Csv -NoTypeInformation -Delimiter "," -UseQuotes AsNeeded
            "users.csv" = $script:Users.GetEnumerator() | ForEach-Object {$_.Value} | ConvertTo-Csv -NoTypeInformation -Delimiter "," -UseQuotes AsNeeded
            "roles.csv" = $script:Roles.GetEnumerator() | ForEach-Object {$_.Value} | ConvertTo-Csv -NoTypeInformation -Delimiter "," -UseQuotes AsNeeded
        }
    }
}