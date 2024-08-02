#!/bin/bash

IP=$1

sudo ip route del 192.168.1.0/24 via $IP dev tun0 metric 1
sudo ip route add 192.168.1.0/24 dev wlp170s0 scope link metric 1

echo "Split tunnel from $IP added"

