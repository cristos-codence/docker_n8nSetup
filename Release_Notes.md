# Release Notes - mvp-0.2.1

## Summary

This release includes updates to the setup scripts for n8n, the workflow automation tool, using Docker. The primary changes involve prioritizing Docker Compose for running n8n, improving the persistence method, and enhancing Traefik integration.

## Key Changes

- **Prioritized Docker Compose:** The recommended method for running n8n is now Docker Compose, offering a more robust and configurable deployment.
- **Persistence Method:** Updated the scripts to use a local directory (`./n8n-data`) for data persistence instead of a Docker volume.
- **Traefik Integration:** Improved Traefik integration by automatically detecting Traefik and removing port mapping from the n8n service when Traefik is used.

## Detailed Changes

- **README.md:**
    - Updated the installation and running instructions to prioritize Docker Compose.
    - Modified the persistence information to reflect the use of a local directory (`./n8n-data`).
    - Clarified that the n8n instance is accessible via Traefik when Traefik is configured.
- **build.sh:**
    - Added `docker-compose.override.yml` to the `docker-compose.zip` archive.
    - Removed existing zip files before creating new ones.
- **src/docker-compose.override.yml:**
    - Added a new file to override the port mapping when Traefik is used.
- **src/docker-compose.yml:**
    - Added explicit port mapping for port 5678.
    - Added volume mapping to persist data in `./n8n_data`
    - Added network configuration for traefik.
    - Added command to start n8n with tunnel.
- **src/run_compose.sh:**
    - Enhanced the script to detect Traefik and use `docker-compose.override.yml` to remove port mapping if Traefik is detected.
    - Added network creation for traefik if it doesn't exist.
- **src/run_n8n_MAC.sh:**
    - Modified the script to use a local directory (`./n8n_data`) for persistence.
- **src/run_n8n_WINDOWS.ps1:**
    - Modified the script to use a local directory (`./n8n_data`) for persistence.
- **test.sh:**
    - Added a new script to run all the `run_` scripts and check if they succeed.

## Notes

- Ensure Docker is installed and configured on your system.
- When using Traefik, the n8n instance will be accessible through your Traefik configuration.
