chpwd() {
    command -v exa &>/dev/null && exa || ls
}

local new_line_before_prompt=no
local command_exec_timer=yes
local aws_profile_prompt=yes
local auto_set_proxy=yes

precmd() {
    if [[ $new_line_before_prompt == "yes" ]]; then
        if [[ -z "$_NEW_LINE_BEFORE_PROMPT" ]]; then
            _NEW_LINE_BEFORE_PROMPT=1
        else
            print ""
        fi
    fi

    if [[ $command_exec_timer == "yes" ]]; then
        if [[ $timer ]]; then
            local now=$(date +%s)
            local elapsed=$(( $now - $timer ))

            if [[ $elapsed -gt 59 ]]; then
            local min=$(( $elapsed / 60 ))
            local sec=$(( $elapsed % 60 ))
            exec_time="${min}m${sec}s"
            elif [[ $elapsed -gt 1 ]]; then
            exec_time="${elapsed}s"
            else
            unset exec_time
            fi
            unset timer
        fi
    fi

    if [[ $aws_profile_prompt == "yes" ]]; then
        if [[ ! -z $AWS_PROFILE ]]; then
            export AWS_PROFILE_PROMPT="${AWS_PROFILE}:"
        else
            unset AWS_PROFILE_PROMPT
        fi
    fi

    if [[ $auto_set_proxy == "yes" ]]; then
        swproxy
    fi
}

preexec() {
    if [[ $command_exec_timer == "yes" ]]; then
        timer=$(date +%s)
    fi
}
