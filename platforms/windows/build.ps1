param(
    [string]$LuantiVersion = $(if ($env:LUANTI_VERSION) { $env:LUANTI_VERSION } else { "5.17.0" })
)

$ErrorActionPreference = "Stop"

$projectRoot = (Resolve-Path (Join-Path $PSScriptRoot "../.."))
$buildRoot = Join-Path $projectRoot "build/windows"
$downloadRoot = Join-Path $buildRoot "download"
$extractRoot = Join-Path $buildRoot "engine"
$archivePath = Join-Path $downloadRoot "luanti-$LuantiVersion-win64.zip"
$outputPath = Join-Path $projectRoot "build/Craftmax-Windows-x64.zip"
$downloadUrl = "https://github.com/luanti-org/luanti/releases/download/$LuantiVersion/luanti-$LuantiVersion-win64.zip"

Remove-Item $buildRoot -Recurse -Force -ErrorAction SilentlyContinue
New-Item $downloadRoot -ItemType Directory -Force | Out-Null

Write-Host "Downloading Luanti $LuantiVersion..."
Invoke-WebRequest -Uri $downloadUrl -OutFile $archivePath
Expand-Archive -Path $archivePath -DestinationPath $extractRoot -Force

$engineRoot = Get-ChildItem $extractRoot -Directory | Select-Object -First 1
if (-not $engineRoot) {
    throw "Could not find the extracted Luanti directory."
}

$gameRoot = Join-Path $engineRoot.FullName "games/Craftmax"
New-Item $gameRoot -ItemType Directory -Force | Out-Null

$excludedNames = @(".git", ".github", "build")
Get-ChildItem $projectRoot -Force |
    Where-Object { $excludedNames -notcontains $_.Name } |
    ForEach-Object {
        Copy-Item $_.FullName -Destination $gameRoot -Recurse -Force
    }

Compress-Archive -Path (Join-Path $engineRoot.FullName "*") -DestinationPath $outputPath -Force
Write-Host "Created $outputPath"