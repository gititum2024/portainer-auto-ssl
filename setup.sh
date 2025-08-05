#!/bin/bash

# Create password file directory if it doesn't exist
mkdir -p portainer_data

# Check if password file already exists
if [ ! -f portainer_data/password_file ]; then
  echo "Creating initial admin password for Portainer..."
  read -sp "Enter secure password for Portainer admin: " ADMIN_PASSWORD
  echo
  echo "$ADMIN_PASSWORD" > portainer_data/password_file
  echo "Password file created."
fi

# Start the containers
echo "Starting Portainer with Caddy SSL..."
docker-compose up -d

echo "Setup complete! Portainer should be available at https://$(grep DOMAIN .env | cut -d= -f2)/portainer"
