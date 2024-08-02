#!/bin/bash

# Set MySQL credentials
MYSQL_CONFIG_FILE="/etc/mysql/my.cnf"
MYSQL_DATABASE="grazle"
MYSQL_USER="grazleuser"
MYSQL_PASSWORD="AnotherStr0ngP@ssw0rd!"

# Log in to MySQL and execute commands
mysql --defaults-extra-file="$MYSQL_CONFIG_FILE" << EOF
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';
FLUSH PRIVILEGES;
EOF

echo "Database and user setup completed."