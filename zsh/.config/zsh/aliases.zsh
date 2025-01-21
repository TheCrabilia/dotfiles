#!/usr/bin/env zsh

_alias() {
    if (( ${+commands[$1]} )); then
        alias "$2"
    fi
}

case ${OSTYPE} in
    linux*)
        _alias apt apt="sudo apt"
        _alias yum yum="sudo yum"
        _alias dnf="sudo dnf"
        _alias pacman pacman="sudo pacman"
        _alias systemctl systemctl="sudo systemctl"
        _alias ip ip="ip --color=auto"
        _alias grep grep="grep --color=auto"
        ;;
    darwin*)
        _alias ggrep grep="ggrep --color=auto"
        _alias ggrep egrep="gegrep --color=auto"
        _alias ggrep fgrep="gfgrep --color=auto"
        _alias gxargs xargs="gxargs"
        _alias gfind find="gfind"
        ;;
esac

_alias bat cat="bat"

if (( ${+commands[eza]} )); then
    alias ls="eza"
    alias la="eza --long --all --git --group"
    alias lt="eza --long --git --group -snew"
    alias ll="eza --long --git --group"
else
    alias ls="ls --color=auto"
    alias la="ls -la"
    alias lt="ls -lt"
    alias ll="ls -l"
    alias l.="ls -ld .?*"
fi

_alias trash rm="trash"

_alias helm h='helm'
_alias helm hi='helm install'
_alias helm hd='helm delete'
_alias helm hl='helm ls'
_alias helm hg='helm get'

_alias kubectl k='kubectl'
_alias kubectl kg='kubectl get'
_alias kubectl ka='kubectl apply'
_alias kubectl kd='kubectl delete'
_alias kubectl kl='kubectl logs'
_alias kubectl kgp='kubectl get pods'
_alias kubectl kgs='kubectl get svc'
_alias kubectl kge='kubectl get secrets'
_alias kubectl kgc='kubectl get cm'
_alias kubectl kgd='kubectl get deploy'

_alias kubens kns='kubens'
_alias kubectx kctx='kubectx'

_alias terraform tf='terraform'
_alias terraform tfa='terraform apply'
_alias terraform tfd='terraform destroy'

_alias tofu tf='tofu'
_alias tofu tfa='tofu apply'
_alias tofu tfd='terraform destroy'

_alias terragrunt tg='terragrunt'
_alias terragrunt tga='terragrunt apply'
_alias terragrunt tgd='terragrunt destroy'
_alias terragrunt tgra='terragrunt run-all apply'
_alias terragrunt tgrd='terragrunt run-all destroy'

_alias docker d='docker'
_alias docker dps='docker ps'
_alias docker dr='docker run -it --rm'
_alias docker di='docker images'
_alias docker drm='docker rm'
_alias docker drmi='docker rmi'
_alias docker drmia='docker rmi -f $(docker images -q)'
_alias docker db='docker build'
_alias docker dbp='docker build --build-arg HTTP_PROXY=http://host.docker.internal:3128 --build-arg HTTPS_PROXY=http://host.docker.internal:3128 -t'

_alias watchexec we='watchexec -e'

_alias python py='python'
_alias python pip='python -m pip'

alias -g G='| grep'

# cd to subdirs
alias -g ...="../.."
alias -g ....="../../.."
alias -g .....="../../../.."
alias -g ......="../../../../.."

alias sudo="nocorrect sudo"
alias mv="nocorrect mv -i"
alias cp="nocorrect cp -i"
alias mkdir="nocorrect mkdir"
alias man="nocorrect man"

alias vim=$EDITOR
alias vi=$EDITOR
alias v=$EDITOR
