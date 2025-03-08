#!/bin/bash

cd $(dirname "$0") || exit 1 # Change directory to the script's directory

# Check for .env file
if [ -f .env ]; then
  echo "Loading environment variables from .env file."
else
  echo "No .env file found. Creating from example..."
  if [ -f .env.example ]; then
    cp .env.example .env
    echo "Created .env file from .env.example. Please edit it to add your ngrok authtoken."
    echo "   Get your authtoken from https://dashboard.ngrok.com/get-started/your-authtoken"
  else
    echo "WARNING: No .env.example file found. ngrok service may not work correctly."
    touch .env
  fi
fi

# Check if ngrok authtoken is set
NGROK_TOKEN=$(grep NGROK_AUTHTOKEN .env | cut -d '=' -f2)
if [[ -z "$NGROK_TOKEN" ]] || [[ "$NGROK_TOKEN" = "your_ngrok_authtoken_here" ]]; then
  echo "⚠️  NGROK_AUTHTOKEN not properly set in .env file. The ngrok service will not work correctly."
  echo "   Get your authtoken from https://dashboard.ngrok.com/get-started/your-authtoken"
  echo "   and add it to the .env file."
  exit 1
else
  echo "✅ NGROK_AUTHTOKEN is set. ngrok service will be available."
fi

# Start containers
echo "Starting n8n with ngrok..."
docker compose pull
docker compose -p n8n down
docker compose -p n8n up -d

# Show logs
echo "n8n container logs:"
docker logs n8n --tail 10

echo ""
echo "ngrok container logs:"
docker logs n8n-ngrok --tail 5
