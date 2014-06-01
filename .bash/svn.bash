function svn_branch
{
#    ref=$(git symbolic-ref HEAD 2> /dev/null) || return;
    info=$(svn info 2> /dev/null) || return;
    wcrp=$(echo "$info" | grep '^Working Copy Root Path')
    revision=$(echo "$info" | grep '^Revision')
    echo "(r"${revision#Revision: }")";
}

function svn_since_last_commit
{
    last_changed_date=$(svn info 2> /dev/null | grep 'Last Changed Date') || return;
    last_changed_date=${last_changed_date#Last Changed Date: }
    last_changed_date=${last_changed_date%% (*}

    now=`date +%s`;
    last_changed=`date -j -f "%Y-%m-%d %T %z" "${last_changed_date}" "+%s"`
    seconds_since_last_commit=$((now-last_changed));
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

