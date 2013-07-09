#!/bin/bash

CAT="/usr/bin/cat"

# locale
echo "Setting up locale..."
${CAT} >> /etc/locale.gen << EOF
en_US.UTF-8 UTF8
en_US ISO-8859-1  
EOF

/usr/sbin/locale-gen
export LANG=en_US.UTF-8

# network
echo "Setting up network..."
${CAT} >> /etc/resolv.conf << EOF
nameserver 140.113.235.1
nameserver 8.8.8.8
EOF

/usr/bin/ping -c 3 www.google.com
if [ $? -ne 0 ]; then
    echo -e "\e[1;31mNetwork not connected.\e[m DHCP seems not working well."
    check_Y "Do you want to setup wired networkd via \e[1;33mstatic IP\e[m ?"
    if [ $? -eq 1 ]; then
	if_card=`/sbin/ifconfig | sed -n 1p | awk '{print $1}'`
	if [ "${if_card}" != '' ]; then
	    read -p "  * static IP address: " ip_address
	    read -p "  * subnet mask: " subnet_mask
	    read -p "  * gateway IP address: " geteway_ip_address
	    echo "Setting up wired network..."
	    /usr/sbin/ip link set ${if_card} up
	    /usr/sbin/ip addr add ${ip_address}/${subnet_mask} dev ${if_card}
	    /usr/sbin/ip addr add ${ip_address}/${subnet_mask} dev ${if_card}
	else
	    # what kind of ethernet card ?
	fi

    else
	# setting up wireless network ?
	echo "Setting up wireless network..."
	wlan_card=`/usr/sbin/iwconfig 2>/dev/null | grep 'unassociated' | awk '{print $1}'`
	if [ "${waln_card}" != '' ]; then
	    /usr/sbin/ip link set ${wlan_card} up
	    /usr/bin/wifi-menu ${wlan_card}
	else
	    # what kind of ethernet card ?
	fi
    fi
else
    echo -e "\e[1;32Network connection has estibilished.\e[m"
fi

# disk partition
check_N "Default disk is \e[1;33m/dev/sda\e[m, is it right ? (yes/no) "
if [ $? -eq 1 ]; then
    # disk_name='none_exists'
    read -p "Please input your disk path: /dev/" disk_name
    while [ -b "/dev/${disk_name}" ]; do
	read -p "Please input your disk path: /dev/" disk_name
    done

    echo -e "Setting up disk path to \e[1;32m/dev/${disk_name}\e[m"
fi

disk_size=`/usr/sbin/parted /dev/${disk_name} print devices | grep "/dev/${disk_name}" | awk '{gsub(/\(|\)/, ""); print $2}'`

/usr/bin/sgdisk
