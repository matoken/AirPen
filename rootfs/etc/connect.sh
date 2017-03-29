#!/bin/sh

##### Complete wpa.conf #######
echo ssid=\"$1\" >> /tmp/wpa.conf
echo key_mgmt=$2 >> /tmp/wpa.conf
if [ $3 ]; then
    echo psk=\"$3\" >> /tmp/wpa.conf
fi
echo } >> /tmp/wpa.conf
##### Start wpa_supplicant ######
