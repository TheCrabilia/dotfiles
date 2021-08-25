chpwd() {
    ls
}

local new_line_before_prompt=yes
precmd() {
    # Print a new line before the prompt, but only if it is not the first line
    if [ "$new_line_before_prompt" = yes ]; then
		if [ -z "$_NEW_LINE_BEFORE_PROMPT" ]; then
			_NEW_LINE_BEFORE_PROMPT=1
		else
			print ""
		fi
    fi

	# Print command execution time if it took longer then 2 seconds
	if [ $timer ]; then
		now=$(date +%s)
		elapsed=$(($now-$timer))
		if [[ $elapsed > 2 ]]; then
			exec_time="    ${elapsed}s"
		else
			unset exec_time
		fi
		unset timer
	fi
}

preexec() {
	timer=$(date +%s)
}
