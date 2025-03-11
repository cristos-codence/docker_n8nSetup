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
  echo "   1. Sign up for a free ngrok account at https://dashboard.ngrok.com/signup"
  echo "   2. Get your authtoken from https://dashboard.ngrok.com/get-started/your-authtoken"
  echo "   3. Add your token to the .env file"
  exit 1
else
  echo "✅ NGROK_AUTHTOKEN is set. ngrok service will be available."
fi

# Check if ngrok domain is set
NGROK_DOMAIN=$(grep NGROK_DOMAIN .env | cut -d '=' -f2)
if [[ -z "$NGROK_DOMAIN" ]] || [[ "$NGROK_DOMAIN" = "your-subdomain" ]] || [[ "$NGROK_DOMAIN" = "your-ngrok-domain" ]] || [[ "$NGROK_DOMAIN" = "your-domain.ngrok-free.app" ]]; then
  echo "⚠️  NGROK_DOMAIN not properly set in .env file. The ngrok service will not work correctly."
  echo "   Each ngrok account gets a free static domain that doesn't change between sessions:"
  echo "   1. Sign in to your ngrok dashboard at https://dashboard.ngrok.com"
  echo "   2. Go to 'Cloud Edge' > 'Domains' or visit: https://dashboard.ngrok.com/cloud-edge/domains"
  echo "   3. Get your free static domain (looks like something.ngrok-free.app)"
  echo "   4. Enter the FULL domain including the suffix (e.g., 'myapp.ngrok-free.app')"
  echo "   5. Add this domain to your .env file"
  exit 1
else
  echo "✅ NGROK_DOMAIN is set to: ${NGROK_DOMAIN}"
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
docker logs n8n-ngrok --tail 10
echo ""
echo "👉 Your n8n instance will be available at: https://${NGROK_DOMAIN}"
echo "   Access n8n through this URL for proper webhook functionality."
