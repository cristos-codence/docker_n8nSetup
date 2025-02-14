#!/bin/bash

# Create the n8n-data directory if it doesn't exist
if [ ! -d "./n8n_data" ]; then
  echo "n8n_data directory does not exist. Creating it..."
  mkdir -p "./n8n_data"
fi

# Run n8n using the n8n-data directory for persistence
docker pull n8nio/n8n:latest #fixme
docker run -d \
  --name n8n \
  -p 5678:5678 \
  -v "$(pwd)/n8n_/home/node/.n8n" \
  -e NODEJS_PREFER_IPV4=true \
  n8nio/n8n \
  start --tunnel

sleep 5
docker logs n8n --tail 20
