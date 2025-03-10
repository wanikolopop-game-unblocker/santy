#!/bin/bash

# URL resources
IPECHO=http://ipecho.net/plain
PIA_OPENVPN_CFGS=https://www.privateinternetaccess.com/openvpn/openvpn-strong.zip

rm -rf setup_pia_vpn
mkdir setup_pia_vpn
curl --output setup_pia_vpn/openvpn-strong.zip -L --silent https://www.privateinternetaccess.com/openvpn/openvpn-strong.zip
cd setup_pia_vpn
unzip -qq openvpn-strong.zip

VPN_LIST=(*.ovpn)
vpn_list_length=${#VPN_LIST[@]}
rand_vpn=$[$RANDOM % $vpn_list_length]
echo "PIA VPN USING " ${VPN_LIST[$rand_vpn]}
cp ${VPN_LIST[$rand_vpn]} ../con.ovpn

echo "Detecting your current public IP address"
curl -s http://ipecho.net/plain
