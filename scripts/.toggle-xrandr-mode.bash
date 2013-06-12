#!/bin/bash

if [ -f "/home/linpc/.screen-mode" ]; then
	xr=`cat /home/linpc/.screen-mode`;
else
	xr='lvds-vga'
fi

case $xr in
	'lvds-vga')
		xr='mirror'
		;;
	'mirror')
		xr='lvds'
		;;
	'lvds')
		xr='lvds-vga'
		;;
	*)
		xr='lvds-vga'
		;;
esac

/home/linpc/bin/xr "${xr}"
echo "${xr}" > /home/linpc/.screen-mode
