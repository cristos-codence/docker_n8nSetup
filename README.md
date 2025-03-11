# n8n Setup Scripts

This repository contains scripts to quickly set up and run n8n, the workflow automation tool, using Docker.

*   useful hands-on tutorial: https://docs.n8n.io/try-it-out/longer-introduction/#step-four-add-the-nasa-node-and-set-up-credentials
*   (different) video tutorial: https://www.youtube.com/watch?v=1MwSoB0gnM4

![image](https://github.com/cristos-codence/docker_n8nSetup/assets/658f2811-c5fd-4cdb-af09-5d50f349fc10)

## Installation

1.  Install Docker Desktop:

    <a href="https://www.docker.com/products/docker-desktop/" style="display: inline-block; padding: 10px 20px; margin-bottom: 10px; font-size: 16px; font-weight: bold; text-align: center; text-decoration: none; background-color: #007BFF; color: white; border-radius: 5px;">
        Download Docker Desktop
    </a><br/>

2.  Sign up for a free ngrok account:

    <a href="https://ngrok.com/" style="display: inline-block; padding: 10px 20px; margin-bottom: 10px; font-size: 16px; font-weight: bold; text-align: center; text-decoration: none; background-color: #1F1E37; color: white; border-radius: 5px;">
        Create ngrok Account
    </a><br/>
    
    - Get your authtoken from the [ngrok dashboard](https://dashboard.ngrok.com/get-started/your-authtoken)
    - Set up your free static domain at [dashboard.ngrok.com/cloud-edge/domains](https://dashboard.ngrok.com/cloud-edge/domains)

3.  Download the latest release ZIP file:

    <a href="https://github.com/cristos-codence/docker_n8nSetup/releases/download/v1.0.1/n8n_setup_scripts.zip" style="display: inline-block; padding: 10px 20px; margin-bottom: 10px; font-size: 16px; font-weight: bold; text-align: center; text-decoration: none; background-color: #007BFF; color: white; border-radius: 5px;">
        Download Docker Compose Files for n8n
    </a>

4.  Unzip the downloaded file into a folder on your computer.

5.  Configure your ngrok credentials in the `.env` file (created automatically by the setup script if it doesn't exist).

6.  Run the setup script for your operating system.

7.  Access n8n through your ngrok URL or locally at `http://localhost:5678`.

    <a href="http://localhost:5678" style="display: inline-block; padding: 10px 20px; margin-bottom: 10px; font-size: 16px; font-weight: bold; text-align: center; text-decoration: none; background-color: #4CAF50; color: white; border-radius: 5px;">
        Open locally-hosted n8n
    </a>

## Contents of n8n_setup_scripts.zip

*   `run_compose_MAC.sh`: A shell script for macOS to run n8n using Docker Compose.
*   `run_compose_WIN.ps1`: A PowerShell script for Windows to run n8n using Docker Compose.
*   `docker-compose.yml`: A Docker Compose file for running n8n.
*   `README_NGROK.md`: Instructions for using ngrok with n8n.
*   `.env.example`: Example environment variables.

## Usage

### Prerequisites

*   Docker installed on your system.
    *   Install from: https://www.docker.com/products/docker-desktop/
    *   You do not need to sign up for an account (though a personal account is free). You can just download the installer if you scroll below the fold.

*   ngrok account (required as of v1.0.0).
    *   Sign up at: https://ngrok.com/ (free tier available)
    *   You'll need an authentication token and a static domain
    *   See the "Setting Up ngrok with n8n" section below for details

### Running n8n

#### Recommended: Option 1: Using Docker Compose

This method is the preferred way to run n8n, as it provides a more robust and configurable deployment.

1.  Download the `n8n_setup_scripts.zip` file from the [Releases page](https://github.com/cristos-codence/docker_n8nSetup/releases).
2.  Unzip the `n8n_setup_scripts.zip` file into a folder on your computer.
3.  **macOS**:
    *   Open your terminal.
        *   You can find the Terminal application in `/Applications/Utilities/Terminal.app`.
        *   Alternatively, you can use Spotlight search (Command + Space) and type "terminal".
    *   Navigate to the directory containing `run_compose_MAC.sh`.
        *   Use the `cd` command followed by the path to the directory. For example, if the files are in your Downloads folder, type `cd ~/Downloads/n8n_setup_scripts` and press Enter.
    *   Make the script executable:
        *   Type `chmod +x run_compose_MAC.sh` and press Enter. This command gives the script permission to run.
    *   Run the script:
        *   Type `./run_compose_MAC.sh` and press Enter. This will start n8n using Docker Compose.

    **Windows**:
    *   Open PowerShell.
        *   You can find PowerShell by searching for it in the Start menu.
    *   Navigate to the directory containing `run_compose_WIN.ps1`.
        *   Use the `cd` command followed by the path to the directory. For example, if the files are in your Downloads folder, type `cd ~\Downloads\n8n_setup_scripts` and press Enter.
    *   Run the script:
        *   Type `powershell.exe -executionpolicy bypass .\run_compose_WIN.ps1` and press Enter. This will start n8n using Docker Compose.
4.  Open your browser and navigate to http://localhost:5678 to access n8n.

#### Option 2: Using Shell/PowerShell Scripts

This method is deprecated and no longer supported. Please use Docker Compose.

## Setting Up ngrok with n8n

ngrok creates secure tunnels from public URLs to your locally running services, making your n8n instance accessible from anywhere without complex network configuration.

### Benefits of Using ngrok

- **Public Access**: Access your n8n workflows from anywhere
- **No Port Forwarding**: No need to configure your router
- **Secure**: Encrypted connections
- **Persistent URLs**: Use static domains that don't change between sessions

### Setup Instructions

1. **Get an ngrok Authentication Token and Static Domain**:
   - Create an account at [ngrok.com](https://ngrok.com) (free tier available)
   - Go to [the ngrok dashboard](https://dashboard.ngrok.com/get-started/your-authtoken) to get your authtoken
   - Navigate to [dashboard.ngrok.com/cloud-edge/domains](https://dashboard.ngrok.com/cloud-edge/domains) to set up your free static domain
   - Make note of your full domain name (e.g., `myapp.ngrok-free.app`)

2. **Configure Your Environment**:
   - Navigate to the `src` directory
   - The startup script will create an `.env` file for you if it doesn't exist
   - Edit the `.env` file and add your ngrok credentials:
     ```
     NGROK_AUTHTOKEN=your_actual_token_here
     NGROK_DOMAIN=your-domain.ngrok-free.app
     ```

3. **Start n8n with ngrok**:
   - Run the appropriate script for your platform (same as normal startup)
   - The script will now start both n8n and ngrok containers

4. **Access Your n8n Instance**:
   - Your n8n instance will be accessible at your ngrok URL: `https://your-domain.ngrok-free.app`
   - This URL is accessible from anywhere with internet access

### Troubleshooting

- **ngrok Not Working**: Check the ngrok logs with `docker logs n8n-ngrok`. Ensure your authtoken is correctly set in the `.env` file.
- **Can't Connect to URL**: Ensure your n8n container is running correctly with `docker logs n8n`.
- **Webhook Issues**: The docker-compose.yml automatically configures n8n to use your ngrok domain for webhooks.

## Notes

*   The scripts assume that Docker is already installed and configured on your system.
*   The scripts use a local directory `$HOME/Documents/n8n_docker_files` to store n8n data.
*   The n8n instance will be accessible at `http://localhost:5678` *unless* you are using Traefik, in which case it will be accessible through your Traefik configuration, or you are using ngrok, in which case it will be accessible through your ngrok domain.
