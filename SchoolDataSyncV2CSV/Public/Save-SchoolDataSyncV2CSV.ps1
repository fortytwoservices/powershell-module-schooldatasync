function Save-SchoolDataSyncV2CSV {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false)]
        [String] $Path = "."
    )

    Process {
        if(!(Test-Path -Path $Path -PathType Container)) {
            Write-Error "Path $Path does not exist as a folder"
            return
        }

        (Get-SchoolDataSyncV2CSV).GetEnumerator() | ForEach-Object {
            $file = Join-Path -Path $Path -ChildPath $_.Key
            $_.Value | Out-File -FilePath $file -Force
        }
    }
}