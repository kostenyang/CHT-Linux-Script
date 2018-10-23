#!/bin/bash

cp /etc/issue /tmp/issue.bak
today=$(date +"%Y%m%d")
echo $today
password="eCL@ud-""$today"
welcome="You are now accessing an information system of Chunghwa Telecom. As a condition of access to this system, you agree that your access will be monitored and logged and you will comply with applicable laws, orders, and Chunghwa Telecom's regulations. Any access without prior authorization might incur legal action taken by Chunghwa Telecom."
/bin/sed -i "s/$welcome/$password/g" /etc/issue
echo $password >> /etc/issue
echo "$password" "to issue" >> /etc/issue
echo $password | /bin/passwd --stdin root 
echo $password | /bin/passwd --stdin opuser
route=$(cat ifcfg-ens192 | grep IPADDR| awk -F '.' '{print $3}')
echo $route
tempGW="10.7.32.254"
vmGW="10.7.$route.254"
echo $vmGW

/sbin/service network stop
/bin/sed -i "s/$tempGW/$vmGW/g" /etc/sysconfig/network-scripts/route-ens192
/sbin/service network start

/bin/sed -i "/randompassword.sh/d" /etc/rc.local
mv -f /root/issue.bak /etc/issue
mv -f /root/randompassword.sh /tmp/randompassword.sh.bak
mv -f /etc/profile.d/ip.sh /tmp/ip.sh.bak
