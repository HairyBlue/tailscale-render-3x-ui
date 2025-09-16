#!/usr/bin/env bash

/app/tailscaled --state=/var/lib/tailscale/tailscaled.state --socket=/var/run/tailscale/tailscaled.sock &
/app/tailscale up --auth-key=${TAILSCALE_AUTHKEY} --hostname=render-app  --advertise-exit-node

# Wait a few seconds for Tailscale to fully initialize
sleep 10

# Start 3X-UI in background (adjust path if needed)
/usr/local/bin/3x-ui &

/app/my-app