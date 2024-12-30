# Read the HTML content from the file
$htmlFilePath = "index.html"
$htmlContent = Get-Content -Path $htmlFilePath -Raw -Encoding UTF8

# Start HTTP listener
$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:8080/")

# Start listening for requests
$listener.Start()
Write-Output "Listening for requests at http://localhost:8080/"

try {
    while ($true) {
        $context = $listener.GetContext()
        $request = $context.Request
        $response = $context.Response

        # Handle root path
        if ($request.Url.AbsolutePath -eq "/") {
            $response.ContentType = "text/html"
            $buffer = [System.Text.Encoding]::UTF8.GetBytes($htmlContent)
            $response.ContentLength64 = $buffer.Length  # Set ContentLength64 before sending the response
            $response.OutputStream.Write($buffer, 0, $buffer.Length)

        } elseif ($request.Url.AbsolutePath -eq "/stats") {

            $csvFilePath = "calls.csv"
            $csvContent = Import-Csv -Path $csvFilePath -Encoding UTF8
            $json = $csvContent | ConvertTo-Json -Depth 3

            # Set ContentType and ContentLength64 for JSON response
            $response.ContentType = "application/json; charset=utf-8"  # Set content type
            $buffer = [System.Text.Encoding]::UTF8.GetBytes($json)
            $response.ContentLength64 = $buffer.Length  # Set ContentLength64 before sending the response

            # Send JSON response
            $response.StatusCode = 200
            $response.OutputStream.Write($buffer, 0, $buffer.Length)
        }elseif ($request.Url.AbsolutePath -eq "/close") {
            $response.StatusCode = 200
            $buffer = [System.Text.Encoding]::UTF8.GetBytes("Connection closed successfully")
            break
            
        } else {
            $response.StatusCode = 404
            $buffer = [System.Text.Encoding]::UTF8.GetBytes("404 Not Found")
            $response.ContentLength64 = $buffer.Length  # Set ContentLength64 before sending the response
            $response.OutputStream.Write($buffer, 0, $buffer.Length)
        }

        $response.OutputStream.Close()
    }
} finally {
    $listener.Stop()
    Write-Output "Stopped listening for requests"
}
