#!/bin/bash

echo "127.0.1.1 $(hostname -s)" > /etc/hosts
cd /usr/local/bin
./linuxium-install-broadcom-drivers.sh
sed -i '$d' /etc/hosts
rm -f linuxium-install-broadcom-drivers.sh wrapper-linuxium-install-broadcom-drivers.sh
