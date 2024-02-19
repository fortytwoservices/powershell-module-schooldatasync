# PowerShell Module for School Data Sync v2.1 CSV generation

## Usage

```PowerShell
Import-Module SchoolDataSyncV2 -Force -Verbose

# Add schools
Add-SchoolDataSyncV2Org -sourcedId 12 -name "Test Primary School" -type "school"
Add-SchoolDataSyncV2Org -sourcedId 13 -name "Test Secondary School" -type "school"

# Add student
Add-SchoolDataSyncV2User -sourcedId 675 -username "YoungF@M365EDU368686.OnMicrosoft.com"
Add-SchoolDataSyncV2Role -userSourcedId 675 -orgSourcedId 12 -role "student" -grade "06" -isPrimary $true -roleStartDate (Get-Date) -roleEndDate (Get-Date).AddYears(1)

# Add teacher
Add-SchoolDataSyncV2User -sourcedId 6484 -username "IrvinS@M365EDU368686.OnMicrosoft.com"
Add-SchoolDataSyncV2Role -userSourcedId 6484 -orgSourcedId 12 -role "teacher" -isPrimary $true -roleStartDate (Get-Date) -roleEndDate (Get-Date).AddYears(1)

Show-SchoolDataSyncV2Report
Save-SchoolDataSyncV2CSV
```