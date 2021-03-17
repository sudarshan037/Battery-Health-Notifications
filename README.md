# Battery-Health-Notifications
requirements:
1. pulseaudio
2. sudo apt install acpi
3. Clone the repo and update the file locations in main.sh and your crontab

Cron:
1. run: crontab -e
3. append following to the end:
	* * * * * XDG_RUNTIME_DIR=/run/user/$(id -u) ~/Documents/battery_notification/main.sh >> ~/Documents/battery_notification/log.txt 2>&1
