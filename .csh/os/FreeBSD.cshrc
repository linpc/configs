alias ls	/bin/ls -FG
alias la	ls -a
#alias lf	ls -FA
alias ll	ls -lA
alias top	/usr/local/bin/top -a
alias top3	/usr/local/bin/top -a -s30
alias ssh	/usr/bin/ssh -CA
alias p		'/bin/ps aux | grep -v ^root | sort | /usr/bin/less'
alias sc	'/usr/bin/who | /usr/bin/cut -d\  -f 1 | /usr/bin/sort | /usr/bin/uniq -c | /usr/bin/sort -n'
alias 'sudo vim'	'sudo vim -u ~linpc/.vimrc'
alias wcount	'who | awk '\''{print $1}'\''  | sort | uniq -c | sort -n'
