# Project Brief: n8n Setup Scripts

## Overview
The n8n Setup Scripts project provides a simplified way to deploy and run n8n (a workflow automation tool) using Docker. It aims to reduce the technical barriers for users who want to quickly get started with n8n by providing ready-to-use Docker configuration files and deployment scripts for both Windows and macOS.

## Core Requirements
1. Provide a streamlined setup process for n8n using Docker
2. Support both Windows and macOS operating systems
3. Handle different deployment scenarios (with/without Traefik integration)
4. Maintain persistence of n8n data between container restarts
5. Keep configurations updated with the latest stable n8n versions
6. Provide clear documentation for users of varying technical skill levels

## Goals
1. Enable users to set up n8n with minimal technical knowledge
2. Ensure cross-platform compatibility
3. Provide a robust and reliable configuration that works consistently
4. Support advanced setups (like Traefik integration) for more experienced users
5. Maintain updated scripts and configurations as n8n evolves

## Scope
- Docker configuration files for n8n
- Shell scripts for macOS deployment
- PowerShell scripts for Windows deployment
- Traefik integration support
- Documentation and usage instructions
- Regular updates to maintain compatibility with latest n8n versions

## Non-Goals
- Custom n8n development or modifications
- Support for non-Docker deployments
- Operating system support beyond Windows and macOS
- Extensive customization options beyond what's provided in the Docker configuration
