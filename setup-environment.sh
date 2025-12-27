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

# Create default index.php file
cat > app/public/index.php << 'EOF'
<?php
/*
 * Copyright (c) 2025 David Bray
 * Licensed under the MIT License. See LICENSE file for details.
*/

print '<div class="center"><br><h1>hello world from frank/index.php</h1><br></div>';
phpinfo(INFO_VARIABLES);
EOF

echo "✅ Created app/public/index.php with default content"

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