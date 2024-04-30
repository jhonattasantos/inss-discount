#!/bin/sh
set -e

# Remove a potentially pre-existing server.pid for Rails.
echo "Removing old PID"
rm -f /workspace/tmp/pids/server.pid

# Exec migrations
echo "Executing Rails migrations"
rails db:migrate && rails db:seed

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
