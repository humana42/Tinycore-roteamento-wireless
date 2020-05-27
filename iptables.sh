#!/bin/bash

echo 1 > /proc/sys/net/ipv4/ip_forward

route add -net 192.168.42.0 netmask 255.255.255.0 gw 192.168.7.0

iptables -F

iptables -F -t nat

iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

iptables –A INPUT –i eth0 –j ACCEPT

iptables -A FORWARD -i eth0 -o wlan0 -m state –state RELATED,ESTABLISHED -j ACC

iptables -A FORWARD -i wlan0 -o eth0 -j ACCEPT
