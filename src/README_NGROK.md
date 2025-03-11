# Using ngrok with n8n

This guide explains how to use ngrok for secure tunneling with your n8n instance.

## What is ngrok?

ngrok is a service that creates secure tunnels from public URLs to your locally running services. With ngrok, you can make your local n8n instance accessible from the internet without port forwarding or complex network configuration.

## Benefits

- **Public Access**: Access your n8n workflows from anywhere
- **No Port Forwarding**: No need to configure your router
- **Secure**: Encrypted connections
- **Easy to Use**: Simple setup with Docker

## Setup Instructions

### 1. Get an ngrok Authentication Token and Static Domain

1. Create an account at [ngrok.com](https://ngrok.com) (free tier available)
2. Go to [the ngrok dashboard](https://dashboard.ngrok.com/get-started/your-authtoken) to get your authtoken
3. Copy your authtoken

#### Setting Up Your Free Static Domain

All ngrok accounts now get access to a free static domain that doesn't change between tunnel sessions. To set up yours:

1. Sign in to your ngrok dashboard at [dashboard.ngrok.com](https://dashboard.ngrok.com)
2. Navigate to the Domains section in the Cloud Edge menu or go directly to [dashboard.ngrok.com/cloud-edge/domains](https://dashboard.ngrok.com/cloud-edge/domains)
3. You should see your free static domain (it will look like `something.ngrok-free.app`)
4. If you don't see a domain, you can create one by clicking "New Domain" and following the prompts
5. Make note of your full domain name (e.g., `myapp.ngrok-free.app`) - you'll need the entire domain including the suffix

Using a static domain provides several benefits:
- Your URL will remain consistent across restarts
- Webhook endpoints won't need to be reconfigured each time
- Users and services can bookmark a persistent URL

### 2. Configure Your Environment

1. Navigate to the `src` directory
2. The startup script will create an `.env` file for you if it doesn't exist
3. Edit the `.env` file and replace `your_ngrok_authtoken_here` with your actual ngrok authtoken
4. Set your full ngrok domain in the `NGROK_DOMAIN` field:

```
NGROK_AUTHTOKEN=your_actual_token_here
NGROK_DOMAIN=your-domain.ngrok-free.app
```

Note: Your n8n instance will be accessible at the full domain you specified

### 3. Start n8n with ngrok

Run the appropriate script for your platform:

- macOS/Linux: `./run_compose_MAC.sh`
- Windows: `./run_compose_WIN.ps1`

### 4. Access Your n8n Instance

When the containers start, the script will show logs from both n8n and ngrok. Your n8n instance will be accessible at the URL shown at the end of the script output:

```
👉 Your n8n instance will be available at: https://your-domain.ngrok-free.app
```

This URL is your public ngrok URL. You can access your n8n instance using this URL from anywhere.

The n8n container is automatically configured to use this domain for webhooks and the editor interface, ensuring that all features work correctly through the tunnel.

## Notes

- **Free vs Paid Plans**:
  - All ngrok users (including free tier) get access to a static domain
  - Free tier has other limitations:
    - Limited concurrent connections
    - Rate limits on API usage
    - One static domain per account
  - Paid plans offer additional features like custom domains, more connections, and team management

- **External Access**: ngrok provides a simple method for external access without port forwarding or complex network configuration, making it ideal for quick deployments and testing.

- **Security Considerations**: When exposing your n8n instance publicly, ensure you:
  - Set up proper authentication in n8n
  - Use strong passwords
  - Consider restricting access to sensitive workflows

## Troubleshooting

- **ngrok Not Working**: Check the ngrok logs with `docker logs n8n-ngrok`. Ensure your authtoken is correctly set in the `.env` file.
  
- **Can't Connect to URL**: Ensure your n8n container is running correctly with `docker logs n8n`. The ngrok URL should redirect to your n8n instance.

- **Domain Issues**:
  - Make sure you're using the exact and complete domain assigned to your ngrok account
  - If you see "domain not found" errors, verify the domain exists in your ngrok dashboard
  - If you see "tunnel session error", your authtoken might be incorrect or expired

- **Webhook Issues**: Ensure n8n is properly configured to use the ngrok domain. The docker-compose.yml sets this automatically via environment variables.

- **Environment Variables**: The following n8n environment variables are automatically configured:
  - N8N_HOST: Set to your ngrok domain
  - N8N_PROTOCOL: Set to https
  - N8N_EDITOR_BASE_URL: Set to your full ngrok URL
  - N8N_WEBHOOK_URL: Set to your full ngrok URL
