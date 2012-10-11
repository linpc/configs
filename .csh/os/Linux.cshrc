alias ls	/bin/ls -F --color
alias la	ls -a
# alias lf	ls -F
alias ll	ls -l
alias top3	/usr/bin/top -d 30
alias p		"ps aux | grep -v ^root | sort | less"
alias sc	'/usr/bin/who | /usr/bin/cut -d\  -f 1 | /usr/bin/sort | /usr/bin/uniq -c | /usr/bin/sort -n'
alias quota	'/usr/bin/quota -Qv'
alias 'quota-h'	'/usr/bin/quota -Qvs'
alias wcount	'who | awk '\''{print $1}'\''  | sort | uniq -c | sort -n'
