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
    

        $obj = @{
            "orgs.csv" = $script:Orgs.GetEnumerator() | ForEach-Object {$_.Value} | ConvertTo-Csv -NoTypeInformation -Delimiter "," -UseQuotes AsNeeded
            "users.csv" = $script:Users.GetEnumerator() | ForEach-Object {$_.Value} | ConvertTo-Csv -NoTypeInformation -Delimiter "," -UseQuotes AsNeeded
            "roles.csv" = $script:Roles.GetEnumerator() | ForEach-Object {$_.Value} | ConvertTo-Csv -NoTypeInformation -Delimiter "," -UseQuotes AsNeeded 
        }

        if($script:Classes.Count -eq 0) {
            $obj["classes.csv"] = "sourcedId,orgSourcedId,title,sessionSourcedIds,courseSourcedId,code"
        } else {
            $obj["classes.csv"] = $script:Classes.GetEnumerator() | ForEach-Object {$_.Value} | ConvertTo-Csv -NoTypeInformation -Delimiter "," -UseQuotes AsNeeded
        }

        if($script:Enrollments.Count -eq 0) {
            $obj["enrollments.csv"] = "classSourcedId,userSourcedId,role"
        } else {
            $obj["enrollments.csv"] = $script:Enrollments.GetEnumerator() | ForEach-Object {$_.Value} | ConvertTo-Csv -NoTypeInformation -Delimiter "," -UseQuotes AsNeeded
        }

        if($script:AcademicSessions.Count -eq 0) {
            $obj["academicSessions.csv"] = "sourcedId,title,type,schoolYear,startDate,endDate"
        } else {
            $obj["academicSessions.csv"] = $script:AcademicSessions.GetEnumerator() | ForEach-Object {$_.Value} | ConvertTo-Csv -NoTypeInformation -Delimiter "," -UseQuotes AsNeeded
        }

        if($script:Courses.Count -eq 0) {
            $obj["courses.csv"] = "sourcedId,orgSourcedId,title,code,schoolYearSourcedId,subject,grade"
        } else {
            $obj["courses.csv"] = $script:Courses.GetEnumerator() | ForEach-Object {$_.Value} | ConvertTo-Csv -NoTypeInformation -Delimiter "," -UseQuotes AsNeeded
        }

        if($script:Relationships.Count -eq 0) {
            $obj["relationships.csv"] = "userSourcedId,relationshipUserSourcedId,relationshipRole"
        } else {
            $obj["relationships.csv"] = $script:Relationships.GetEnumerator() | ForEach-Object {$_.Value} | ConvertTo-Csv -NoTypeInformation -Delimiter "," -UseQuotes AsNeeded
        }

        if($script:Demographics.Count -eq 0) {
            $obj["demographics.csv"] = "userSourcedId,sex,birthDate,birthCity,birthState,birthCountry,ethnicityCodes,raceCodes"
        } else {
            $obj["demographics.csv"] = $script:Demographics.GetEnumerator() | ForEach-Object {$_.Value} | ConvertTo-Csv -NoTypeInformation -Delimiter "," -UseQuotes AsNeeded
        }

        if($script:UserFlags.Count -eq 0) {
            $obj["userFlags.csv"] = "userSourcedId,flag"
        } else {
            $obj["userFlags.csv"] = $script:UserFlags.GetEnumerator() | ForEach-Object {$_.Value} | ConvertTo-Csv -NoTypeInformation -Delimiter "," -UseQuotes AsNeeded
        }

        $obj
    }
}