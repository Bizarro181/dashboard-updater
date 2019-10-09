#!/bin/bash
# timerPath="/C/Users/Rob/Desktop/test/";
timerPath="/C/Program Files (x86)/LightTPD/dashboard/";

# Get a carriage return into `cr` -- there *has* to be a better way to do this
cr=`echo $'\n.'`
cr=${cr%.}

# Colors
GREEN='\033[0;32m';
RED='\033[1;31m';
NC='\033[0m' # No Color

# Repos
dashboardRepo="https://github.com/Bizarro181/gtg-dashboard.git";

# Exit Timeout
exitTime=20;

# Output Info
function info {
	echo -e "${GREEN}${1}${NC}";
}
function important {
	echo -e "${RED}${1}${NC}";
}

# Update Menu
function updateMenu {
	read -p "Update Timers:$cr(1) Senators Manor $cr(2) Mayan Tomb $cr(3) Lost City$cr(4) Submarine$cr(5) Jewel Heist$cr(5) Frozen Grove$cr Please Enter your selection (1-5): " choice
	case "$choice" in
		1) updateTimer senators;;
		2) updateTimer mayan;;
		3) updateTimer lost;;
		4) updateTimer submarine;;
		5) updateTimer heist;;
		5) updateTimer frozen;;
	esac
}

# Intall Menu
function installMenu {
	read -p "Install Timers:$cr(1) Senators Manor $cr(2) Mayan Tomb $cr(3) Lost City$cr(4) Submarine$cr(5) Jewel Heist$cr(5) Frozen Grove$cr Please Enter your selection (1-5): " choice
	case "$choice" in
		1) installTimer senators "${senatorsRepo}";;
		2) installTimer mayan "${mayanRepo}";;
		3) installTimer lost "${lostCityRepo}";;
		4) installTimer submarine "${submarineRepo}";;
		5) installTimer heist "${heistRepo}";;
		5) installTimer frozen "${frozenRepo}";;
	esac
}

# Update Timer
# $1 Directory slug for timer
function updateDashboard {
	info "Chaning to ${timerPath}";
	cd "${timerPath}";
	info "Updating...";
	git pull;
	info "Done! Exiting in $exitTime seconds";
	sleep "$exitTime";
}

# Install Timer
# $1 Directory slug for timer
# $2 Repo for timer
function installDashboard {
	cd "${timerPath}";
	info "Downloading and Installing...";
	git clone ${dashboardRepo} .;
	info "Done! Access using the URL below:"
	important "http://localhost/timers/";
	info "Exiting in $exitTime seconds";
	sleep "$exitTime";
}

# First Menu
read -p "(1) Install $cr(2) Update $cr Please Enter your selection (1-2): " choice
case "$choice" in
	1) installDashboard;;
	2) updateDashboard;;
esac



# cd /C/Users/Robert/Desktop/test/senators;
# cd "/C/Program Files (x86)/"
# git pull;
# sleep 10;
