[CmdletBinding()]
param(
    [switch]
    $Bootstrap,

    [switch]
    $Test,

    [switch]
    $Toast
)

if ($Bootstrap.IsPresent) {
    Write-Information "Validate and install missing prerequisits for building ..."

    if (-not (Get-Module -Name Pester -ListAvailable)) {
        Write-Warning "Module 'Pester' is missing. Installing 'Pester' ..."
        Install-Module -Name Pester -Scope CurrentUser -Force
    }
}

if($Test.IsPresent) {
    if (-not (Get-Module -Name Pester -ListAvailable)) {
        throw "Cannot find the 'Pester' module. Please specify '-Bootstrap' to install build dependencies."
    }

    if ($env:TF_BUILD) {
        $res = Invoke-Pester "./test" -OutputFormat NUnitXml -OutputFile TestResults.xml
        if ($res.FailedCount -gt 0) { throw "$($res.FailedCount) tests failed." }
    } else {
        Invoke-Pester "./test"
    }
}

if($Toast.IsPresent) {
    $Body = @{
        Build   = $env:BUILD_BUILDNUMBER
        Branch  = $env:BUILD_SOURCEBRANCHNAME
        Project = $env:SYSTEM_TEAMPROJECT
        Status  = $env:AGENT_JOBSTATUS
        Commit  = $env:BUILD_SOURCEVERSION
        Owner   = $env:BUILD_REQUESTEDFOR
        BuildId = $env:BUILD_BUILDID
    }

    $Uri = 'http://{0}:8888/api/toast' -f $env:APIADDRESS

    Invoke-RestMethod -Headers @{ Authorization = "Bearer $env:APITOKEN" } -Uri $Uri -Method 'POST' -Body $Body
}
