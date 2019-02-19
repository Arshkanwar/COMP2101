#!/bin/bash
#
# this script displays some host identification information for a simple Linux machine
# this version is specifically allowed to hardcode an interface name even though it is bad practice
#
# Sample output:
#   Hostname      : zubu
#   LAN Address   : 192.168.2.2
#   LAN Name      : net2-linux
#   External IP   : 1.2.3.4
#   External Name : some.name.from.our.isp

# the LAN info uses a hardcoded interface name of "enp0s3"
#    - change eno1 to whatever interface you  have and want to gather info about
# Improve this script by including the default router address and name
# Improve this script by including the network name

# we use the hostname command to get our system name
# the LAN name is looked up using the LAN address in case it is different from the system name
# finding external information relies on curl being installed and relies on live internet connection
# grep is used to filter ip command output so we don't have extra junk in our output
# stream editing with sed and awk are used to extract only the data we want displayed

#hostname -I
#$(getent hosts `curl -s icanhazip.com` | awk '{print $2}')
#Default router information ip route show | awk '/default/ {print $3}'
#GET netWork name
#ip -o link show | awk '{print $2,$9}'
#Default Router:
#Ip address    : $(hostname -I)
#LAN Address   : $(ip -4 addr show lo | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
#LAN Name      : $(getent hosts `ip a s eno1|grep 'inet '|awk '{print $2}'|sed 's,/.*,,'` | awk '{print $2}')
#Network       : $(getent networks | awk '{print $2}')


#echo "
#Hostname      : $(hostname)
#LAN Address   : $(hostname -I)
#LAN Name      : $(ip route show | awk '/default/ {print $5}')
#Router        : $(ip route show | awk '/default/ {print $3}')
#Router Name   : $(ip route show | awk '/default/ {print $5}')
#Network       : $(route | awk 'FNR == 4 {print $1}')
#Network Name  : $(ip route show | awk '/default/ {print $5}')
#External IP   : $(curl -s icanhazip.com)
#External Name : $(getent hosts `curl -s icanhazip.com` | awk '{print $2}')
#"


echo "
Hostname      : $(hostname)
LAN Address   : $(ip a s enp0s3|grep 'inet '|awk '{print $2}'|sed 's,/.*,,')
LAN Name      : $(getent hosts `ip a s enp0s3|grep 'inet '|awk '{print $2}'|sed 's,/.*,,'` | awk '{print $2}')
Router 	      : $(ip route | grep default | awk '{print $3}')
Router Name   : $(getent hosts `ip route|grep 'default '|awk '{print $3}'|sed 's,/.*,,'` | awk '{print $2}')
Network	      : $(ip route | awk '{print $1}' | grep 10 |sed 's,/.*,,')
Network Name  : $(getent hosts `ip route|awk '{print $1}'|grep 10 |sed 's,/.*,,'` | awk '{print $2}')
External IP   : $(curl -s icanhazip.com)
External Name : $(getent hosts `curl -s icanhazip.com` | awk '{print $2}')
"
