$ftpServer = "ftp://112.175.185.132/html/index.html"
$username = "kwonhj159"
$password = "K3898919!"
$localFile = ".\index.html"

try {
    $webclient = New-Object System.Net.WebClient
    $webclient.Credentials = New-Object System.Net.NetworkCredential($username, $password)
    Write-Host "Uploading $localFile to $ftpServer..."
    $webclient.UploadFile($ftpServer, $localFile)
    Write-Host "Upload completed successfully!"
} catch {
    Write-Host "Error: $($_.Exception.Message)"
}
