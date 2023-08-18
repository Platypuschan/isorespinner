#!/bin/bash

# Linuxium's script to install UCM files based on the work of Pierre-Louis Bossart, 'kernins' and Heiko Mathes

echo "$0: Extracting UCM files ..."
PURGE_UNZIP=false && [ ! $(sudo bash -c "command -v unzip") ] && sudo apt -y install unzip > /dev/null 2>&1 && PURGE_UNZIP=true
sudo rm -rf UCM
sudo mkdir UCM
cd UCM
sudo wget --timeout=10 "https://github.com/plbossart/UCM/archive/master.zip" > /dev/null 2>&1
sudo unzip master.zip > /dev/null 2>&1
sudo rm -f master.zip
echo "$0: Installing UCM files ..."
sudo mkdir -p /usr/share/alsa/ucm
sudo cp -rf UCM-master/* /usr/share/alsa/ucm
sudo cp /usr/share/alsa/ucm/bytcr-rt5651/asound.state /var/lib/alsa
sudo rm -rf UCM-master
# add es8316
sudo mkdir /usr/share/alsa/ucm/bytcht-es8316
sudo wget --timeout=10 "https://github.com/kernins/linux-chwhi12/raw/master/configs/audio/ucm/bytcht-es8316/HiFi" -O /usr/share/alsa/ucm/bytcht-es8316/HiFi > /dev/null 2>&1
sudo wget --timeout=10 "https://github.com/kernins/linux-chwhi12/raw/master/configs/audio/ucm/bytcht-es8316/bytcht-es8316.conf" -O /usr/share/alsa/ucm/bytcht-es8316/bytcht-es8316.conf > /dev/null 2>&1
# add cx2072x
sudo mkdir /usr/share/alsa/ucm/chtcx2072x
sudo wget --timeout=10 "https://github.com/heikomat/linux/raw/cx2072x/cx2072x_fixes_and_manual/chtcx2072x/HiFi.conf" -O /usr/share/alsa/ucm/chtcx2072x/HiFi.conf > /dev/null 2>&1
sudo wget --timeout=10 "https://github.com/heikomat/linux/raw/cx2072x/cx2072x_fixes_and_manual/chtcx2072x/chtcx2072x.conf" -O /usr/share/alsa/ucm/chtcx2072x/chtcx2072x.conf > /dev/null 2>&1
sudo mkdir /usr/share/alsa/ucm/bytcht-cx2072x/
sudo wget --timeout=10 "https://github.com/heikomat/linux/raw/cx2072x/cx2072x_fixes_and_manual/bytcht-cx2072x/HiFi.conf" -O /usr/share/alsa/ucm/bytcht-cx2072x/HiFi.conf > /dev/null 2>&1
sudo wget --timeout=10 "https://github.com/heikomat/linux/raw/cx2072x/cx2072x_fixes_and_manual/bytcht-cx2072x/bytcht-cx2072x.conf" -O /usr/share/alsa/ucm/bytcht-cx2072x/bytcht-cx2072x.conf > /dev/null 2>&1
# add HdmiLpeAudio.conf
sed '1,/^exit$/d' < ../$0 | base64 -d | sudo tee $0.zip > /dev/null 2>&1
sudo unzip $0.zip > /dev/null 2>&1
sudo rm -f $0.zip
sudo mkdir -p /usr/share/alsa/cards
sudo cp HdmiLpeAudio.conf /usr/share/alsa/cards
cd ..
sudo rm -rf UCM
if ${PURGE_UNZIP}; then sudo apt -y purge unzip > /dev/null 2>&1; fi
echo "$0: Installation of UCM files finished "
exit
UEsDBBQAAAAIAGJSfUqJc4xwrgEAAI8EAAARABwASGRtaUxwZUF1ZGlvLmNvbmZVVAkAA2jv2lho
79pYdXgLAAEEAAAAAAQAAAAAnVPbSsNAEH3OfsXQ5k1I76AiYmkLFhSKgi9SZE0maXCTDZvd1iL+
u3vpxdgaiy9LZs5c9pw9aZImjHgep4kSVKY8h5gLkAuEaS6Rwe34ftoaz+BuNgGqopSTJiFXoe6I
UnFZhFkrFjyXgclcE3IbZeldgUNTGWg0cGgbPoh3Q0VSwjOMhg9jmG/iwEYa9eS6QCilSPOEeJ9k
E/NYLjkjXsnoEs3Efe1ipb9CKiLwzRDbpK8hBWe2KKcZQmM2uocZo+tXGr7BE2cqw8ZB3yfRMkQY
U8UkrFK5AM3j/Wy7/YDVtvSfrAqmkqOUdnR/gN5NrPIQNLuQShO7iWZvw9z0suG4mAuYLRUd6oWo
KGF6rRqVFy6VEFzlUb+9eeajaLdTh/Zr0UHt5MG2twovNPNffWfBQ9sNJ49tc3TM0TVH74RHc7Dt
3cGp/j0SFFW88wfe/QPvHced3Tl/K0/+EWx18O2+oWQvyDDTIyz44mQxDrAm8cxCEdMQQTvFZpxv
ppPRxeB8b52x8771jse4zkih0EaFwBLFEveZJWUKtfi+Fc+3EvlWCH+rvTPs3BnvC1BLAQIeAxQA
AAAIAGJSfUqJc4xwrgEAAI8EAAARABgAAAAAAAEAAACkgQAAAABIZG1pTHBlQXVkaW8uY29uZlVU
BQADaO/aWHV4CwABBAAAAAAEAAAAAFBLBQYAAAAAAQABAFcAAAD5AQAAAAA=
