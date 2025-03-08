# Determine the parent directory of the Documents directory
$HOME = [System.IO.Path]::GetDirectoryName((Get-Item ([Environment]::GetFolderPath("MyDocuments"))).Parent.FullName)

# Check for .env file
if (Test-Path -Path ".env") {
    Write-Host "Loading environment variables from .env file."
} else {
    Write-Host "No .env file found. Creating from example..."
    if (Test-Path -Path ".env.example") {
        Copy-Item ".env.example" -Destination ".env"
        Write-Host "Created .env file from .env.example. Please edit it to add your ngrok authtoken."
    } else {
        Write-Host "WARNING: No .env.example file found. ngrok service may not work correctly."
        New-Item -Path ".env" -ItemType File
    }
}

# Check if ngrok authtoken is set
$envContent = Get-Content ".env" -ErrorAction SilentlyContinue
$ngrokToken = $envContent | Where-Object { $_ -match "NGROK_AUTHTOKEN=" } | ForEach-Object { $_.Split('=')[1] }

if ([string]::IsNullOrEmpty($ngrokToken) -or $ngrokToken -eq "your_ngrok_authtoken_here") {
    Write-Host "⚠️  NGROK_AUTHTOKEN not properly set in .env file. The ngrok service will not work correctly." -ForegroundColor Yellow
    Write-Host "   Get your authtoken from https://dashboard.ngrok.com/get-started/your-authtoken"
    Write-Host "   and add it to the .env file."
    exit 1
} else {
    Write-Host "✅ NGROK_AUTHTOKEN is set. ngrok service will be available." -ForegroundColor Green
}

# Stop and remove existing n8n containers if they exist
if (docker ps -q --filter "name=n8n" | Where-Object { $_ }) {
    Write-Host "Stopping and removing existing n8n containers..."
    docker stop n8n
    docker rm n8n
}

if (docker ps -q --filter "name=n8n-ngrok" | Where-Object { $_ }) {
    Write-Host "Stopping and removing existing n8n-ngrok container..."
    docker stop n8n-ngrok
    docker rm n8n-ngrok
}

# Start containers
Write-Host "Starting n8n with ngrok..."
docker compose pull
docker compose -p n8n down
docker compose -p n8n up -d

# Show logs
Write-Host "`nn8n container logs:" -ForegroundColor Cyan
docker logs n8n --tail 10

Write-Host "`nngrok container logs:" -ForegroundColor Cyan
docker logs n8n-ngrok --tail 5
