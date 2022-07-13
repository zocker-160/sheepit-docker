#! /usr/bin/env bash

echo "Cleaning up old data and cache..."

rm -rf /sheep/*.jar
rm -rf /sheep/cache/* || true

echo "Downloading latest sheepit client..."
curl https://www.sheepit-renderfarm.com/media/applet/client-latest.php -o /sheep/sheepit-client.jar

# Autodetect cores
if [ $cpu -eq 0 ]
then
    echo "No core count specified, autodetected `nproc` cores."
    cpu=`nproc`
fi

if [ -z $gpu ]
then
    echo "no GPU_ID specified, showing all supported GPUs:"
    java -jar /sheep/sheepit-client.jar --show-gpu
    
    echo "exiting...."
else
    if [ $gpu == "none" ]
    then
        echo "running in CPU mode"
        java -jar /sheep/sheepit-client.jar -cache-dir /sheep/cache -cores $cpu -login $user_name -password $user_password -ui $ui "$@"
    else
        echo "running in GPU mode"
        java -jar /sheep/sheepit-client.jar -cache-dir /sheep/cache -cores $cpu -compute-method GPU -gpu $gpu -login $user_name -password $user_password -ui $ui "$@"
    fi
fi
