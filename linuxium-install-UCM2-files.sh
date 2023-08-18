#!/bin/bash

# Linuxium's script to install additional UCM2 files based on the work of Pierre-Louis Bossart and Heiko Mathes

echo "$0: Extracting UCM2 files ..."
PURGE_UNZIP=false && [ ! $(sudo bash -c "command -v unzip") ] && sudo apt -y install unzip > /dev/null 2>&1 && PURGE_UNZIP=true
sudo rm -rf UCM2
sudo mkdir UCM2
cd UCM2
sudo wget --timeout=10 "https://github.com/plbossart/UCM/archive/master.zip" > /dev/null 2>&1
sudo unzip master.zip > /dev/null 2>&1
sudo rm -f master.zip
echo "$0: Installing missing UCM2 directories ..."
sudo mkdir -p /usr/share/alsa/ucm2
cd UCM-master
for UCM2_DIRECTORY in * ; do
	if [ ! -d /usr/share/alsa/ucm2/${UCM2_DIRECTORY} ]; then
		sudo cp -a ${UCM2_DIRECTORY} /usr/share/alsa/ucm2
	fi
done
cd ..
sudo rm -rf UCM-master
# add cx2072x
if [ ! -d /usr/share/alsa/ucm2/chtcx2072x ]; then
	sudo mkdir /usr/share/alsa/ucm2/chtcx2072x
	sudo wget --timeout=10 "https://github.com/heikomat/linux/raw/cx2072x/cx2072x_fixes_and_manual/chtcx2072x/HiFi.conf" -O /usr/share/alsa/ucm2/chtcx2072x/HiFi.conf > /dev/null 2>&1
	sudo wget --timeout=10 "https://github.com/heikomat/linux/raw/cx2072x/cx2072x_fixes_and_manual/chtcx2072x/chtcx2072x.conf" -O /usr/share/alsa/ucm2/chtcx2072x/chtcx2072x.conf > /dev/null 2>&1
fi
cd ..
sudo rm -rf UCM2
if ${PURGE_UNZIP}; then sudo apt -y purge unzip > /dev/null 2>&1; fi
echo "$0: Installation of UCM2 files finished "
