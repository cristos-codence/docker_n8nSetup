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

2.  Download the latest release ZIP file:

    <a href="https://github.com/cristos-codence/docker_n8nSetup/releases/download/latest/docker-compose.zip" style="display: inline-block; padding: 10px 20px; margin-bottom: 10px; font-size: 16px; font-weight: bold; text-align: center; text-decoration: none; background-color: #4CAF50; color: white; border-radius: 5px;">
        Download Docker Compose Files for n8n
    </a>

3.  Unzip the downloaded file into a folder on your computer.

4.  Run the setup script for your operating system.

## Contents

### run_n8n_files.zip
*   `run_n8n_MAC.sh`: A shell script for macOS to run n8n in Docker.
*   `run_n8n_WINDOWS.ps1`: A PowerShell script for Windows to run n8n in Docker.

### docker-compose.zip
*   `run_compose.sh`: A shell script to run n8n using Docker Compose.
*   `docker-compose.yml`: A Docker Compose file for running n8n.
*   `docker-compose.override.yml`: A Docker Compose file that overrides the port mapping when Traefik is used.

## Usage

### Prerequisites

*   Docker installed on your system.
    *   Install from: https://www.docker.com/products/docker-desktop/
    *   You do not need to sign up for an account (though a personal account is free). You can just download the installer if you scroll below the fold.

### Running n8n

#### Recommended: Option 1: Using Docker Compose

This method is the preferred way to run n8n, as it provides a more robust and configurable deployment.

1.  Download the `docker-compose.zip` file from the [Releases page](https://github.com/cristos-codence/docker_n8nSetup/releases).
2.  Unzip the `docker-compose.zip` file into a folder on your computer.
3.  **macOS**:
    *   Open your terminal.
    *   Navigate to the directory containing `run_compose.sh`.
    *   Make the script executable: `chmod +x run_compose.sh`
    *   Run the script: `./run_compose.sh`

    **Windows**:
    *   Open PowerShell.
    *   Navigate to the directory containing `run_compose_WIN.ps1`.
    *   Run the script: `.\run_compose_WIN.ps1`

    **Note:** If you are using Traefik, the `docker-compose.override.yml` file will automatically detect it and remove the port mapping from the n8n service.

#### Option 2: Using Shell/PowerShell Scripts

This method is provided for convenience, but Docker Compose is recommended for most users.

1.  **macOS**:
    *   Open your terminal.
    *   Navigate to the directory containing `run_n8n_MAC.sh`.
    *   Make the script executable: `chmod +x run_n8n_MAC.sh`
    *   Run the script: `./run_n8n_MAC.sh`

2.  **Windows**:
    *   Open PowerShell.
    *   Navigate to the directory containing `run_n8n_WINDOWS.ps1`.
    *   Run the script: `.\run_n8n_WINDOWS.ps1`

## Notes

*   The scripts assume that Docker is already installed and configured on your system.
*   The scripts use a local directory `./n8n-data` to store n8n data.
*   The n8n instance will be accessible at `http://localhost:5678` *unless* you are using Traefik, in which case it will be accessible through your Traefik configuration.
