#!/usr/bin/env bash

/app/tailscaled --state=/var/lib/tailscale/tailscaled.state --socket=/var/run/tailscale/tailscaled.sock &
/app/tailscale up --auth-key=${TAILSCALE_AUTHKEY} --hostname=render-app  --advertise-exit-node

# Wait a few seconds for Tailscale to fully initialize
sleep 10

# Install 3X-UI at runtime (will only run if not installed)
/usr/bin/test -f /usr/local/bin/3x-ui || curl -fsSL https://raw.githubusercontent.com/mhsanaei/3x-ui/master/install.sh | bash -s -- -Y

# Start 3X-UI in background
/usr/local/bin/3x-ui &

# Start 3X-UI in background (adjust path if needed)
/usr/local/bin/3x-ui &

/app/my-app