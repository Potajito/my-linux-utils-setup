#!/bin/bash

# Define color variables
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

ip link add name br0 type bridge
ip link set br0 up
ip link set enp4s0 master br0
dhcpcd br0
ip link add vpn0 type veth peer name vpn1
ip link set dev vpn0 master br0
ip netns add vpn
ip link set vpn1 netns vpn
ip netns exec vpn ip link
ip link set dev vpn0 promisc on
ip link set vpn0 up
ip netns exec vpn dhcpcd vpn1
ip netns exec vpn ip addr

echo -e "${GREEN}Ahora la parte del forwarding${NC}"

sysctl -w net.ipv4.ip_forward=1
iptables -P FORWARD ACCEPT
iptables -t nat -A POSTROUTING -o enp4s0 -j MASQUERADE

echo -e "${GREEN}Test routing local (puede que estos dos estén invertidos)${NC}"
# Add a route in the VPN namespace to access the local network
ip route add 192.168.1.0/24 dev br0
# OLD ONE ip netns exec vpn ip route add 192.168.1.0/24 via 192.168.1.100 dev vpn1

# Add specific route for your local network in the main namespace (fixed?)
ip netns exec vpn ip route add 192.168.1.0/24 via 192.168.1.1 dev vpn1
# ip netns exec vpn ip route add 192.168.1.143 via 192.168.132 dev vpn1 # prueba, no estoy seguro de la parte final vpn1
# ip netns exec vpn ip route add 192.168.1.143 via 192.168.133 dev vpn1 # prueba, no estoy seguro de la parte final vpn1


echo -e "${GREEN}VPN INFO${NC}"

gp-saml-gui --gateway --clientos=Linux --allow-insecure-crypto url.url.com
echo -e "${GREEN}Paste cookie:${NC}"
sudo ip netns exec vpn openconnect --protocol=gp '--useragent=PAN GlobalProtect' --allow-insecure-crypto '--user=YOURWORKGROUP\yourusername' --os=linux-64 --usergroup=gateway:prelogin-cookie --passwd-on-stdin url.url.com

#echo "netns-exec vpn parsecd"
