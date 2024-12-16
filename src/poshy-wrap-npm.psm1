#!/usr/bin/env pwsh
$ErrorActionPreference = "Stop"
Set-StrictMode -Version Latest
#Requires -Modules @{ ModuleName = "poshy-lucidity"; RequiredVersion = "0.4.1" }


if (-not (Test-Command npm) -and (-not (Get-Variable -Name PWSHRC_FORCE_MODULES_EXPORT_UNSUPPORTED -Scope Global -ValueOnly -ErrorAction SilentlyContinue))) {
    return
}

# Install dependencies globally
function Invoke-NpmInstallGlobally {
    npm i -g @args
}
Set-Alias -Name npmg -Value Invoke-NpmInstallGlobally
Export-ModuleMember -Function Invoke-NpmInstallGlobally -Alias npmg

# npm package names are lowercase
# Thus, we've used camelCase for the following aliases:

# Install and save to dependencies in your package.json
# npms is used by https://www.npmjs.com/package/npms
function Invoke-NpmInstallSave {
    npm i -S @args
}
Set-Alias -Name npmS -Value Invoke-NpmInstallSave
Export-ModuleMember -Function Invoke-NpmInstallSave -Alias npmS

# Install and save to dev-dependencies in your package.json
# npmd is used by https://github.com/dominictarr/npmd
function Invoke-NpmInstallSaveDev {
    npm i -D @args
}
Set-Alias -Name npmD -Value Invoke-NpmInstallSaveDev
Export-ModuleMember -Function Invoke-NpmInstallSaveDev -Alias npmD

# Force npm to fetch remote resources even if a local copy exists on disk.
function Invoke-NpmInstallForcefully {
    npm i -f @args
}
Set-Alias -Name npmF -Value Invoke-NpmInstallForcefully
Export-ModuleMember -Function Invoke-NpmInstallForcefully -Alias npmF

# Execute command from node_modules folder based on current directory
# i.e npmE gulp
function Invoke-NpmBinMungedPath {
    [string] $npmBin = (npm bin)
    [string] $ps = [System.IO.Path]::PathSeparator
    xwith @{
        PATH = "${npmBin}${ps}${Env:PATH}"
    }, {
        & @args
    }
}
Set-Alias -Name npmE -Value Invoke-NpmBinMungedPath
Export-ModuleMember -Function Invoke-NpmBinMungedPath -Alias npmE

# Check which npm modules are outdated
function Invoke-NpmOutdated {
    npm outdated @args
}
Set-Alias -Name npmO -Value Invoke-NpmOutdated
Export-ModuleMember -Function Invoke-NpmOutdated -Alias npmO

# Update all the packages listed to the latest version
function Invoke-NpmUpdate {
    npm update @args
}
Set-Alias -Name npmU -Value Invoke-NpmUpdate
Export-ModuleMember -Function Invoke-NpmUpdate -Alias npmU

# Check package versions
function Invoke-NpmVersion {
    npm version @args
}
Set-Alias -Name npmV -Value Invoke-NpmVersion
Export-ModuleMember -Function Invoke-NpmVersion -Alias npmV

# List packages
function Invoke-NpmList {
    npm list @args
}
Set-Alias -Name npmL -Value Invoke-NpmList
Export-ModuleMember -Function Invoke-NpmList -Alias npmL

# List top-level installed packages
function Invoke-NpmListDepth0 {
    npm list --depth=0 @args
}
Set-Alias -Name npmL0 -Value Invoke-NpmListDepth0
Export-ModuleMember -Function Invoke-NpmListDepth0 -Alias npmL0

# Run npm start
function Invoke-NpmStart {
    npm start @args
}
Set-Alias -Name npmst -Value Invoke-NpmStart
Export-ModuleMember -Function Invoke-NpmStart -Alias npmst

# Run npm test
function Invoke-NpmTest {
    npm test @args
}
Set-Alias -Name npmt -Value Invoke-NpmTest
Export-ModuleMember -Function Invoke-NpmTest -Alias npmt

# Run npm scripts
function Invoke-NpmRun {
    npm run @args
}
Set-Alias -Name npmR -Value Invoke-NpmRun
Export-ModuleMember -Function Invoke-NpmRun -Alias npmR

# Run npm publish
function Invoke-NpmPublish {
    npm publish @args
}
Set-Alias -Name npmP -Value Invoke-NpmPublish
Export-ModuleMember -Function Invoke-NpmPublish -Alias npmP

# Run npm init
function Invoke-NpmInit {
    npm init @args
}
Set-Alias -Name npmI -Value Invoke-NpmInit
Export-ModuleMember -Function Invoke-NpmInit -Alias npmI

# Run npm info
function Invoke-NpmInfo {
    npm info @args
}
Set-Alias -Name npmi -Value Invoke-NpmInfo
Export-ModuleMember -Function Invoke-NpmInfo -Alias npmi

# Run npm search
function Invoke-NpmSearch {
    npm search @args
}
Set-Alias -Name npmSe -Value Invoke-NpmSearch
Export-ModuleMember -Function Invoke-NpmSearch -Alias npmSe

# Run npm run dev
function Invoke-NpmRunDev {
    npm run dev @args
}
Set-Alias -Name npmrd -Value Invoke-NpmRunDev
Export-ModuleMember -Function Invoke-NpmRunDev -Alias npmrd
