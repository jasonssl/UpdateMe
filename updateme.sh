#!/bin/bash
#
# A customized script to perform update, upgrade and cleaning afterward.
#
# Jason Lim (jason.sslim@gmail.com)

# Functions
header () {
	echo " "
	echo "	                 _       _                      "
	echo "	 _   _ _ __   __| | __ _| |_ ___ _ __ ___   ___ "
	echo "	| | | | '_ \ / _  |/ _  | __/ _ \ '_   _ \ / _ \'"
	echo "	| |_| | |_) | (_| | (_| | ||  __/ | | | | |  __/"
	echo "	 \__,_| .__/ \__,_|\__,_|\__\___|_| |_| |_|\___|"
	echo "	      |_|                                       "
	echo " 						@JasonSSL"
	echo " A customized script to perform update, upgrade and"
	echo " cleanup in the end of the process"
	echo " "
	}

updateupgrade () {
	echo " "
	echo "[*] System is updating..."
		apt-get update
	echo "[*] System update completed!"
	echo "[*] System is upgrading..."
		apt-get dist-upgrade -y
	echo "[*] System upgrade completed!"
	echo " "
	}

cleanup () {
	echo " "
	echo "[*] Cleaning up the system..."
		apt-get autoclean
	echo "[*] System is cleaned!"
	echo "[*] System is removing redundant file..."
		apt-get autoremove -y
	echo "[*] System auto-remove completed!"
	echo " "
	echo "[*] Removing all the trashes..."
		rm -rf /home/*/.local/share/Trash/*/** &> /dev/null
		rm -rf /root/.local/share/Trash/*/** &> /dev/null
	echo "[*] Trash removed completely!"
	}

# Main function
clear
header
updateupgrade
cleanup
