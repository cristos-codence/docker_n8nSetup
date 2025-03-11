# Release Notes - mvp-0.4.1

## Summary

This release enhances the ngrok integration introduced in 0.4.0, adding support for custom subdomains and improved configuration. The n8n instance is now automatically configured to use the ngrok domain for webhooks and UI access, providing a seamless experience when accessing your workflows from the internet.

## Key Changes

- **Enhanced ngrok Integration:**
    - Added support for custom ngrok subdomains via NGROK_DOMAIN environment variable
    - Configured n8n environment variables to use ngrok domain for webhooks and UI
    - Implemented shared network between n8n and ngrok containers
    - Created custom startup parameters for ngrok container

- **Script Improvements:**
    - Added validation for NGROK_DOMAIN environment variable
    - Enhanced error messaging for configuration issues
    - Improved user feedback with URL display in console output
    - Added more detailed logging for troubleshooting

- **Docker Configuration Updates:**
    - Updated docker-compose.yml with proper n8n environment variables
    - Configured network settings for improved container communication
    - Set proper protocol (https) for ngrok tunneling
    - Added necessary webhook and editor URL configurations

- **Documentation Additions:**
    - Updated README_NGROK.md with custom subdomain instructions
    - Added troubleshooting sections for common configuration issues
    - Expanded environment variable documentation
    - Included webhook configuration details

## Technical Details

- **Docker Configuration Changes:**
    - Added custom network (n8n-network) for container communication
    - Updated ngrok command to use --domain parameter for custom subdomain
    - Configured n8n environment variables:
      - N8N_HOST: Set to ngrok domain
      - N8N_PROTOCOL: Set to https
      - N8N_EDITOR_BASE_URL: Full ngrok URL
      - N8N_WEBHOOK_URL: Full ngrok URL

- **Script Enhancements:**
    - Added validation for both NGROK_AUTHTOKEN and NGROK_DOMAIN variables
    - Enhanced log output with URL display at script completion
    - Improved error handling with descriptive messages
    - Updated both macOS and Windows scripts for consistency

## Notes

- The n8n instance continues to be accessible at `http://localhost:5678` by default
- With ngrok configured, n8n will be accessible at `https://your-subdomain.ngrok-free.app`
- Both ngrok authentication token and domain must be configured in the .env file
- Webhooks will automatically use the ngrok domain when triggered
- The editor UI is configured to use the ngrok domain for proper functionality

## Upgrade Notes

If upgrading from a previous version:
1. Stop any running n8n containers
2. Download the latest release
3. Replace all existing files with the new versions
4. For ngrok functionality:
   - Create an account at ngrok.com
   - Get your authentication token from the ngrok dashboard
   - Add your token to the .env file in the src directory
   - Set your desired subdomain in the NGROK_DOMAIN field
5. Run the appropriate script for your operating system
