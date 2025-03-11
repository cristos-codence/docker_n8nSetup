#!/bin/bash

# Create dist directory if it doesn't exist
mkdir -p ./dist

# Delete existing zip files
rm -f ./dist/*

# Change directory to src
cd src || exit 1

# Create a single release zip with all files except .env
find . -type f -not -name ".env" | zip ../dist/n8n_setup_scripts.zip -@

# Change directory back to the original directory
cd .. || exit 1

# Display contents of the zip file
echo "Created n8n_setup_scripts.zip containing:"
unzip -l ./dist/n8n_setup_scripts.zip
