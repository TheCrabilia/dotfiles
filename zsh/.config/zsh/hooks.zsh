autoload -Uz add-zsh-hook

_autols () {
    emulate -L zsh
    (( ${+commands[exa]} )) && exa || ls
}
add-zsh-hook chpwd _autols

_swproxy () {
    if nc -z -w 1 aproxy.corproot.net 8080 &>/dev/null; then
        export HTTP_PROXY="http://aproxy.corproot.net:8080"
        export HTTPS_PROXY="http://aproxy.corproot.net:8080"
        export NO_PROXY="localhost,127.0.0.1/32,.swisscom.com,.swisscom.ch,.corproot.net,192.168.5.0/24"
        export http_proxy=$HTTP_PROXY
        export https_proxy=$HTTPS_PROXY
        export no_proxy=$NO_PROXY
    else
        unset HTTP_PROXY HTTPS_PROXY NO_PROXY http_proxy https_proxy no_proxy
    fi
}
# add-zsh-hook preexec _swproxy
