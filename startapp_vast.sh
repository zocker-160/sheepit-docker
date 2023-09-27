#! /usr/bin/env bash

echo "Cleaning up old data and cache..."

rm -rf /sheep/*.jar
rm -rf /sheep/cache/* || true

echo "Downloading latest sheepit client..."
curl https://www.sheepit-renderfarm.com/media/applet/client-latest.php -o /sheep/sheepit-client.jar

# Autodetect cores
cpu=`nproc`
echo "Autodetected $cpu cores."

echo "Starting client"
java -jar /sheep/sheepit-client.jar -cache-dir /sheep/cache -cores $cpu -compute-method GPU "$@"
