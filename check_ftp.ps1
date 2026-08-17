$ftpServer = "ftp://112.175.185.132/"
$username = "kwonhj159"
$password = "K3898919!"

try {
    # 1. Check directory
    $request = [System.Net.FtpWebRequest]::Create($ftpServer)
    $request.Credentials = New-Object System.Net.NetworkCredential($username, $password)
    $request.Method = [System.Net.WebRequestMethods+Ftp]::ListDirectoryDetails
    
    $response = $request.GetResponse()
    $reader = New-Object System.IO.StreamReader($response.GetResponseStream())
    $files = $reader.ReadToEnd()
    
    Write-Host "--- Directory Listing ---"
    Write-Host $files
    Write-Host "-------------------------"
    
    $reader.Close()
    $response.Close()
} catch {
    Write-Host "Error: $($_.Exception.Message)"
}
