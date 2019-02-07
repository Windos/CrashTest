@{
    RootModule        = 'CrashTest.psm1'
    ModuleVersion     = '1.0.0'
    GUID              = '06238da0-c5ca-475e-8e9f-ea400b092147'
    Author            = 'Joshua (Windos) King'
    CompanyName       = 'king.geek.nz'
    Copyright         = '(c) 2019 Joshua (Windos) King. All rights reserved.'
    Description       = 'This project does nothing, except demo Azure Pipelines.'
    PowerShellVersion = '5.1'
    FunctionsToExport = 'Get-CrashTest'
    CmdletsToExport   = @()
    AliasesToExport   = @()
    PrivateData       = @{
        PSData = @{
            Tags         = @('Utilities', 'Windows10')
            LicenseUri   = 'https://github.com/Windos/CrashTest/blob/master/LICENSE'
            ProjectUri   = 'https://github.com/Windos/CrashTest'
            #IconUri      = ''
            ReleaseNotes = '# 1.0.0

* Module created.
'
        }
    }
}