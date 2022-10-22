#!/bin/bash -e

rm -f /portalrite/tmp/pids/server.pid
exec "$@"
