#!/bin/bash

function deptest_install()
{
    local packname="$1"
    local packver="$2"
    local packtool="$3"

    if [ -z ${packtool} ]; then
	local packtool="pacman"
    fi

    ${packtool} -T "${packver}" > /dev/null
    if [ $? -ne 0 ]; then
	check_Y "\e[1;33m${packname}\e[m not installed, do you want to install it? (YES/no) "
	if [ $? -eq 1 ]; then
	    echo -e "Install \e[32m${packname}\e[m ..."
	    #sudo ${packtool} -S ${packname}
	    #sudo ${packtool} -S --noconfirm ${packname}
	    return 1
	else
	    return 127
	fi
    else
	echo -e "Check package \e[32m${packname}\e[m installed ... OK"
	return 0
    fi
}

sudo pacman -Syy

# This install script should download by git
# deptest_install "core/sudo" "sudo"
# deptest_install "core/openssh" "openssh"
# deptest_install "extra/git" "git"

deptest_install "extra/wicd" "wicd"
deptest_install "extra/wget" "wget"
deptest_install "extra/vim" "vim"
deptest_install "extra/ttf-dejavu" "ttf-dejavu"
deptest_install "extra/subversion" "subversion"
deptest_install "extra/lynx" "lynx"

deptest_install "community/xmonad" "xmonad"
deptest_install "community/xmonad-contrib" "xmonad-contrib"

deptest_install "extra/xorg-server" "xorg-server"
deptest_install "extra/xorg-xinit" "xorg-xinit"

deptest_install "extra/xf86-video-intel" "xf86-video-intel"
deptest_install "extra/xterm" "xterm"

# # vim /etc/pacman.conf

deptest_install "archlinuxfr/yaourt" "yaourt"

# Do the same thing with ``pacman -Syy'' ?
# sudo yaourt -Syy

deptest_install "aur/google-chrome" "google-chrome" "yaourt"
# aur/google-chrome

deptest_install "community/dmenu" "dmenu"
deptest_install "community/wqy-zenhei" "wqy-zenhei"

# # vim /etc/X11/xorg.conf.d/xorg.conf

deptest_install "community/rxvt-unicode" "rxvt-unicode"
deptest_install "extra/xorg-xrdb" "xorg-xrdb"
deptest_install "community/monaco-linux-font" "monaco-linux-font"
deptest_install "extra/bash-completion" "bash-completion"
deptest_install "extra/ntp" "ntp"
deptest_install "community/freerdp" "freerdp"

# # xclip

deptest_install "extra/xorg-xrandr" "xorg-xrandr"
deptest_install "community/ibus-chewing" "ibus-chewing"
deptest_install "community/ibus-qt" "ibus-qt"
deptest_install "extra/xscreensaver" "xscreensaver"
deptest_install "extra/conky" "conky"

deptest_install "extra/smplayer" "smplayer"
deptest_install "community/acpid" "acpid"
deptest_install "community/acpi" "acpi"
deptest_install "extra/pm-utils" "pm-utils"
deptest_install "community/filezilla" "filezilla"
deptest_install "extra/thunar" "thunar"
deptest_install "extra/thunar-volman" "thunar-volman"
# amixer
# # /usr/bin/gpasswd -a linpc audio

deptest_install "extra/alsa-utils" "alsa-utils"

deptest_install "aur/dzen2-xft-xpm-xinerama-svn" "dzen2-xft-xpm-xinerama-svn" "yaourt"
# aur/dzen2-xft-xpm-xinerama-svn

# # vim /etc/hostname
# # vim /etc/rc.conf
# # vim /etc/resolv.conf

deptest_install "community/xsel" "xsel"
deptest_install "extra/xorg-xev" "xorg-xev"
deptest_install "extra/xorg-xprop" "xorg-xprop"
deptest_install "extra/lftp" "lftp"
deptest_install "extra/screen" "screen"

# # vim /etc/X11/xorg.conf.d/xorg.conf

deptest_install "extra/feh" "feh>=2.6.3"

# # vim /etc/pacman.conf
# # vim /etc/pacman.d/mirrorlist

# wenquanyi
# way-microhei-lite

deptest_install "community/wqy-bitmapfont" "wqy-bitmapfont"

deptest_install "aur/cwtex-q-fonts" "cwtex-q-fonts" "yaourt"

deptest_install "extra/most" "most"

deptest_install "aur/nixnote" "nixnote" "yaourt"

deptest_install "extra/xpdf" "xpdf"
deptest_install "extra/gimp" "gimp"
deptest_install "extra/xorg-luit" "xorg-luit"
deptest_install "extra/xcompmgr" "xcompmgr"
#extra/libreoffice-common
#extra/libreoffice-impress
#extra/libreoffice-writer
#extra/libreoffice-zh-TW
deptest_install "libreoffice" "libreoffice-common"

# aur/texmaker
deptest_install "aur/texmaker" "texmaker" "yaourt"
deptest_install "community/gummi" "gummi"

deptest_install "extra/texlive-core" "texlive-core"
deptest_install "extra/texlive-langcjk" "texlive-langcjk"
deptest_install "extra/texlive-latexextra" "texlive-latexextra"

deptest_install "community/mosh" "mosh"
deptest_install "extra/xf86-input-keyboard" "xf86-input-keyboard"

deptest_install "extra/dmidecode" "dmidecode"
deptest_install "community/gitg" "gitg"
deptest_install "extra/scrot" "scrot"
deptest_install "extra/unrar" "unrar"
deptest_install "aur/ttf-ms-fonts" "ttf-ms-fonts" "yaourt"
deptest_install "core/openvpn" "openvpn" "pacman"
deptest_install "core/netcfg" "netcfg" "pacman"
deptest_install "community/openbsd-netcat" "openbsd-netcat" "pacman"
deptest_install "core/dnsutils" "dnsutils" "pacman"
deptest_install "extra/whois" "whois" "pacman"
deptest_install "extra/ctags" "ctags" "pacman"
deptest_install "community/sdcv" "sdcv" "pacman"
deptest_install "extra/unzip" "unzip" "pacman"
deptest_install "community/ffmpeg-compat" "ffmpeg-compat" "pacman"

