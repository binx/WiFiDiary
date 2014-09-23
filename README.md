WiFiDiary
=========
## Setup
1. Install [imagesnap]
(http://iharder.sourceforge.net/current/macosx/imagesnap/)	
		brew install imagesnap
	
2. Set up your chron job

		$ crontab -e

	I set mine up to run every 20 minutes:
	
		0,20,40 * * * * /path/to/repo/check_wifi.sh

## Optional Tumblr Upload
1. Uncomment line 19 in chech_wifi.sh
2. Register an app at the [Tumblr API](https://www.tumblr.com/docs/en/api/v2) for the Consumer Key and Consumer Secret
3. Use the [Tumblr Console](https://api.tumblr.com/console) to generate your OAuth Key and OAuth Secret

## Voila!
Now you too can have a record of your computer-face.
![](http://33.media.tumblr.com/91ab16582ec3e9103aa77d8f1c4aabb6/tumblr_nc82suIKUT1tmz7aco1_1280.jpg)