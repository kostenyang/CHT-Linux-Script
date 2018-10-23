#! /bin/bash
# Configure Domain Properties

#!bash/
cp /etc/issue /tmp/issue.bak
today=$(date +"%Y%m%d")
password="1qaz@WSX3edc""$RANDOM"
welcome="You are now accessing an information system of Chunghwa Telecom. As a condition of access to this system, you agree that your access will be monitored and logged and you will comply with applicable laws, orders, and Chunghwa Telecom's regulations. Any access without prior authorization might incur legal action taken by Chunghwa Telecom."
/bin/sed -i "s/$welcome/$password/g" /etc/issue
echo $password >> /etc/issue
#echo "$password" "to issue" >> /etc/issue
echo $password | /bin/passwd --stdin root 
echo $password | /bin/passwd --stdin opuser

