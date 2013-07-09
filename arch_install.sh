#!/bin/bash

ABS_DIR=`dirname ${PWD}/$0`


function check_YN()
{
    local prompt="$1"
    # if $2 not provided, then use ``check_Y''
    local defaultY=${2:=1}
    local YN

    while [ -z ${YN} ]; do
	# read -p "${prompt}" YN
	echo -ne "${prompt}"
	read YN
    done

    if [ ${defaultY} -ne 0 ]; then
	# default 'Y' is not expected to match 'No'.
	# So, if matching successfully, return false
	echo ${YN} | egrep -i '^no?$' > /dev/null
    else
	# default 'N' is not expected to match 'Yes'.
	# So, if matching successfully, return false
	echo ${YN} | egrep -i '^y(es)?$' > /dev/null
    fi

    # if matching successfully, then return false
    if [ $? -eq 0 ]; then
	return 0
    else
	return 1
    fi
}

# return 0: got 'No'
# return 1: got 'Yes'
function check_Y()
{
    check_YN "$1" 1
    return $?
}

# return 0: got 'Yes'
# return 1: got 'No'
function check_N()
{
    check_YN "$1" 0
    return $?
}

check_Y "Do you want to install suggested packages? (Y/N) "
if [ $? -eq 1 ]; then
    echo -e "\e[1;31mInstall packages...\e[m"
    . ${ABS_DIR}/.arch_install/install_packages.sh
    echo -e "\e[1;36mInstall packagesi process done\e[m"
else
    echo -e "\e[1;33mCancel install packages.\e[m"
fi

check_N "Do you want to make configs links to their propper location? (Y/N) "
if [ $? -eq 1 ]; then
    echo -e "\e[1;33mNot install links\e[m"
else
    echo -e "\e[1;31mInstall configs links...\e[m"
#    . ${ABS_DIR}/.arch_install/install_configs.sh
    echo -e "\e[1;36mInstall configs links process done\e[m"
fi
