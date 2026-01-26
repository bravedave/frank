#!/bin/bash

# Setup script for Frank Docker Environment
# Creates .env file and workspace configuration

echo "🚀 Setting up Frank Docker Environment..."

# Generate a unique MySQL password
MYSQL_PASSWORD=$(openssl rand -base64 32 | tr -d "=+/" | cut -c1-25)

# Create .env file with database configuration
cat > .env << EOF
# MariaDB Configuration
MYSQL_ROOT_PASSWORD=${MYSQL_PASSWORD}
MYSQL_DATABASE=cmsx
MYSQL_USER=cmsx_user
MYSQL_PASSWORD=${MYSQL_PASSWORD}
EOF

echo "✅ Created .env file with database configuration"

# Create workspace/root directory if it doesn't exist
mkdir -p workspace/root

# Create app/public directory if it doesn't exist
mkdir -p app/public

# Create app/src/data directory if it doesn't exist
mkdir -p app/src/data

# Create app/.vscode directory if it doesn't exist
mkdir -p app/.vscode

# Create .vscode/settings.json for SQLTools extension
cat > app/.vscode/settings.json << EOF
{
    "sqltools.useNodeRuntime": false,
    "sqltools.connections": [
        {
            "driver": "MariaDB",
            "name": "CMSX Database",
            "database": "cmsx",
            "username": "cmsx_user",
            "password": "${MYSQL_PASSWORD}",
            "server": "mariadb",
            "port": 3306
        }
    ]
}
EOF

echo "✅ Created app/.vscode/settings.json with database connection settings"

# Create default index.php file
cat > app/public/index.php << EOF
<?php
/*
 * Copyright (c) 2025 David Bray
 * Licensed under the MIT License. See LICENSE file for details.
*/

print '<div class="center"><br><h1>hello world from frank/index.php</h1><br></div>';
phpinfo(INFO_VARIABLES);
EOF

# Create app/src/data/db.json file
cat > app/src/data/db.json << EOF
{
  "db_type": "mariadb",
  "db_host": "mariadb",
  "db_name": "cmsx",
  "db_user": "cmsx_user",
  "db_pass": "${MYSQL_PASSWORD}"
}
EOF

# Create app/src/data/defaults.json file
cat > app/src/data/defaults.json << EOF
{
  "db_type": "mysql",
  "db_cache": "APC"
}
EOF

echo "✅ Created app/public/index.php with default content"

cp delta.example.md app/delta.md
echo "✅ Copied delta.example.md to app/delta.md"

# Create .my.cnf file for easy MySQL access
cat > workspace/root/.my.cnf << EOF
[client]
host=mariadb
user=root
password=${MYSQL_PASSWORD}
database=cmsx
EOF

echo "✅ Created workspace/root/.my.cnf for easy database access"
echo "✅ Setup complete!"
echo ""
echo "📋 Next steps:"
echo "   1. Run: docker compose up -d --build"
echo "   2. Access your app at: http://app.localhost"
echo "   3. Connect to database using credentials in workspace/root/.my.cnf"
echo ""
echo "🎉 Happy coding!"