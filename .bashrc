#
cd "${HOME}"
#
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
alias SYNC="sync; sync; sync"
alias c="clear"
alias cd..="cd .."
alias j="jobs"
alias f="finger"
alias g="grep --color=auto"
alias more="most"
alias ssh="ssh -4 -C -e none -v"
alias t="telnet"
alias 8="ping 8.8.8.8"

alias xev="xev | grep -A2 --line-buffered '^KeyRelease' | sed -n '/keycode /s/^.*keycode \([0-9]*\).* (.*, \(.*\)).*$/\1 \2/p'"

#
export BLOCKSIZE="k"
export EDITOR="vim"
export GIT_PAGER="less"
#export LESS="-EfmrSwX"
export LSCOLORS="gxfxcxdxbxegedabagacad"
export PATH="$HOME/bin:/usr/local/sbin:/usr/sbin:/sbin:$PATH"
export PERL_CPANM_OPT="--mirror http://cpan.nctu.edu.tw/ --mirror http://cpan.cpantesters.org/"
export GOPATH="$HOME/code/Go:$HOME/code/Go/sort_project:$HOME/code/Go/smp_project"

#colorful man
export LESS_TERMCAP_mb='[38;5;135m'	# begin blinking
export LESS_TERMCAP_md='[38;5;220m'	# begin bold
export LESS_TERMCAP_me='[0m'		# end mode
export LESS_TERMCAP_so='[38;5;225m'	# begin standout-mode - info box
export LESS_TERMCAP_se='[0m'		# end standout-mode
export LESS_TERMCAP_us='[2;1;4;32m'	# begin underline
export LESS_TERMCAP_ue='[0m'		# end underline

#
if [ -z "${LANG}" ]; then
    export LANG="en_US.UTF-8"
fi
if [ -x /usr/local/bin/most -o -x /usr/bin/most ]; then
    export PAGER="less"
else
    export PAGER="less"
fi

#
shopt -s checkwinsize
shopt -s histappend

#
if [ "`uname -s`" == "FreeBSD" -o "`uname -s`" == "Darwin" ]; then
    alias ls="/bin/ls -aFG"
    alias w="/usr/bin/w -i"
elif [ "`uname -s`" == "Linux" ]; then
    alias which="alias | which -i"
#    alias ls="/bin/ls -aF --color=always"
    alias ls="/bin/ls -F --color=always"
else
    alias ls="/bin/ls -aF"
fi

#

. ~/.myconfig/.bash/color.bash
. ~/.myconfig/.bash/power_status.bash
. ~/.myconfig/.bash/pause.bash
. ~/.myconfig/.bash/git.bash
. ~/.myconfig/.bash/svn.bash

if [ -z "$WINDOW" ]; then
PROMPT_COMMAND='\
    if [ $? -eq 0 ]; then \
	RR="\e[32mo\e[0m"; \
    else 
	RR="\e[31mx\e[0m"; \
    fi; \
    echo -ne "$RR "; \
'
#   myPS="${ENDC}${green}\u${ENDC}@${cyan}\h${ENDC} [${green}\w${ENDC}] [${cyan}\A${ENDC}] "
   myPS="${ENDC}${green}\u${ENDC}@${cyan}\h${ENDC} [${green}\w${ENDC}]${yellow}\$(git_since_last_commit)${CYAN}\$(git_branch)${ENDC} " 

   mtype=`echo \`hostname\` | awk '{print substr($0, length -1, 2)}'`

    if [ "$mtype" = "NB" ]; then
	PS1="\\[\$(get_power_status)\\]\\[\e[2C\\]${myPS}"
    else
	PS1="${myPS}"
    fi

#    if [ $((COLUMNS)) -le 75 ]; then
#	PS1="\u [\w] \n$ "
#    fi
else
    PS1='\[\e[0m\e[32m\]\u\[\e[0m\]@\[\e[36m\]\h\[\e[0m\] [\[\e[32m\]\w\[\e[0m\]] [\[\e[36m\]\A\[\e[0m\]/\[\e[36m\]W$WINDOW\[\e[0m\]] '
fi

#
# [[ -s "$HOME/.pythonbrew/etc/bashrc" ]] && source "$HOME/.pythonbrew/etc/bashrc"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
# [[ -s "$HOME/perl5/perlbrew/etc/bashrc" ]] && source "$HOME/perl5/perlbrew/etc/bashrc"

#
[[ -s "/etc/bash_completion" ]] && source "/etc/bash_completion"
[[ -s "/usr/local/etc/bash_completion" ]] && source "/usr/local/etc/bash_completion"

[[ -s "$HOME/.bashrc.local" ]] && source "$HOME/.bashrc.local"


PATH="$PATH:$HOME/.rvm/bin"	# Add RVM to PATH for scripting

# vi mode
set -o vi
bind -m vi-insert "C-l":clear-screen
# bind -m vi-insert "jj":vi-movement-mode
bind -m vi-insert 'C-a':beginning-of-line
bind -m vi-insert "C-n":history-search-backward
bind -m vi-insert "C-x":history-search-forward
