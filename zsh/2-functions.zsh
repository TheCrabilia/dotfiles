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

# add_alias k=kubectl,ka="kubectl apply",if:kubectl,tag:global
function add_alias() {
    [[ -z $1 ]] && { echo "Argument is not specified"; return; }

    declare -a aliases
    tokens=( "${(@s/,/)1}" )
    for token in ${tokens[@]}; do
        case $token in
            if:*)
                condition="${token#if:}"
                ;;
            tag:*)
                case ${token#tag:} in
                    global)
                        opt="-g"
                        ;;
                    suffix)
                        opt="-s"
                        ;;
                    *)
                        echo "Invalid tag specified"
                        exit 1
                        ;;
                esac
                ;;
            *=*)
                aliases+=( "$token" )
                ;;
        esac
    done

    if [[ ! -z $condition ]]; then
        for alias in $aliases; do
            if command -v $condition &>/dev/null && alias $opt $alias
        done
    else
        for alias in $aliases; do
            alias $opt $alias
        done
    fi

    unset aliases opt condition
}
