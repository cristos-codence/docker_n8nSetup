#!/bin/bash

# Create the n8n-data directory if it doesn't exist
if [ ! -d "./n8n-data" ]; then
  echo "n8n-data directory does not exist. Creating it..."
  mkdir -p "./n8n-data"
fi

# Run n8n using the n8n-data directory for persistence
docker pull n8nio/n8n:latest
docker run -it --rm \
  --name n8n \
  -p 5678:5678 \
  -v $(pwd)/n8n-/home/node/.n8n \
  -e NODEJS_PREFER_IPV4=true \
  n8nio/n8n \
  start --tunnel
