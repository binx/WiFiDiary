WiFiDiary
=========
##About
This is an app to record the different places that you go to, through the lens of a changing WiFi connection. The basic script checks for changes in your connected SSID, and if there is a change, it will take a photo of you and record the time and SSID name. This repo also includes the option to post that photo and SSID to tumblr, thus creating a fairly risky public diary of your life.

## Setup
1. Install [imagesnap]
(http://iharder.sourceforge.net/current/macosx/imagesnap/)
		brew install imagesnap

2. Set up your chron job

		$ crontab -e

	I set mine up to run every 20 minutes:

		0,20,40 * * * * cd /path/to/repo/ && ./check_wifi.sh

## Optional Tumblr Upload

Let's be real: this is probably a terrible idea for most people. Not only does this create a record of your movements on a 3rd party server, but it also snaps photos of you without warning and posts them automatically.

So beware when using this script, try to wear clothes when you're using your computer, and at the very least consider making this tumblr private.

If you're still keen on the idea:

1. Uncomment line 19 in chech_wifi.sh
2. Register an app at the [Tumblr API](https://www.tumblr.com/docs/en/api/v2) for the Consumer Key and Consumer Secret
3. Use the [Tumblr Console](https://api.tumblr.com/console) to generate your OAuth Key and OAuth Secret

## Voila!
Now you too can have a record of your computer-face.
![](http://33.media.tumblr.com/91ab16582ec3e9103aa77d8f1c4aabb6/tumblr_nc82suIKUT1tmz7aco1_1280.jpg)
