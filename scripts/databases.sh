#!/bin/sh
set -e

echo "Starting database containers (OrbStack, no passwords)..."

run_or_start() {
  name="$1"
  shift
  if docker ps -a --format '{{.Names}}' | grep -q "^${name}$"; then
    docker start "$name"
  else
    docker run -d --name "$name" "$@"
  fi
}

#######################################
# MySQL (no password)
#######################################
run_or_start mysql \
  -p 127.0.0.1:3306:3306 \
  -e MYSQL_ALLOW_EMPTY_PASSWORD=yes \
  mysql:8.4

#######################################
# PostgreSQL (trust auth)
#######################################
run_or_start postgres \
  -p 127.0.0.1:5432:5432 \
  -e POSTGRES_HOST_AUTH_METHOD=trust \
  postgres:16

#######################################
# MongoDB (no auth)
#######################################
run_or_start mongo \
  -p 127.0.0.1:27017:27017 \
  mongo:7

#######################################
# Redis (no auth)
#######################################
run_or_start redis \
  -p 127.0.0.1:6379:6379 \
  redis:7

echo "✅ Databases are running with NO authentication."
echo "⚠️ Local development only. Do NOT use in production."
