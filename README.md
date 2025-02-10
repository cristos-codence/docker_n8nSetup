# n8n Setup Scripts

This repository contains scripts to quickly set up and run n8n, the workflow automation tool, using Docker.

## Contents

*   `run_n8n_MAC.sh`: A shell script for macOS to run n8n in Docker.
*   `run_n8n_WINDOWS.ps1`: A PowerShell script for Windows to run n8n in Docker.
*   `test_webhook.sh`: A shell script to send a test webhook to an n8n instance.

## Usage

### Prerequisites

*   Docker installed on your system.

### Running n8n

1.  **macOS**:
    *   Open your terminal.
    *   Navigate to the directory containing `run_n8n_MAC.sh`.
    *   Run the script: `bash run_n8n_MAC.sh`

2.  **Windows**:
    *   Open PowerShell.
    *   Navigate to the directory containing `run_n8n_WINDOWS.ps1`.
    *   Run the script: `.\run_n8n_WINDOWS.ps1`

### Testing Webhooks

To test your n8n webhook:

1.  Ensure n8n is running.
2.  Open your terminal.
3.  Navigate to the directory containing `test_webhook.sh`.
4.  Run the script: `bash test_webhook.sh`

This will send a sample POST request to the specified webhook URL.

## Notes

*   The scripts assume that Docker is already installed and configured on your system.
*   The scripts use a persistent volume named `n8n_data` to store n8n data.
*   The n8n instance will be accessible at `http://localhost:5678`.
