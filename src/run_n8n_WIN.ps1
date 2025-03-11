#!/usr/bin/env pwsh

# NOTE: This script is deprecated.
# Please use run_compose_WIN.ps1 instead, which includes ngrok tunneling.
# This script is kept for backward compatibility only.

Write-Host "⚠️  This script is deprecated. Please use run_compose_WIN.ps1 instead, which includes ngrok tunneling." -ForegroundColor Yellow
Write-Host "Continue with this script anyway? (y/n)"
$answer = Read-Host
if ($answer -ne "y") {
    Write-Host "Exiting. Please use run_compose_WIN.ps1 for improved functionality."
    exit 0
}

# Get the user's documents directory
$DOCUMENTS_DIR = [Environment]::GetFolderPath("MyDocuments")

# Define the n8n data directory
$N8N_DATA_DIR = Join-Path -Path $DOCUMENTS_DIR -ChildPath "n8n_docker_files"

# Create the n8n-data directory if it doesn't exist
if (!(Test-Path -Path $N8N_DATA_DIR -PathType Container)) {
    Write-Host "n8n_docker_files directory does not exist. Creating it..."
    New-Item -ItemType Directory -Path $N8N_DATA_DIR
}

# Stop and remove existing n8n container if it exists
if (docker ps -q --filter "name=n8n" | Where-Object { $_ }) {
    Write-Host "Stopping and removing existing n8n container..."
    docker stop n8n
    docker rm n8n
}

# Run n8n using the n8n-data directory for persistence
Write-Host "Pulling the latest n8nio/n8n image..."
docker pull n8nio/n8n:latest

Write-Host "Starting n8n..."
docker run -d --name n8n -p 5678:5678 -v "${N8N_DATA_DIR}:/home/node/.n8n" -e NODEJS_PREFER_IPV4=true n8nio/n8n start --tunnel

Start-Sleep -Seconds 3
Write-Host "n8n container logs:" -ForegroundColor Cyan
docker logs n8n --tail 10

Write-Host ""
Write-Host "⚠️  NOTE: This script does not include ngrok tunneling." -ForegroundColor Yellow
Write-Host "    To access n8n from outside your network, please use run_compose_WIN.ps1 instead."
