# $FreeBSD: src/share/skel/dot.cshrc,v 1.13 2001/01/10 17:35:28 archie Exp $
#
# .cshrc - csh resource script, read at beginning of execution by each shell
#
# see also csh(1), environ(7).
#

# set prompt = "%B%n [%~] % "
set prompt = "%B%m%b [%~] -%n- "
set histfile="~/.config/.history"

alias cp	/bin/cp -i
alias rm	/bin/rm -i
alias mv	/bin/mv -i
alias h		history 25
alias j		jobs -l
alias l		less -W
alias t8	telnet -8L
alias c		clear
#alias scr	screen -D -R -c ~/.config/.screenrc
alias scr	screen -d -R -c ~/.config/.screenrc
alias sls	screen -ls
alias git-svn	git svn
alias dx	du -hd 0 .

# A righteous umask
#umask 66
umask 22

#set path = (/sbin /bin /usr/sbin /usr/bin /usr/games /usr/local/sbin /usr/local/bin $HOME/bin)
setenv PATH	$HOME"/bin":$PATH


setenv	EDITOR	vim
setenv	PAGER	less
setenv	BLOCKSIZE	K
setenv	LC_ALL	zh_TW.UTF-8
setenv	LANG	zh_TW.UTF-8
setenv	LSCOLORS	ExFxCxDxBxEgEdAbAgAcAd
setenv	NAME	"Po-Chien Lin"

# tin setting
setenv	TINRC		'-r'
setenv	TIN_HOMEDIR	~/.config

complete sudo 'p/1/c/'
complete man 'p/1/c/'
complete which 'p/1/c/'

if ($?prompt) then
	# An interactive shell -- set some stuff up
	set filec
	set history = 100
	set savehist = 100
#	set mail = (/var/mail/$USER)
	if ( $?tcsh ) then
#		set prompt = "%B%n@%m [%~] % "
##		set prompt = "%B%n [%~] % "
		bindkey "^W" backward-delete-word
		bindkey -k up history-search-backward
		bindkey -k down history-search-forward
	endif
#	if("$TERM" == "xterm" || "$TERM" == "xterm-color") then
##		set prompt = "%{\e]2\;%m [%/]^g\e]1;%m^g%}""$prompt"
#		set prompt = "%{\e]2\;bsd [%/]^g\e]1;%m^g%}""$prompt"
#	endif
endif

# if ($?WINDOW) then
# 	source ~/.config/.login
# endif

#colorful man
setenv LESS_TERMCAP_mb '[38;5;135m'	# begin blinking
setenv LESS_TERMCAP_md '[38;5;220m'	# begin bold
setenv LESS_TERMCAP_me '[0m'		# end mode
setenv LESS_TERMCAP_so '[38;5;225m'	# begin standout-mode - info box
setenv LESS_TERMCAP_se '[0m'		# end standout-mode
setenv LESS_TERMCAP_us '[2;1;4;32m'	# begin underline
setenv LESS_TERMCAP_ue '[0m'		# end underline

#os configuration
if( -f $HOME/.config/.csh/os/`uname -s`.cshrc ) then
	source $HOME/.config/.csh/os/`uname -s`.cshrc
endif

#hosts configuration
if( -f $HOME/.config/.csh/hosts/default.cshrc ) then
	source $HOME/.config/.csh/hosts/default.cshrc
endif
if( -f $HOME/.config/.csh/hosts/`hostname -s`.cshrc ) then
	source $HOME/.config/.csh/hosts/`hostname -s`.cshrc
endif
