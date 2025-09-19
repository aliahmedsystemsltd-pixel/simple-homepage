#!/bin/bash
set -e
cd "$(dirname "$0")"

# stop old pm2 app if exists
pm2 delete myapp || true
pm2 save

# kill any stale node on 3000
pids=$(lsof -t -i:3000 || true)
if [ -n "$pids" ]; then
  echo "Killing PIDs: $pids"
  sudo kill -9 $pids || true
fi

# build image
docker build -t alia/simple-homepage:latest .

# stop/remove old container
docker stop simple-homepage || true
docker rm simple-homepage || true

# run new container bound to loopback
docker run -d --name simple-homepage --restart unless-stopped -p 127.0.0.1:3000:3000 alia/simple-homepage:latest

echo "Deployed. Visit http://127.0.0.1:3000 (or via nginx http://<PUBLIC_IP>/)"
