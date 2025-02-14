#!/bin/bash

zip ./dist/run_n8n_files.zip ./src/run_n8n_MAC.sh ./src/run_n8n_WINDOWS.ps1
zip ./dist/docker-compose.zip ./src/docker-compose.yml ./src/run_compose.sh

