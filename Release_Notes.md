# Release Notes - mvp-0.4.0

## Summary

This release introduces ngrok integration, providing a simplified method for accessing your n8n instance from the internet without complex network configuration. The ngrok Docker container is now included as part of the standard setup, working alongside the existing Traefik integration option.

## Key Changes

- **ngrok Integration:**
    - Added ngrok Docker container for secure tunneling
    - Implemented automatic setup of ngrok configuration
    - Created detailed documentation for ngrok usage

- **Script Improvements:**
    - Enhanced environment detection for ngrok configuration
    - Added automatic .env file creation and management
    - Improved error handling for authentication token configuration
    - Updated logging to display both n8n and ngrok status

- **Docker Configuration Updates:**
    - Modified docker-compose.yml to include ngrok service
    - Updated container networking for better integration
    - Simplified tunneling configuration

- **Documentation Additions:**
    - Added comprehensive ngrok setup guide (README_NGROK.md)
    - Updated existing documentation to reference ngrok option
    - Included troubleshooting tips for common ngrok issues

## Technical Details

- **Docker Configuration Changes:**
    - Added ngrok service using official ngrok/ngrok:latest image
    - Configured ngrok to tunnel to n8n container on port 5678
    - Used environment variables for flexible configuration

- **Script Enhancements:**
    - Added .env file management for ngrok authentication
    - Enhanced startup scripts to check for proper ngrok configuration
    - Improved container logs display

## Notes

- The n8n instance continues to be accessible at `http://localhost:5678` by default
- When using ngrok, a public URL will be displayed in the ngrok container logs
- ngrok authentication token must be configured in the .env file
- Both Traefik and ngrok can be used together, providing flexibility in access methods

## Upgrade Notes

If upgrading from a previous version:
1. Stop any running n8n containers
2. Download the latest release
3. Replace all existing files with the new versions
4. For ngrok functionality:
   - Create an account at ngrok.com
   - Get your authentication token from the ngrok dashboard
   - Add your token to the .env file in the src directory
5. Run the appropriate script for your operating system
