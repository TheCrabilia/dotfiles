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
