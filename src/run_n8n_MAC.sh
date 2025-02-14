#!/bin/bash

# Get the user's documents directory
DOCUMENTS_DIR="$HOME/Documents"

# Define the n8n data directory
N8N_DATA_DIR="$DOCUMENTS_DIR/n8n_docker_files"

# Create the n8n-data directory if it doesn't exist
if [ ! -d "$N8N_DATA_DIR" ]; then
  echo "n8n_docker_files directory does not exist. Creating it..."
  mkdir -p "$N8N_DATA_DIR"
fi

# Run n8n using the n8n-data directory for persistence
docker pull n8nio/n8n:latest #fixme
docker run -d \
  --name n8n \
  -p 5678:80 \
  -v "$N8N_DATA_DIR:/home/node/.n8n" \
  -e NODEJS_PREFER_IPV4=true \
  n8nio/n8n \
  start --tunnel

sleep 5
docker logs n8n --tail 20
