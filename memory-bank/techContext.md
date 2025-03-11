# Technical Context: n8n Setup Scripts

## Technologies Used

### Core Technologies
- **Docker**: Container platform used for packaging and running n8n
- **Docker Compose**: Tool for defining and running multi-container Docker applications
- **n8n**: Workflow automation tool (n8nio/n8n:stable Docker image)
- **Bash**: Scripting language used for macOS shell scripts
- **PowerShell**: Scripting language used for Windows automation

### Optional Integrations
- **Traefik**: Modern HTTP reverse proxy and load balancer for microservices

## Development Environment

### Requirements
- Docker Desktop installed and running on the user's machine
- Basic terminal/command-line knowledge
- Git (for contributors)

### Directory Structure
```
/
├── README.md                   # Main documentation
├── Release_Notes.md            # Version update information
├── build.sh                    # Build script
├── push.sh                     # Deployment script
├── test.sh                     # Testing script
└── src/                        # Source directory
    ├── docker-compose.yml      # Main Docker Compose configuration
    ├── docker-compose.traefik.yml # Traefik-specific configuration
    ├── run_compose_MAC.sh      # macOS deployment script
    ├── run_compose_WIN.ps1     # Windows deployment script
    ├── run_n8n_MAC.sh          # Alternative macOS script
    └── run_n8n_WIN.ps1         # Alternative Windows script
```

## Technical Constraints

### Deployment Constraints
- Requires Docker to be installed and properly configured
- Port 5678 must be available for the default n8n web interface
- Host system must support running containers
- Sufficient disk space for Docker images and n8n data persistence

### Cross-Platform Compatibility
- Scripts must function correctly on both Windows and macOS
- File paths and commands must be platform-aware
- Environment detection needs to work consistently across platforms

### Persistence Constraints
- Data must be preserved between container restarts
- Standard location for data storage ($HOME/Documents/n8n_docker_files)
- Permissions must allow Docker to write to the persistence directory

## Dependencies

### Runtime Dependencies
- **Docker Engine**: Required for running containers
- **n8n Docker Image**: n8nio/n8n:stable from Docker Hub
- **Network Connectivity**: For pulling Docker images

### Optional Dependencies
- **Traefik**: For advanced proxy-based deployments
- **traefik_net** Docker network: Created automatically if using Traefik integration

## Configuration Parameters

### Docker Compose Configuration
- Container name and hostname: n8n
- Image: n8nio/n8n:stable
- Restart policy: unless-stopped
- Volume mapping: $HOME/Documents/n8n_docker_files:/home/node/.n8n
- Environment variables:
  - Timezone configuration
  - Logging settings
  - Database configuration (SQLite)
  - Performance and concurrency settings
  - Network and security settings

### Environment Variables
Key environment variables that control n8n behavior:
- **GENERIC_TIMEZONE**: Sets the timezone (default: America/New_York)
- **N8N_LOG_LEVEL**: Controls logging verbosity (default: info)
- **EXECUTIONS_DATA_PRUNE**: Controls automatic cleanup (default: true)
- **N8N_HOST**: Host configuration (default: localhost)
