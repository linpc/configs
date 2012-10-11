#!/bin/bash

function pause()
{
    echo -n "Are you sure you want to PUASE ? (yes/no) "
    read YN

    echo ${YN} | egrep -i '^yes$' > /dev/null
    if [ $? -ne 0 ]; then
	false
    else
	sudo -K
	sudo -l -p "[sudo] !!! Warning !!! password for %p@%h to PAUSE the machine: " > /dev/null && \
	xscreensaver-command --lock && sudo pm-suspend && \
	true
    fi
}
