# Get the list of stored credentials
$credentials = cmdkey /list | Select-String -Pattern "Target:"

# Loop through each credential and delete it
foreach ($credential in $credentials) {
    $target = $credential -replace "Target:\s+", ""
    $target = $target.Trim()  # Remove leading and trailing spaces
    if ($target -ne "") {
        Write-Host "Deleting credential for $target"
        cmdkey /delete:$target
    }
}

Write-Host "Credentials deleted successfully."
