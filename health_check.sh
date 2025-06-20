#!/bin/bash

# Default to port 3000 unless another port is passed as an argument
PORT=${1:-3000}

echo "[*] Checking if Juice Shop is running on port $PORT..."

# Check using curl (HTTPS) with -s (silent), -k (skip cert), -S (show errors), -f (fail silently on HTTP errors)
if curl -skSf https://localhost:$PORT > /dev/null; then
  echo "✅ Juice Shop is running on port $PORT!"
else
  echo "❌ Juice Shop is down on port $PORT!"
fi

