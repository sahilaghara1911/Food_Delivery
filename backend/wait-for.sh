#!/bin/sh

echo "Waiting for MongoDB to be ready at $MONGO_URL..."

# Extract hostname and port from the MONGO_URL
HOST=$(echo $MONGO_URL | sed -e 's|mongodb://||' -e 's|/.*||' -e 's|:.*||')
PORT=$(echo $MONGO_URL | sed -e 's|.*:||' -e 's|/.*||')

echo "Host: $HOST, Port: $PORT"

# Loop until Mongo is reachable
while ! nc -z $HOST $PORT; do
  echo "Waiting for Mongo ($HOST:$PORT)..."
  sleep 2
done

echo "MongoDB is ready. Starting the server..."

exec node server.js
