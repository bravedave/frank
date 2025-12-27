# Shell Docker Environment

A comprehensive Docker development environment featuring MariaDB and FrankenPHP for rapid PHP application development.

## Installation

### Option 1: Download ZIP (Recommended)
1. Download this repository as a ZIP file from GitHub
2. Extract to your desired project directory
3. Open terminal in the extracted folder
4. Continue with [Getting Started](#getting-started)

### Option 2: Git Clone
```bash
# Clone the repository
git clone <repository-url> your-project-name
cd your-project-name

# Remove git history to start fresh
rm -rf .git

# Initialize your own git repository (optional)
git init
```

### Prerequisites
- [Docker](https://www.docker.com/get-started) installed and running
- [Docker Compose](https://docs.docker.com/compose/install/) (included with Docker Desktop)

## Overview

This repository provides a ready-to-use shell Docker environment that combines the power of MariaDB database server with FrankenPHP - a modern application server that's truly a Swiss Army knife for PHP developers. FrankenPHP offers exceptional performance with built-in HTTP/2, HTTP/3, and real-time features, making it perfect for both development and production environments.

## What's Included

### MariaDB Server
- Latest MariaDB image with persistent data storage
- Custom server configuration via `my.server.cnf`
- Environment-based configuration for database credentials
- Persistent data volumes mapped to `./workspace/mariadb`

### FrankenPHP Application Server
- Built on the official `dunglas/frankenphp` image
- Pre-installed MariaDB connector (mysqli extension)
- **Composer** - PHP dependency manager pre-installed and ready to use
- Git, zip, and unzip utilities included
- HTTP/80, HTTPS/443, and HTTP/3 (443/udp) ports exposed
- Custom Caddy configuration support

## Directory Structure

```
├── app/                    # Your application development folder
│   └── public/            # Publicly exposed web files
├── workspace/             # Persistent data and configuration
│   ├── mariadb/          # MariaDB data directory
│   └── root/             # Container root directory mapping
├── Caddyfile.d/          # Custom Caddy server configuration
├── docker-compose.yaml   # Docker Compose configuration
├── Dockerfile           # FrankenPHP container build configuration
└── my.server.cnf       # MariaDB server configuration
```

## Key Features

- **Development-Ready**: The `app/` folder is mapped for live development - changes reflect immediately
- **Web Root**: The `public/` directory serves as your publicly accessible web folder
- **Database Integration**: MariaDB connector pre-installed and ready to use
- **Persistent Storage**: Database and configuration files persist across container restarts
- **Modern Standards**: HTTP/2, HTTP/3, and HTTPS support out of the box

## Getting Started

1. Complete the [Installation](#installation) steps above
2. Run the setup script to create your environment:
   ```bash
   ./setup-environment.sh
   ```
   This script will:
   - Generate a secure MySQL password
   - Create the `.env` file with database configuration
   - Set up the workspace directory structure
   - Create `.my.cnf` for easy database access from within containers
   - Create `app/public/` directory with a default `index.php` file
   - Set up `app/.vscode/settings.json` with SQLTools database connection for VS Code

3. Build and start the containers:
   ```bash
   docker compose up -d --build
   ```
4. Access your application at `http://app.localhost` or `https://app.localhost`

## Environment Configuration

The `setup-environment.sh` script automatically creates:

- **`.env` file**: Contains all database credentials and configuration
- **`workspace/root/.my.cnf`**: MySQL client configuration for easy database access from containers
- **Database setup**: Creates `cmsx` database with secure random password
- **`app/public/index.php`**: Default PHP file with "Hello World" message and phpinfo() output

After setup, you can connect to the database from within the FrankenPHP container using the MySQL client without needing to specify credentials.

## Development Workflow

Place your PHP files in the `app/public/` directory and start coding! The environment automatically serves your files through FrankenPHP with full MariaDB connectivity available.

### Using Composer

Composer is pre-installed in the FrankenPHP container. You can use it from within the container:

```bash
# Enter the container
docker compose exec frankenphp bash

# Use composer commands
composer init
composer require vendor/package
composer install
```

Your `composer.json` and `vendor/` directory should be placed in the `app/` folder to persist across container restarts.

## Acknowledgments

Special thanks to the amazing projects that make this environment possible:

- **[FrankenPHP](https://frankenphp.dev/)** - The modern PHP application server that revolutionizes PHP development
- **[MariaDB](https://mariadb.org/)** - The reliable, high-performance database server
- **[Docker](https://www.docker.com/)** - The containerization platform that makes this environment portable and consistent
- **[Caddy](https://caddyserver.com/)** - The powerful web server with automatic HTTPS (integrated into FrankenPHP)
- **[Composer](https://getcomposer.org/)** - The PHP dependency manager for package management
- **[PHP](https://www.php.net/)** - The versatile scripting language powering web development

---

_Jump into the container with VSCode and start Developin !!_