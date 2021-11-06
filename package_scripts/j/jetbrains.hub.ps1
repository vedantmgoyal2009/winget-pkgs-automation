$result = (Invoke-RestMethod -Method Get -Uri $package.repo_uri).HB
if ($result.build -gt $package.last_checked_tag)
{
    $update_found = $true
    $version = "$($result.version.TrimStart('2').TrimStart('0')).$($result.build)"
    $jsonTag = $result.build
    $urls.Add(($result.downloads.windows.link -replace "https://download.jetbrains.com","https://download-cdn.jetbrains.com")) | Out-Null
}
else
{
    $update_found = $false
}