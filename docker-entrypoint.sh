#!/bin/bash
set -e
mkdir -p /home/node/.n8n
chown -R 1000:1000 /home/node/.n8n
chmod -R 700 /home/node/.n8n
exec su - node -s /bin/sh -c "n8n start"
