# Get the user's documents directory
$DOCUMENTS_DIR = [Environment]::GetFolderPath("MyDocuments")

# Define the n8n data directory
$N8N_DATA_DIR = Join-Path -Path $DOCUMENTS_DIR -ChildPath "n8n_docker_files"

# Create the n8n-data directory if it doesn't exist
if (!(Test-Path -Path $N8N_DATA_DIR -PathType Container)) {
    Write-Host "n8n_docker_files directory does not exist. Creating it..."
    New-Item -ItemType Directory -Path $N8N_DATA_DIR
}

# Run n8n using the n8n-data directory for persistence
Write-Host "Pulling the latest n8nio/n8n image..."
docker pull n8nio/n8n:latest

Write-Host "Starting n8n..."
docker run -d --name n8n -p 5678:80 -v "$N8N_DATA_DIR:/home/node/.n8n" -e NODEJS_PREFER_IPV4=true n8nio/n8n start --tunnel

Start-Sleep -Seconds 5
docker logs n8n --tail 20
