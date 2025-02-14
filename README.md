# n8n Setup Scripts

This repository contains scripts to quickly set up and run n8n, the workflow automation tool, using Docker.

*   useful hands-on tutorial: https://docs.n8n.io/try-it-out/longer-introduction/#step-four-add-the-nasa-node-and-set-up-credentials
*   (different) video tutorial: https://www.youtube.com/watch?v=1MwSoB0gnM4

![image](https://github.com/user-attachments/assets/658f2811-c5fd-4cdb-af09-5d50f349fc10)

## Contents

*   `run_n8n_MAC.sh`: A shell script for macOS to run n8n in Docker.
*   `run_n8n_WINDOWS.ps1`: A PowerShell script for Windows to run n8n in Docker.
*   `test_webhook.sh`: A shell script to send a test webhook to an n8n instance.

## Usage

### Prerequisites

*   Docker installed on your system.
    *   Install from: https://www.docker.com/products/docker-desktop/
    *   You do not need to sign up for an account (though a personal account is free). You can just download the installer if you scroll below the fold.

### Installation

1.  Go to the [Releases page](https://github.com/cristos-codence/docker_n8nSetup/releases) of this repository.
2.  Download the latest release ZIP file (e.g., `docker_n8nSetup-v1.0.0.zip`).
3.  Unzip the downloaded file into a folder on your computer.

### Running n8n

1.  **macOS**:
    *   Open your terminal.
    *   Navigate to the directory containing `run_n8n_MAC.sh`.
    *   Make the script executable: `chmod +x run_n8n_MAC.sh`
    *   Run the script: `./run_n8n_MAC.sh`

2.  **Windows**:
    *   Open PowerShell.
    *   Navigate to the directory containing `run_n8n_WINDOWS.ps1`.
    *   Run the script: `.\run_n8n_WINDOWS.ps1`

### Testing Webhooks

To test your n8n webhook:

1.  Ensure n8n is running.
2.  Create a new workflow with a `Webhook` trigger in n8n.
3.  Copy the webhook URL from that node to your clipboard.
4.  Open `test_webhook.sh` in a text editor and update the `URL` variable with the URL from your clipboard.
5.  Open your terminal.
6.  Navigate to the directory containing `test_webhook.sh`.
7.  Make the script executable: `chmod +x test_webhook.sh`
8.  Run the script: `./test_webhook.sh`

This will send a sample POST request to the specified webhook URL.

## Notes

*   The scripts assume that Docker is already installed and configured on your system.
*   The scripts use a persistent volume named `n8n_data` to store n8n data.
*   The n8n instance will be accessible at `http://localhost:5678`.
