function sshagent() {
    if [[ -z $SSH_AGENT_PID ]]; then
        eval $(ssh-agent)
    fi
    ssh-add $HOME/.ssh/id_rsa
}
