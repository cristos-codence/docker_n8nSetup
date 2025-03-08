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

### 1. Get an ngrok Authentication Token

1. Create an account at [ngrok.com](https://ngrok.com) (free tier available)
2. Go to [the ngrok dashboard](https://dashboard.ngrok.com/get-started/your-authtoken)
3. Copy your authtoken

### 2. Configure Your Environment

1. Navigate to the `src` directory
2. The startup script will create an `.env` file for you if it doesn't exist
3. Edit the `.env` file and replace `your_ngrok_authtoken_here` with your actual ngrok authtoken:

```
NGROK_AUTHTOKEN=your_actual_token_here
```

### 3. Start n8n with ngrok

Run the appropriate script for your platform:

- macOS/Linux: `./run_compose_MAC.sh`
- Windows: `./run_compose_WIN.ps1`

### 4. Access Your n8n Instance

When the containers start, the script will show logs from both n8n and ngrok. Look for a URL in the ngrok logs that looks like:

```
t=2023-03-07T12:34:56+0000 lvl=info msg="started tunnel" obj=tunnels name=http addr=http://n8n:5678 url=https://1a2b3c4d.ngrok.io
```

The URL (`https://1a2b3c4d.ngrok.io` in this example) is your public ngrok URL. You can access your n8n instance using this URL from anywhere.

## Notes

- **Free vs Paid**: The free tier of ngrok has limitations, including:
  - Session length (restarts after 2 hours)
  - Random URLs (paid plans allow custom domains)
  - Limited concurrent connections

- **External Access**: ngrok provides a simple method for external access without port forwarding or complex network configuration, making it ideal for quick deployments and testing.

- **Security Considerations**: When exposing your n8n instance publicly, ensure you:
  - Set up proper authentication in n8n
  - Use strong passwords
  - Consider restricting access to sensitive workflows

## Troubleshooting

- **ngrok Not Working**: Check the ngrok logs with `docker logs n8n-ngrok`. Ensure your authtoken is correctly set in the `.env` file.
  
- **Can't Connect to URL**: Ensure your n8n container is running correctly with `docker logs n8n`. The ngrok URL should redirect to your n8n instance.

- **URL Changes After Restart**: This is normal with the free tier of ngrok. For persistent URLs, consider upgrading to a paid plan.
