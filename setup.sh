#!/bin/bash

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
  echo "Docker is not installed. Installing with Homebrew..."
  if ! command -v brew &> /dev/null; then
    echo "Homebrew is not installed. Please install Homebrew first."
    exit 1
  fi
  brew install docker
  brew install --cask docker # Install Docker Desktop as well
fi

# Check if Docker is running
if docker info > /dev/null 2>&1; then
  echo "Docker is running."

  # Check if the n8n_data volume exists
  if docker volume inspect n8n_data > /dev/null 2>&1; then
    echo "n8n_data volume exists."
  else
    echo "n8n_data volume does not exist. Creating it..."
    docker volume create n8n_data
  fi

  # Run n8n using the n8n_data volume for persistence
  docker run -it --rm \
    --name n8n \
    -p 5678:5678 \
    -v n8n_data:/home/node/.n8n \
    n8nio/n8n

else
  echo "Docker is not running. Please start Docker and try again."
  exit 1
fi
