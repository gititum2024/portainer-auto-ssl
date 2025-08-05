# Portainer with Caddy SSL Setup

This setup runs Portainer with automatic SSL certificates using Caddy as a reverse proxy. Portainer will be accessible at `https://yourdomain.com/portainer`.

## Prerequisites

- Docker and Docker Compose installed on your VPS
- A domain name pointing to your VPS's IP address

## Setup Instructions

1. Clone or download these files to your VPS:
   - `docker-compose.yml`
   - `Caddyfile`
   - `.env`

2. Update the `.env` file with your domain and a secure password:
   ```
   DOMAIN=yourdomain.com
   ADMIN_PASSWORD=YourSecurePassword
   ```

3. Start the services:
   ```bash
   docker-compose up -d
   ```

4. Access Portainer at `https://yourdomain.com/portainer`

5. After the first login, for security reasons, you should:
   - Remove or comment out the `ADMIN_PASSWORD` line in the `.env` file
   - Restart the services with `docker-compose down && docker-compose up -d`

## Configuration Notes

- Caddy will automatically obtain and renew SSL certificates from Let's Encrypt
- The domain is configured via the `.env` file
- Portainer data is persisted in a Docker volume named `portainer_data`
- Caddy logs are stored in `/data/access.log` within the container

## Troubleshooting

If you encounter issues:

1. Check logs:
   ```bash
   docker-compose logs caddy
   docker-compose logs portainer
   ```

2. Ensure your domain is correctly pointed to your VPS's IP address

3. Make sure ports 80 and 443 are open and not blocked by a firewall

4. If Portainer UI looks broken at the `/portainer` path, try setting the following in Portainer settings:
   - Go to Settings > Authentication
   - Set "Hide Version" to true
   - Set URL prefix to `/portainer`
```
