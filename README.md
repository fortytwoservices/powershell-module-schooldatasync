# PowerShell Module for School Data Sync v2.1 CSV generation

## Usage

```PowerShell
Import-Module SchoolDataSyncV2CSV -Force -Verbose

# Add schools
Add-SchoolDataSyncV2Org -sourcedId 12 -name "Test Primary School" -type "school"
Add-SchoolDataSyncV2Org -sourcedId 13 -name "Test Secondary School" -type "school"

# Add a student in 6th grade
Add-SchoolDataSyncV2User -sourcedId student_675 -username "YoungF@M365EDU368686.OnMicrosoft.com"
Add-SchoolDataSyncV2UserFlag -userSourcedId student_675 -flag giftOrTalented
Add-SchoolDataSyncV2Demographic -userSourcedId student_675 -sex male -birthCountry NO 

Add-SchoolDataSyncV2Role -userSourcedId student_675 -orgSourcedId 12 -role "student" -grade "06" -isPrimary $true -roleStartDate "2023-08-01" -roleEndDate "2024-06-30"

# Add a teacher in 6th grade
Add-SchoolDataSyncV2User -sourcedId faculty_779 -username "IrvinS@M365EDU368686.OnMicrosoft.com"
Add-SchoolDataSyncV2Role -userSourcedId faculty_779 -orgSourcedId 12 -role "teacher" -grade "06" -isPrimary $true -roleStartDate "2023-08-01" -roleEndDate "2024-06-30"

# Add a computer science class
Add-SchoolDataSyncV2Class -sourcedId class_384764 -orgSourcedId 12 -title "Computer Science 101"

# Enroll student and teacher into the class
Add-SchoolDataSyncV2Enrollment -classSourcedId class_384764 -userSourcedId student_675 -role "student"
Add-SchoolDataSyncV2Enrollment -classSourcedId class_384764 -userSourcedId faculty_779 -role "teacher"

# Add the spring 2024 semester
Add-SchoolDataSyncV2AcademicSession -sourcedId spring_2024 -title "Spring semester" -type semester -schoolYear 2024 -startDate "2024-01-01" -endDate "2024-06-30"

# Print simple report and save csv files
Show-SchoolDataSyncV2Report
Save-SchoolDataSyncV2CSV
```