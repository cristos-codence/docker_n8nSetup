#!/bin/bash

# NOTE: This script is deprecated.
# Please use run_compose_MAC.sh instead, which includes ngrok tunneling.
# This script is kept for backward compatibility only.

echo "⚠️  This script is deprecated. Please use run_compose_MAC.sh instead, which includes ngrok tunneling."
echo "Continue with this script anyway? (y/n)"
read -r answer
if [[ "$answer" != "y" ]]; then
  echo "Exiting. Please use run_compose_MAC.sh for improved functionality."
  exit 0
fi

DOCUMENTS_DIR="$HOME/Documents"
N8N_DATA_DIR="$DOCUMENTS_DIR/n8n_docker_files"

if [ ! -d "$N8N_DATA_DIR" ]; then
  echo "n8n_docker_files directory does not exist. Creating it..."
  mkdir -p "$N8N_DATA_DIR"
fi

# Stop and remove existing n8n container if it exists
if docker ps -q --filter "name=n8n" | grep -q .; then
  echo "Stopping and removing existing n8n container..."
  docker stop n8n
  docker rm n8n
fi

docker pull n8nio/n8n:latest

echo "Starting n8n container..."
docker run -d \
  --name n8n \
  -p 5678:5678 \
  -v "$N8N_DATA_DIR:/home/node/.n8n" \
  -e NODEJS_PREFER_IPV4=true \
  n8nio/n8n \
  start --tunnel

sleep 3
echo "n8n container logs:"
docker logs n8n --tail 10

echo ""
echo "⚠️  NOTE: This script does not include ngrok tunneling."
echo "    To access n8n from outside your network, please use run_compose_MAC.sh instead."
