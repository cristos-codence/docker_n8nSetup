#!/bin/bash

# Check if the traefik_net network exists
if docker network inspect traefik_net > /dev/null 2>&1; then
  echo "traefik_net network exists."
else
  echo "traefik_net network does not exist. Creating it..."
  docker network create traefik_net
  if [ $? -ne 0 ]; then
    echo "Failed to create traefik_net network."
    exit 1
  fi
fi

docker compose pull
docker compose -p n8n up -d
