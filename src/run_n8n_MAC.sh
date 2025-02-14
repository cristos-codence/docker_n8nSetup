#!/bin/bash

DOCUMENTS_DIR="$HOME/Documents"

N8N_DATA_DIR="$DOCUMENTS_DIR/n8n_docker_files"

if [ ! -d "$N8N_DATA_DIR" ]; then
  echo "n8n_docker_files directory does not exist. Creating it..."
  mkdir -p "$N8N_DATA_DIR"
fi

docker pull n8nio/n8n:latest

docker run -d \
  --name n8n \
  -p 5678:80 \
  -v "$N8N_DATA_DIR:/home/node/.n8n" \
  -e NODEJS_PREFER_IPV4=true \
  n8nio/n8n \
  start --tunnel

sleep 5
docker logs n8n --tail 20
