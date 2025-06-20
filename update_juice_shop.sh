#!/bin/bash

# Default port is 3000 unless a different one is passed
PORT=${1:-3000}
CONTAINER_NAME=juice-shop

echo "[+] Pulling latest Juice Shop image..."
docker pull bkimminich/juice-shop:latest

echo "[+] Stopping and removing old container (if running)..."
docker rm -f $CONTAINER_NAME 2>/dev/null || true

echo "[+] Starting updated Juice Shop container on port $PORT..."
docker run -d --name $CONTAINER_NAME -p $PORT:3000 bkimminich/juice-shop

echo "[+] Juice Shop should now be running on port $PORT."

