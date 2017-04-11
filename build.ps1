param(
    [parameter(Position=0)][string] $PreReleaseSuffix = ''
)

$packageOutputFolder = "$PSScriptRoot\.nupkgs"

# Restore packages and build product
Write-Host "Building..." -ForegroundColor "Green"
dotnet msbuild "$PSScriptRoot\NuGet.FrameworkAssemblyPacker.sln" /m /v:m /nologo "/t:Restore;Build;Pack" /p:Configuration=Release "/p:PackageVersionSuffix=$PreReleaseSuffix" "/p:PackageOutputPath=$packageOutputFolder"
