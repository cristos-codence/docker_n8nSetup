#!/bin/bash

# Delete existing zip files
rm -f ./dist/run_n8n_files.zip
rm -f ./dist/docker-compose.zip

# Change directory to src
cd src || exit 1

# Create zip files
zip ../dist/run_n8n_files.zip run_n8n_MAC.sh run_n8n_WIN.ps1
zip ../dist/docker-compose.zip docker-compose.yml docker-compose.override.yml run_compose_MAC.sh run_compose_WIN.ps1

# Change directory back to the original directory
cd .. || exit 1
