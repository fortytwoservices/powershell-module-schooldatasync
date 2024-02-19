New-Variable -Scope Script -Name Orgs -Value @{}
New-Variable -Scope Script -Name Users -Value @{}
New-Variable -Scope Script -Name Usernames -Value @{}
New-Variable -Scope Script -Name Roles -Value @{}
New-Variable -Scope Script -Name Classes -Value @{}
New-Variable -Scope Script -Name Courses -Value @{}

# Get public and private function definition files.
$Private = @( Get-ChildItem -Path $PSScriptRoot\Private\*.ps1 -ErrorAction SilentlyContinue )
$Public  = @( Get-ChildItem -Path $PSScriptRoot\Public\*.ps1 -ErrorAction SilentlyContinue )

# Dot source the files in order to define all cmdlets
Foreach($import in @($Public + $Private))
{
    Try
    {
        . $import.fullname
    }
    Catch
    {
        Write-Error -Message "Failed to import function $($import.fullname): $_"
    }
}

# Export all functions
Export-ModuleMember -Function $Public.Basename