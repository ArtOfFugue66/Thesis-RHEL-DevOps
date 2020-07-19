#!/bin/bash
# $1 = guest details filename
# $2 = ansible inventory file
# $3 = system hosts file

# Get hostname from guest details file
guestname=`cat $1 | cut -d ' ' -f 2`
# Check if guestname already exists in ansible inventory file
guestInventory=`cat $2 | grep -w $guestname`
if [[ ! $guestInventory ]]; then
	# Add guest hostname to ansible inventory
	echo $guestname >> $2
fi
# Check if guestname already exists in system hosts file
guestHosts=`cat $3 | grep -w $guestname`
# if guestname is present in system hosts file
if [[ $guestHosts ]]; then
	# Delete previous guest details for given hostname
	sed -i "/$guestname/d" $3
fi
# Add guest details to system hosts file
cat $1 >> $3
