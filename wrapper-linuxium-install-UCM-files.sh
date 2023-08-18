#!/bin/bash

echo "127.0.1.1 $(hostname -s)" > /etc/hosts
cd /usr/local/bin
./linuxium-install-UCM-files.sh
sed -i '$d' /etc/hosts
rm -f linuxium-install-UCM-files.sh wrapper-linuxium-install-UCM-files.sh
