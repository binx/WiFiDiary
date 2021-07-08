WiFiDiary
=========
## About
This is a script to record the different places that you go to, through the lens of a changing WiFi connection. A shell script checks for changes in your connected SSID. If there is a change, it will take a photo of you and record the time and SSID name.

In MacOS Mojave and later (Big Sur, Catalina, etc) the security permissions have changed rather drastically, prompting more setup to get this running. You can see the original shell script and instructions in `/legacy`.

## Setup

1. #### Install [imagesnap](https://github.com/rharder/imagesnap)

		brew install imagesnap

2. #### Grant Application Permissions

Under Security & Privacy > Full Disk Access, drag in the appliation icons for Terminal and Automator. ([Longer Explainer](https://osxdaily.com/2020/04/27/fix-cron-permissions-macos-full-disk-access/))

!["granting permissions"](./tutorial/security.png?raw=true "granting permissions")

3. #### Set Up Automator Script
	1. Open the Automator app
	2. Select "New Application", then add Library > Run Shell Script
	
	!["adding script"](./tutorial/automator.png?raw=true "adding script")
	3. Paste in the shell script from `sample_script.sh` with the proper pathname of where you cloned the repo.
	4. Click "Run" (upper right corner) to test the script, and be sure to click "Allow" for granting Automator access to the Camera.
	5. Check your `/photos` folder in your WiFiDiary folder, and verify that a photo has been taken. To have it run more than once, you'll need to change the text value in `SSID.text` to something other than your wifi name.

4. #### Schedule the Script
Ok, here's where things go off the rails! Turns out MacOS would like to make it difficult to run Automator apps more than once a day (which one can easily do with a calendar event! go figure). So now we will get into the world of `launchctl` and `.plist` files.
	1. Take the `wifidiary.plist` file in the repo, we're going to fill in the appropriate values.
		1. The string value here must be the name of the file.
		```
		<key>Label</key>
    	<string>wifidiary</string>
    	```
    	2. This is for error handling! You can delete this if you'd like.
    	```
    	<key>StandardErrorPath</key>
    	<string>/Users/binx/Documents/WiFiDiary/err.log</string>
    	```
    	3. Commands for running the program. Make sure to substitute the proper path to where you have cloned the repo. Make sure you also have the correct name for your automator script, as you can see mine is called `automator_script.app` (descriptive, I know) and lives in my WiFiDiary folder.
    	```
    	<key>ProgramArguments</key>
	    <array>
	        <string>open</string>
	        <string>-a</string>
	        <string>/Users/binx/Documents/WiFiDiary/automator_script.app</string>
	    </array>
    	```
    	4. How often to run the script - this will run every 15 minutes.
    	```
    	<key>StartInterval</key>
   		<integer>15000</integer>
    	```
	2. Save this file to `~/Library/LaunchAgents`. It is *very important* that you save it to your user-specific Library folder (aka `~/Library`) vs. the system-wide Library folder (`/Library`)
	3. If you don't have `launchctl` installed on your machine, you can [grab it here](https://webinstall.dev/serviceman/). The install program will also tell you if/how to update your $PATH variable.
	4. The final commands to get this running are:
	```
	launchctl enable gui/501/wifidiary
	```
	and
	```
	launchctl kickstart service-target	
	```
	This might require a reboot of your machine to work, it seems to vary widely. [Here's a reddit thread for debugging](https://www.reddit.com/r/MacOS/comments/kbko61/launchctl_broken/).

## Success??
Hopefully after all of this work, you have a beautifully running script that checks for changes in your wifi SSID. Enjoy the beautiful images of your computer-face!