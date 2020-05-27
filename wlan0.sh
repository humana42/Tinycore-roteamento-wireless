#!/bin/bash

mv /dev/random /dev/random_old

ln -s /dev/urandom /dev/random

ifconfig wlan0 down

iwconfig wlan0 mode ad-hoc

iwconfig wlan0 channel auto essid test

ifconfig wlan0 192.168.42.1 netmask 255.255.255.0 up

dhcpd wlan0 -cf /etc/dhcpd.conf -lf /var/db/dhcpd.leases

echo nameserver 192.168.42.1 > /etc/resolv.conf

echo nameserver 192.168.42.0 >> /etc/resolv.conf
