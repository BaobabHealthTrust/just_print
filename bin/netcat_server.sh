#!/bin/sh

#
# Print Server
#
# place this file in /usr/local/sbin/
# and call it at start up from /etc/rc.local 
# nohup /usr/local/sbin/netcat_server.sh &
#

PORT=$1
DEVICE=$2

while true
do
#  netcat -l -p4242 > /dev/usblp0
#  netcat -l -p4342 > /dev/lp0 
#  netcat -l -p4243 > /dev/usblp1
  netcat -l -p$PORT > /dev/$DEVICE
done
