#!/bin/bash

SSID=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I | grep ' SSID' | cut -d ':' -f 2)
SSID=${SSID//[[:blank:]]/}

FILEPATH="Documents/WiFiDiary/"

FILE="${FILEPATH}SSID.txt"
touch $FILE
SAVED=`cat ${FILEPATH}SSID.txt`
SAVED=${SAVED//[[:blank:]]/}

echo $SAVED

if [ "$SSID" != "$SAVED" ]; then
	DATE=$(date +"%Y%m%d%H%M")
	# imagesnap 0.2.13 warms up the camera for 3 seconds by default
	/usr/local/bin/imagesnap "${FILEPATH}photos/${DATE}-${SSID}.jpg"
	echo "$SSID" > "$FILE"
	sleep 5
#	python "${FILEPATH}tumblr.py" $DATE $SSID
fi

exit 0