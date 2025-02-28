# Release Notes - mvp-0.3.5

## Summary

This release builds upon the improvements introduced in mvp-0.3.4, focusing on further enhancing the Docker configuration and addressing additional Traefik integration issues. The documentation has been updated to reflect these changes, and several optimizations have been made to improve the overall stability and performance of the n8n Docker setup.

## Key Changes

- **Docker Configuration Refinements:** 
    - Updated n8n Docker image to latest stable version
    - Fine-tuned environment variables for better performance
    - Improved container networking configuration

- **Traefik Integration Enhancements:**
    - Resolved remaining connectivity issues with Traefik
    - Improved hostname resolution and routing
    - Enhanced proxy configuration for better reliability

- **Script Improvements:**
    - Further optimized container cleanup procedures
    - Enhanced error handling and reporting
    - Improved cross-platform compatibility

- **Documentation Updates:**
    - Added more detailed troubleshooting steps
    - Updated installation instructions for clarity
    - Included additional configuration examples

## Technical Details

- **Docker Configuration Changes:**
    - Optimized port mapping configuration
    - Updated environment variables for improved stability
    - Enhanced network configuration for better integration

- **Script Enhancements:**
    - Improved container management logic
    - Better error handling for edge cases
    - Enhanced path handling across different environments

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
