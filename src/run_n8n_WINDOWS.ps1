# Check if the n8n_data volume exists
if (docker volume inspect n8n_data -ErrorAction SilentlyContinue) {
    Write-Host "n8n_data volume exists."
} else {
    Write-Host "n8n_data volume does not exist. Creating it..."
    docker volume create n8n_data
    if (!$?) {
        Write-Error "Failed to create n8n_data volume."
        exit
    }
}

# Run n8n using the n8n_data volume for persistence
Write-Host "Pulling the latest n8nio/n8n image..."
docker pull n8nio/n8n:latest

Write-Host "Starting n8n..."
docker run -it --rm `
    --name n8n `
    -p 5678:5678 `
    -v n8n_data:/home/node/.n8n `
    -e NODEJS_PREFER_IPV4=true `
    # -e DEBUG=* `
    n8nio/n8n `
    start --tunnel
