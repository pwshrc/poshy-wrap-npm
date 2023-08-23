#!/usr/bin/env pwsh
$ErrorActionPreference = "Stop"
Set-StrictMode -Version Latest


if (-not (Test-Command npm)) {
    return
}

# Install dependencies globally
function Invoke-NpmInstallGlobally {
    npm i -g @args
}
Set-Alias -Name npmg -Value Invoke-NpmInstallGlobally

# npm package names are lowercase
# Thus, we've used camelCase for the following aliases:

# Install and save to dependencies in your package.json
# npms is used by https://www.npmjs.com/package/npms
function Invoke-NpmInstallSave {
    npm i -S @args
}
Set-Alias -Name npmS -Value Invoke-NpmInstallSave

# Install and save to dev-dependencies in your package.json
# npmd is used by https://github.com/dominictarr/npmd
function Invoke-NpmInstallSaveDev {
    npm i -D @args
}
Set-Alias -Name npmD -Value Invoke-NpmInstallSaveDev

# Force npm to fetch remote resources even if a local copy exists on disk.
function Invoke-NpmInstallForcefully {
    npm i -f @args
}
Set-Alias -Name npmF -Value Invoke-NpmInstallForcefully

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

# Check which npm modules are outdated
function Invoke-NpmOutdated {
    npm outdated @args
}
Set-Alias -Name npmO -Value Invoke-NpmOutdated

# Update all the packages listed to the latest version
function Invoke-NpmUpdate {
    npm update @args
}
Set-Alias -Name npmU -Value Invoke-NpmUpdate

# Check package versions
function Invoke-NpmVersion {
    npm version @args
}
Set-Alias -Name npmV -Value Invoke-NpmVersion

# List packages
function Invoke-NpmList {
    npm list @args
}
Set-Alias -Name npmL -Value Invoke-NpmList

# List top-level installed packages
function Invoke-NpmListDepth0 {
    npm list --depth=0 @args
}
Set-Alias -Name npmL0 -Value Invoke-NpmListDepth0

# Run npm start
function Invoke-NpmStart {
    npm start @args
}
Set-Alias -Name npmst -Value Invoke-NpmStart

# Run npm test
function Invoke-NpmTest {
    npm test @args
}
Set-Alias -Name npmt -Value Invoke-NpmTest

# Run npm scripts
function Invoke-NpmRun {
    npm run @args
}
Set-Alias -Name npmR -Value Invoke-NpmRun

# Run npm publish
function Invoke-NpmPublish {
    npm publish @args
}
Set-Alias -Name npmP -Value Invoke-NpmPublish

# Run npm init
function Invoke-NpmInit {
    npm init @args
}
Set-Alias -Name npmI -Value Invoke-NpmInit

# Run npm info
function Invoke-NpmInfo {
    npm info @args
}
Set-Alias -Name npmi -Value Invoke-NpmInfo

# Run npm search
function Invoke-NpmSearch {
    npm search @args
}
Set-Alias -Name npmSe -Value Invoke-NpmSearch

# Run npm run dev
function Invoke-NpmRunDev {
    npm run dev @args
}
Set-Alias -Name npmrd -Value Invoke-NpmRunDev


Export-ModuleMember -Function * -Alias *
