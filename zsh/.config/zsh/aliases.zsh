#!/usr/bin/env zsh

case ${OSTYPE} in
    linux*)
        (( ${+commands[apt]} )) && alias apt="sudo apt"
        (( ${+commands[yum]} )) && alias yum="sudo yum"
        (( ${+commands[dnf]} )) && alias dnf="sudo dnf"
        (( ${+commands[pacman]} )) && alias pacman="sudo pacman"
        (( ${+commands[systemctl]} )) && alias systemctl="sudo systemctl"
        (( ${+commands[ip]} )) && alias ip="ip --color=auto"
        (( ${+commands[grep]} )) && alias grep="grep --color=auto"
        ;;
    darwin*)
        if (( ${+commands[ggrep]} )); then
            alias grep="ggrep --color=auto"
            alias egrep="gegrep --color=auto"
            alias fgrep="gfgrep --color=auto"
        fi
        (( ${+commands[gxargs]} )) && alias xargs="gxargs"
        (( ${+commands[gfind]} )) && alias find="gfind"
        ;;
esac

(( ${+commands[bat]} )) && alias cat="bat"

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

if (( ${+commands[trash]} )); then
    alias rm="trash"
fi

abbr add -S -q h='helm'
abbr add -S -q hi='helm install'
abbr add -S -q hd='helm delete'
abbr add -S -q hl='helm ls'
abbr add -S -q hg='helm get'

abbr add -S -q k='kubectl'
abbr add -S -q --global kg='kubectl get'
abbr add -S -q kd='kubectl delete'
abbr add -S -q ka='kubectl apply'
abbr add -S -q kl='kubectl logs'

alias kgp="kubectl get pods"
alias kgs="kubectl get svc"
alias kge="kubectl get secrets"
alias kgc="kubectl get configmap"
alias kgd="kubectl get deployment"

abbr add -S -q kns='kubens'
abbr add -S -q kctx='kubectx'

abbr add -S -q tf='terraform'
abbr add -S -q tfa='terraform apply'
abbr add -S -q tfd='terraform destroy'
abbr add -S -q tg='terragrunt'
abbr add -S -q tga='terragrunt apply'
abbr add -S -q tgd='terragrunt destroy'
abbr add -S -q tgra='terragrunt run-all apply'
abbr add -S -q tgrd='terragrunt run-all destroy'

abbr add -S -q d='docker'
abbr add -S -q dps='docker ps'
abbr add -S -q dr='docker run -it --rm'
abbr add -S -q di='docker images'
abbr add -S -q drm='docker rm'
abbr add -S -q drmi='docker rmi'
abbr add -S -q drmia='docker rmi -f $(docker images -q)'
abbr add -S -q db='docker build'
abbr add -S -q dbp='docker build --build-arg HTTP_PROXY=http://host.docker.internal:3128 --build-arg HTTPS_PROXY=http://host.docker.internal:3128 -t'

abbr add -S -q we='watchexec -e'
abbr add -S -q py='python'
abbr add -S -q pip='python -m pip'

# cd to subdirs
alias -g ...="../.."
alias -g .3="../../.."
alias -g .4="../../../.."
alias -g .5="../../../../.."

alias sudo="nocorrect sudo"
alias mv="nocorrect mv -i"
alias cp="nocorrect cp -i"
alias mkdir="nocorrect mkdir"
alias man="nocorrect man"

alias vim=$EDITOR
alias vi=$EDITOR
alias v=$EDITOR
