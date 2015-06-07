#!/bin/bash

SSID=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I | grep ' SSID' | cut -d ':' -f 2)
SSID=${SSID//[[:blank:]]/}

# Get path from argument (or use current path)
FILEPATH=$1
if [ -z "$FILEPATH" ]
then
	FILEPATH="./"
fi

FILE="${FILEPATH}SSID.txt"
touch $FILE
SAVED=`cat ${FILEPATH}SSID.txt`
SAVED=${SAVED//[[:blank:]]/}

echo $SAVED

if [ "$SSID" != "$SAVED" ]; then
	DATE=$(date +"%Y%m%d%H%M")
	/usr/local/bin/imagesnap "${FILEPATH}photos/${DATE}-${SSID}.jpg"
	echo "$SSID" > "$FILE"
	sleep 5
#	python "${FILEPATH}tumblr.py" $DATE $SSID
fi

exit 0
