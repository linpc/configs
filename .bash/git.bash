function git_branch
{
#    ref=$(git symbolic-ref HEAD 2> /dev/null) || return;
    ref=$(git symbolic-ref HEAD 2> /dev/null)
    if [ -z "${ref}" ]; then
	ref=$(git branch -a 2> /dev/null | grep '^*') || return;
	br="${ref#* }";
	if [ "${br}" = '(no branch)' ];then
	    head=$(git rev-parse HEAD | cut -c1-7)
	    echo "(no branch:${head})"
	fi
	return
    fi
    echo "("${ref#refs/heads/}")";
}

function git_since_last_commit
{
    now=`date +%s`;
    last_commit=$(git log --pretty=format:%at -1 2> /dev/null) || return;
    seconds_since_last_commit=$((now-last_commit));
    minutes_since_last_commit=$((seconds_since_last_commit/60));
    hours_since_last_commit=$((minutes_since_last_commit/60));
    minutes_since_last_commit=$((minutes_since_last_commit%60));

  if [ ${hours_since_last_commit} -le 24 ]; then
      echo " ${hours_since_last_commit}h${minutes_since_last_commit}m ";
  else
      days_since_last_commit=$((hours_since_last_commit/24));
      hours_since_last_commit=$((hours_since_last_commit%24));
      echo " ${days_since_last_commit}d${hours_since_last_commit}h ";
  fi
}

