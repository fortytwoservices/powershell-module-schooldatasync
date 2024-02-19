# PowerShell Module for School Data Sync v2.1 CSV generation

## Usage

```PowerShell
Import-Module SchoolDataSyncV2 -Force -Verbose
Add-SchoolDataSyncV2Org -sourcedId 12 -name "Test Primary School" -type "school"
Add-SchoolDataSyncV2Org -sourcedId 13 -name "Test Secondary School" -type "school"

Add-SchoolDataSyncV2User -sourcedId 675 -username "YoungF@M365EDU368686.OnMicrosoft.com"
Add-SchoolDataSyncV2User -sourcedId 21341234 -username "IrvinS@M365EDU368686.OnMicrosoft.com" -givenName "Irvin" -familyName "Sayers" -email "IrvinS@M365EDU368686.OnMicrosoft.com"


Add-SchoolDataSyncV2Role -userSourcedId 675 -orgSourcedId 12 -role "student" -grade "06" -isPrimary $true -roleStartDate (Get-Date) -roleEndDate (Get-Date).AddYears(1)


Add-SchoolDataSyncV2Class -sourcedId class_384764 -orgSourcedId 12 -title "Computer Science 101"
Add-SchoolDataSyncV2Class -sourcedId class_384765 -orgSourcedId 12 -title "Computer Science 102"

Add-SchoolDataSyncV2Enrollment -classSourcedId class_384764 -userSourcedId 675 -role "student"
Add-SchoolDataSyncV2AcademicSession -sourcedId "fall_2024" -title "Fall semester" -type semester -schoolYear 2024 -startDate "2024-08-01" -endDate "2024-12-31"

Add-SchoolDataSyncV2Relationship -userSourcedId 675 -relationshipUserSourcedId 21341234 -relationshipRole "parent"

Add-SchoolDataSyncV2UserFlag -userSourcedId 675 -flag giftOrTalented
Add-SchoolDataSyncV2Demographic -userSourcedId 675 -sex male -birthCountry NO 

Show-SchoolDataSyncV2Report
Save-SchoolDataSyncV2CSV
```