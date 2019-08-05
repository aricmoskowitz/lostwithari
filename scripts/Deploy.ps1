Write-Host "Deploying lostwithari.com"

$configPath = Join-Path $PSScriptRoot "Credentials.xml"

[xml]$config = Get-Content $configPath

$userName = $config.Config.UserName.value
$password = $config.Config.Password.value
$ftpEndpoint = $config.Config.FtpUrl.value

Write-Host ("Deploying with username: $($userName)")
Write-Host ("Deploying with pasword:  $($password)")
Write-Host ("Deploying to endpoint:   $($ftpEndpoint)")


$artifactDropPath = Join-Path $env:TEMP "lostwithari-out"
Write-Host ("Staging artifacts in $($artifactDropPath)")

# TODO: Cleanup artifact drop before proceeding

Copy-Item -Path "$($PSScriptRoot)\..\" -Destination $artifactDropPath -Recurse -Force
# TODO: Insert logic here to only copy files of interest. You should obviously leave out scripts and credential configs.

# TODO: Overwrite a javascript variable with a prod API key.

# start $artifactDropPath



