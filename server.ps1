param([int]$Port = 4173)

$ErrorActionPreference = 'Stop'
$root = [IO.Path]::GetFullPath($PSScriptRoot)
$url = "http://127.0.0.1:$Port/"

try {
    $existing = Invoke-WebRequest -UseBasicParsing -Uri $url -TimeoutSec 1
    if ($existing.StatusCode -eq 200) {
        Write-Host "PicViewer is already running at $url"
        Start-Process $url
        exit 0
    }
} catch {}

$mimeTypes = @{ '.html'='text/html; charset=utf-8'; '.css'='text/css; charset=utf-8'; '.js'='text/javascript; charset=utf-8'; '.json'='application/json; charset=utf-8'; '.svg'='image/svg+xml'; '.png'='image/png'; '.jpg'='image/jpeg'; '.jpeg'='image/jpeg'; '.webp'='image/webp'; '.ico'='image/x-icon' }
$listener = [Net.HttpListener]::new()
$listener.Prefixes.Add($url)

try {
    $listener.Start()
    Write-Host "PicViewer is running at $url"
    Write-Host 'Press Ctrl+C to stop.'
    Start-Process $url
    while ($listener.IsListening) {
        $context = $listener.GetContext()
        try {
            $relative = [Uri]::UnescapeDataString($context.Request.Url.AbsolutePath.TrimStart('/'))
            if ([string]::IsNullOrWhiteSpace($relative)) { $relative = 'index.html' }
            $file = [IO.Path]::GetFullPath([IO.Path]::Combine($root, $relative.Replace('/', [IO.Path]::DirectorySeparatorChar)))
            if (-not $file.StartsWith($root, [StringComparison]::OrdinalIgnoreCase) -or -not [IO.File]::Exists($file)) {
                $context.Response.StatusCode = 404
                $body = [Text.Encoding]::UTF8.GetBytes('Not Found')
            } else {
                $extension = [IO.Path]::GetExtension($file).ToLowerInvariant()
                $context.Response.ContentType = if ($mimeTypes.ContainsKey($extension)) { $mimeTypes[$extension] } else { 'application/octet-stream' }
                $context.Response.StatusCode = 200
                $context.Response.Headers['Cache-Control'] = 'no-cache'
                $body = [IO.File]::ReadAllBytes($file)
            }
            $context.Response.ContentLength64 = $body.Length
            $context.Response.OutputStream.Write($body, 0, $body.Length)
        } finally { $context.Response.OutputStream.Close() }
    }
} finally { $listener.Stop(); $listener.Close() }
