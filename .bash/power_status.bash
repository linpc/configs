function get_power_status()
{
    if [ $((COLUMNS)) -le 75 ]; then
	echo -ne "\r"
	return
    fi

#    eval $POWER_COMMAND;
    local POWER=`acpi`
    local SIGN1=$(echo $POWER | awk '{print $5}')
    local SIGN2=$(echo $POWER | awk '{print $6}')
    local R=$(echo $POWER | awk '{print $4,"["$5"]"}' | sed -e 's/,//' | sed -e 's/\[\]//')

    if [ "$SIGN1" = 'remaining' ]; then
	local color="\e[5m${xRED}"
	local charge="Run Out of Power"
    elif [ "$SIGN2" = 'until' ]; then
	local color="${xred}"
	local charge="C $R"
    elif [ "$SIGN2" = 'remaining' ]; then
	local color="${xgreen}"
	local charge="$R"
    else
	local color="${xGREEN}"
	local charge="Charge Complete"
    fi

    local power_length=$(echo -n "$charge"|wc -c)
    local span_length=$((COLUMNS - $power_length))
    echo -ne "\r\e[${span_length}C${color}$charge${xENDC}\r"
}

 
