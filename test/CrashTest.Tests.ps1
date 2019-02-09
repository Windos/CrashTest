Import-Module "$PSScriptRoot/../src/CrashTest.psd1" -Force

Describe Get-CrashTest {
    It 'returns correct quote' {
        Get-CrashTest | Should Be 'You are a crash test dummy. Your job is to EXPLODE.'
    }
}
