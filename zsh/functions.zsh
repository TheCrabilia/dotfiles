function sshagent() {
    if [[ -z $SSH_AGENT_PID ]]; then
        eval $(ssh-agent)
    fi
    ssh-add $HOME/.ssh/id_rsa
}

function timezsh() {
    shell=${1-$SHELL}
    for i in {1..10}; do /usr/bin/time $shell -i -c exit; done
}

function et() {
    if [[ -z $exec_time ]]; then
        return
    fi
    echo $exec_time
}

function flushdns() {
    if [[ $OSTYPE == darwin* ]]; then
        sudo dscacheutil -flushcache
        sudo killall -HUP mDNSResponder
    else
        sudo killall -HUP dnsmasq
    fi
}
