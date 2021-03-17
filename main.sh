#!/usr/bin/env bash
export DISPLAY=:0.0
	battery_percent=$(acpi -b | grep -P -o '[0-9]+(?=%)')
	if on_ac_power; then
		if [ "$battery_percent" -eq 100 ]; then
			/usr/bin/notify-send -t 3000 "Battery 100%." -i ~/Documents/battery_notification/icons/battery_100_1.png "Level: ${battery_percent}% "
			/usr/bin/paplay ~/Documents/battery_notification/sounds/battery_full.ogg

		elif [ "$battery_percent" -gt 95 ]; then
			/usr/bin/notify-send -t 1000 "Battery full." -i ~/Documents/battery_notification/icons/battery_gt_95_1.png "Level: ${battery_percent}% "
			/usr/bin/paplay ~/Documents/battery_notification/sounds/Popcorn.ogg
		fi
	else 
		if [ "$battery_percent" -lt 15 ]; then
			/usr/bin/notify-send -t 3000 "Plug the Charger." -i ~/Documents/battery_notification/icons/battery_lt_15.png "Level: ${battery_percent}%"
			/usr/bin/paplay ~/Documents/battery_notification/sounds/low_battery.ogg

		elif [ "$battery_percent" -lt 30 ]; then
			/usr/bin/notify-send -t 1000 "Battery About to Die." -i ~/Documents/battery_notification/icons/battery_lt_30_1.png "Level: ${battery_percent}%"
			/usr/bin/paplay ~/Documents/battery_notification/sounds/swiftly.ogg
		fi
	fi