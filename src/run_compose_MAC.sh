#!/bin/bash

cd $(dirname "$0") || exit 1 # Change directory to the script's directory

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

# Check if a Traefik container exists
if docker ps -q --filter "name=traefik" | grep -q .; then
  echo "Traefik container detected. Using docker-compose.traefik.yml to remove port mapping."
  docker compose pull
  docker compose -p n8n --file docker-compose.yml --file docker-compose.traefik.yml down
  docker compose -p n8n --file docker-compose.yml --file docker-compose.traefik.yml up -d
else
  echo "No Traefik container detected. Using docker-compose.yml."
  docker compose pull
  docker compose -p n8n down
  docker compose -p n8n up -d
fi

docker logs n8n --tail 20
