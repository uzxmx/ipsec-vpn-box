#!/usr/bin/env bash

set -e

source "$(dirname $0)/.env"

if [ ! -e /sys/class/net/ppp0 ]; then
  cat <<-EOF
ip addr
ip route

sudo tcpdump -n -i ppp0
curl https://www.google.com

sudo journalctl -u ipsec -f
sudo journalctl -u xl2tpd -f

sudo systemctl restart ipsec
sudo systemctl restart xl2tpd
EOF
  exit 1
fi

gw=$(ip route | awk '/default/ { print $3 }')
if echo "$gw" | grep '^ppp0$' &>/dev/null; then
  echo 'It seems that VPN connection has already started.'
  exit 1
fi
if ! ip route | grep "^$VPN_SERVER_IP via $gw " &>/dev/null; then
  sudo route add $VPN_SERVER_IP gw $gw
fi
sudo route add default dev ppp0

if ! cat /etc/resolv.conf | grep '^nameserver 8\.8\.8\.8$' &>/dev/null; then
  sudo sed -i -E 's/^([^#].*)$/#\1/' /etc/resolv.conf
  echo 'nameserver 8.8.8.8' | sudo tee -a /etc/resolv.conf >/dev/null
fi

echo 'VPN started'
