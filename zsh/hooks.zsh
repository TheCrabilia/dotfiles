chpwd() {
    ls
}

local new_line_before_prompt=no
local command_exec_timer=no

precmd() {
    # Print a new line before the prompt, but only if it is not the first line
    if [ "$new_line_before_prompt" = yes ]; then
		if [ -z "$_NEW_LINE_BEFORE_PROMPT" ]; then
			_NEW_LINE_BEFORE_PROMPT=1
		else
			print ""
		fi
    fi

	# Print command execution time if it took longer then 1 second
	if [[ $command_exec_timer = yes ]]; then
		if [ $timer ]; then
			local now=$(date +%s)
			local elapsed=$(($now-$timer))
			if [[ $elapsed > 1 ]]; then
				local min=$(($elapsed / 60))
				local sec=$(($elapsed % 60))
				local minutes
				local seconds

				[[ $min != 0 ]] && minutes="${min}m" || minutes=""
				seconds="${sec}s"
				exec_time="    ${minutes}${seconds}"
			else
				unset exec_time
			fi
			unset timer
		fi
	fi
}

preexec() {
	if [[ $command_exec_timer = yes ]]; then
		timer=$(date +%s)
	fi
}
