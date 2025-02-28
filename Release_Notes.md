# Release Notes - mvp-0.3.4

## Summary

This release focuses on improving the installation experience and fixing issues with Traefik integration. The documentation has been reorganized for better clarity, and several technical improvements have been made to the Docker configuration and scripts.

## Key Changes

- **Installation Experience:** 
    - Moved installation instructions to the top of README.md
    - Added direct download buttons for Docker Desktop and docker-compose.zip
    - Improved clarity of setup instructions for both Windows and macOS

- **Docker Compose Configuration:**
    - Renamed docker-compose.override.yml to docker-compose.traefik.yml for clearer purpose
    - Updated Traefik network configuration for better integration
    - Modified port mappings and environment variables for improved compatibility

- **Run Scripts Improvements:**
    - Added checks for existing containers to prevent conflicts
    - Improved HOME directory detection for Windows environments
    - Updated scripts to use the new docker-compose.traefik.yml filename
    - Added proper PowerShell execution policy bypass commands

## Technical Details

- **Docker Configuration Changes:**
    - Modified port mapping configuration for better Traefik compatibility
    - Updated environment variables for proper hostname resolution
    - Improved network configuration for Traefik integration

- **Script Enhancements:**
    - Added container cleanup before starting new instances
    - Improved error handling and user feedback
    - Better path handling for Windows environments

## Notes

- The n8n instance will be accessible at `http://localhost:5678` by default
- When using Traefik, the instance will be accessible through your Traefik configuration
- Windows users should use `powershell.exe -executionpolicy bypass` to run the scripts
- Data persistence continues to use `$HOME/Documents/n8n_docker_files`

## Upgrade Notes

If upgrading from a previous version:
1. Stop any running n8n containers
2. Download the latest release
3. Replace all existing files with the new versions
4. Run the appropriate script for your operating system
