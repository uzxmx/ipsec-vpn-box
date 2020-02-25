#!/usr/bin/env bash

set -e

sudo route del default dev ppp0

sudo sed -i -E '/^nameserver 8.8.8.8$/d' /etc/resolv.conf
sudo sed -i -E 's/^#(nameserver .+)$/\1/' /etc/resolv.conf

echo 'VPN stopped'
