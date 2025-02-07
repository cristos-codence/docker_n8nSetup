# Check if Docker Desktop is installed
if (-not (Get-Package -Name "docker-desktop" -ErrorAction SilentlyContinue)) {
  Write-Host "Docker Desktop is not installed. Installing with Chocolatey..."
  choco install docker-desktop -y
} else {
  # Check if Chocolatey is installed
  if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Host "Chocolatey is not installed. Installing..."
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    Write-Host "Please close and reopen your PowerShell session to complete the Chocolatey installation."
    exit
  }
}

# Check if Docker is running
try {
  docker info | Out-Null
  Write-Host "Docker is running."

  # Check if the n8n_data volume exists
  if (docker volume inspect n8n_data -ErrorAction SilentlyContinue) {
    Write-Host "n8n_data volume exists."
  } else {
    Write-Host "n8n_data volume does not exist. Creating it..."
    docker volume create n8n_data
  }

  # Run n8n using the n8n_data volume for persistence
  docker pull n8nio/n8n:latest
  docker run -it --rm `
    --name n8n `
    -p 5678:5678 `
    -v n8n_data:/home/node/.n8n `
    -e NODEJS_PREFER_IPV4=true `
    # -e DEBUG=* `
    n8nio/n8n `
    start --tunnel

} catch {
  Write-Host "Docker is not running. Please start Docker and try again."
  exit 1
}
