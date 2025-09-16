#!/usr/bin/env bash

/app/tailscaled --state=/var/lib/tailscale/tailscaled.state --socket=/var/run/tailscale/tailscaled.sock &
/app/tailscale up --auth-key=${TAILSCALE_AUTHKEY} --hostname=render-app  --advertise-exit-node

# Wait a few seconds for Tailscale to fully initialize
sleep 10

# Install 3X-UI at runtime (will only run if not installed)
bash <(curl -Ls https://raw.githubusercontent.com/mhsanaei/3x-ui/master/install.sh)

# Start 3X-UI in background
/usr/local/bin/3x-ui &

/app/my-app