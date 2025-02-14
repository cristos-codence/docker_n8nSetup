# Create the n8n-data directory if it doesn't exist
if (!(Test-Path -Path "./n8n_data" -PathType Container)) {
    Write-Host "n8n_data directory does not exist. Creating it..."
    New-Item -ItemType Directory -Path "./n8n_data"
}

# Run n8n using the n8n-data directory for persistence
Write-Host "Pulling the latest n8nio/n8n image..."
docker pull n8nio/n8n:latest

Write-Host "Starting n8n..."
docker run -it --rm `
    --name n8n `
    -p 5678:5678 `
    -v "${PWD}/n8n_/home/node/.n8n" `
    -e NODEJS_PREFER_IPV4=true `
    # -e DEBUG=* `
    n8nio/n8n `
    start --tunnel
