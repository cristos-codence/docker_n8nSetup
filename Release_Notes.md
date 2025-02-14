# Release Notes - mvp-0.3.0

## Summary

This release includes further enhancements to the setup scripts for n8n using Docker. The main changes involve updates to the Docker Compose configuration for better Traefik integration and improvements to the run scripts for both macOS and Windows.

## Key Changes

- **Docker Compose Configuration:** Updated the Docker Compose configuration to set the `N8N_HOST` environment variable in the override file and changed the port mapping to use port 80 in the main compose file.
- **Persistence Method:** Modified the scripts to use the user's Documents directory for data persistence (`$HOME/Documents/n8n_docker_files`).
- **Run Scripts:** Improved the run scripts for both macOS and Windows to handle the updated persistence method and provide better feedback during the setup process.
- **Testing:** Added a new test script to run all the setup scripts and perform cleanup steps between each test, improving error checking and reporting.

## Detailed Changes

- **src/docker-compose.override.yml:**
    - Added the `N8N_HOST` environment variable to set the hostname for n8n when using Traefik.
- **src/docker-compose.yml:**
    - Changed the port mapping to use port 80 instead of 5678.
    - Updated the volume mapping to use the user's Documents directory for persistence (`$HOME/Documents/n8n_docker_files`).
- **src/run_n8n_MAC.sh:**
    - Removed the script contents.
- **src/run_n8n_WIN.ps1:**
    - Updated the script to use the user's Documents directory for persistence (`$HOME/Documents/n8n_docker_files`).
    - Simplified the Docker run command.
- **push.sh:**
    - Added a new script to automate the process of committing changes, merging branches, and pushing to the remote repository.
- **test.sh:**
    - Added a new script to run all the setup scripts and check if they succeed.
    - Added cleanup steps between each test.
    - Improved error checking and reporting.

## Notes

- Ensure Docker is installed and configured on your system.
- The n8n instance will be accessible through your Traefik configuration when Traefik is set up.
- The data persistence directory has been changed to `$HOME/Documents/n8n_docker_files` for better organization and compatibility.
