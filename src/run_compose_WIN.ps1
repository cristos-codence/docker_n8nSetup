# Check if the traefik_net network exists
if (docker network inspect traefik_net) {
    Write-Host "traefik_net network exists."
} else {
    Write-Host "traefik_net network does not exist. Creating it..."
    docker network create traefik_net
    if (!$?) {
        Write-Error "Failed to create traefik_net network."
        exit
    }
}

# Check if a Traefik container exists
if (docker ps -q --filter "name=traefik" | Where-Object { $_ }) {
    Write-Host "Traefik container detected. Using docker-compose.override.yml to remove port mapping."
    docker compose pull
    docker compose -p n8n --file docker-compose.yml --file docker-compose.override.yml up -d
} else {
    Write-Host "No Traefik container detected. Using docker-compose.yml."
    docker compose pull
    docker compose -p n8n up -d
}
