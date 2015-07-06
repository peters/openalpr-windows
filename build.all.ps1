param(
    [ValidateSet("All", "None")]
    [Parameter(Position = 0, ValueFromPipeline = $true)]
    [string] $CudaGeneration = "None"
)

$WorkingDir = Split-Path -parent $MyInvocation.MyCommand.Definition
$BuildPs1 = Join-Path $WorkingDir build.ps1

$PlatformToolSets = @()

if(Test-Path $env:VS120COMNTOOLS) {
    $PlatformToolSets += "v120"
}

if($PlatformToolSets.Length -eq 0) {
    Write-Error "Could not find a Visual Studio installation on your computer."
    exit 0
}

$PlatformToolSets | Foreach-Object {
    $PlatformToolset = $_
    @('Win32', 'x64') | Foreach-Object {
        $Platform = $_
        
        . $BuildPs1 -Target Build -Configuration Debug -Platform $Platform -PlatformToolset $PlatformToolset -CudaGeneration None		
        . $BuildPs1 -Target Build -Configuration Release -Platform $Platform -PlatformToolset $PlatformToolset -CudaGeneration None	

        if($CudaGeneration -eq "None") {
            continue
        }

        . $BuildPs1 -Target Build -Configuration Debug -Platform $Platform -PlatformToolset $PlatformToolset -CudaGeneration Kepler
        . $BuildPs1 -Target Build -Configuration Debug -Platform $Platform -PlatformToolset $PlatformToolset -CudaGeneration Fermi
        . $BuildPs1 -Target Build -Configuration Release -Platform $Platform -PlatformToolset $PlatformToolset -CudaGeneration Kepler		
        . $BuildPs1 -Target Build -Configuration Release -Platform $Platform -PlatformToolset $PlatformToolset -CudaGeneration Fermi	
    }
}

