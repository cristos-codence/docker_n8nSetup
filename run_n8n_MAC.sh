#!/bin/bash

# Check if the n8n_data volume exists
if docker volume inspect n8n_data > /dev/null 2>&1; then
  echo "n8n_data volume exists."
else
  echo "n8n_data volume does not exist. Creating it..."
  docker volume create n8n_data
fi

# Run n8n using the n8n_data volume for persistence
docker pull n8nio/n8n:latest
docker run -it --rm \
  --name n8n \
  -p 5678:5678 \
  -v n8n_data:/home/node/.n8n \
  -e NODEJS_PREFER_IPV4=true \
  # -e DEBUG=* \
  n8nio/n8n \
  start --tunnel
