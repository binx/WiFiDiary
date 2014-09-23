#!/bin/bash

AIR=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I | grep ' SSID' | cut -d ':' -f 2)
AIR=${AIR//[[:blank:]]/}

FILEPATH="/path/to/repo/"
FILENAME='.jpg'

FILE="${FILEPATH}SSID.txt"
SAVED=`cat ${FILEPATH}SSID.txt`
SAVED=${SAVED//[[:blank:]]/}

echo $SAVED

if [ "$AIR" != "$SAVED" ]; then
	/usr/local/bin/imagesnap "${FILEPATH}photos/${AIR}${FILENAME}"
	echo "$AIR" > "$FILE"
	sleep 5
	python "${FILEPATH}tumblr.py" $AIR
fi

exit 0