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
Remove-Item -Path $artifactDropPath -Recurse -Force

Copy-Item -Path "$($PSScriptRoot)\..\" -Destination $artifactDropPath -Recurse -Force
# TODO: Insert logic here to only copy files of interest. You should obviously leave out scripts and credential configs.

# TODO: Overwrite a javascript variable with a prod API key.



function Write-ItemToServer (
    $FolderName = "/",
    $Item,
    $webclient,
    $IsFolder = $false
)
{
    $FolderName = $FolderName.Replace("\", "/")
    Write-Host "Uploading to folder $($FolderName)"
    Write-Host "Uploading $($Item.Name)" 

    $ftpEndpoint = "$($ftpEndpoint)$($FolderName)"
    Write-Host "FTP ENDPOINT: $($ftpEndpoint)"
    Write-Host "Full ENDPOINT: $($ftpEndpoint+"/"+$Item.Name)"
    $uri = New-Object System.Uri($ftpEndpoint+"/"+$Item.Name) 

    if ($IsFolder){
        $webclient.UploadFile($uri) 

    }
    else {
    $webclient.UploadFile($uri, $item.FullName) 

    }
}


function Write-AllItemsToServer (
    $artifactDropPath,
    $folder = ""
)
{
    Write-Host "In write-allitemstoserver"
    Write-Host "Working with artifactdrop: $($artifactDropPath)"
    Write-Host "Working with folder: $($folder)"

    if ($folder)
    {
        $workingPath = Join-Path $artifactDropPath $folder
    }
    else 
    {
        $workingPath = $artifactDropPath
    }

    foreach($item in (Get-ChildItem $workingPath -File)){ 
        Write-ItemToServer -Item $item -webclient $webclient -FolderName $folder
    } 

    foreach($item in (Get-ChildItem $workingPath -Directory)){ 

        if (!($item.Name[0] -eq "."))
        {
            Write-ItemToServer -Item $item -webclient $webclient -FolderName $folder -IsFolder $true
            Write-AllItemsToServer -artifactDropPath $artifactDropPath -folder "$folder\$($item.Name)"
        }
        else {
            Write-Host "Skipping directory $($item.Name)"
        }
    }
}


$webclient = New-Object System.Net.WebClient 
 
$webclient.Credentials = New-Object System.Net.NetworkCredential($userName,$password)  
 
Write-AllItemsToServer -artifactDropPath $artifactDropPath

# foreach($item in (Get-ChildItem $artifactDropPath -File)){ 
#     Write-ItemToServer -Item $item -webclient $webclient
#     # "Uploading $item..." 
#     # $uri = New-Object System.Uri($ftpEndpoint+$item.Name) 
#     # $webclient.UploadFile($uri, $item.FullName) 
#  } 

