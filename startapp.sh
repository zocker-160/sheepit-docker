#!/bin/bash

#Check for updates
echo Downloading latest version...

rm -rf /sheep/*.jar

curl https://www.sheepit-renderfarm.com/media/applet/client-latest.php -o /sheep/sheepit-client.jar

echo finished downloading client

#Autodetect cores
if [ $cpu -eq 0 ]; then
    echo No core count specified, autodetected `nproc` cores.
    cpu=`nproc`
fi

if [ -z $gpu ]; then
	echo no GPU specified, showing all connected GPUs:
	java -jar /sheep/sheepit-client.jar --show-gpu
	echo exiting....
else
	java -jar /sheep/sheepit-client.jar -cache-dir /sheep/cache -cores $cpu -compute-method GPU -gpu $gpu -login $user_name -password $user_password -ui oneLine
fi

#java -jar /sheep/sheepit-client.jar -cores $cpu 
