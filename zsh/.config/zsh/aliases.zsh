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

if (( ${+commands[exa]} )); then
    alias ls="exa"
    alias la="exa --long --all --git --group"
    alias lt="exa --long --git --group -snew"
    alias ll="exa --long --git --group"
else
    alias ls="ls --color=auto"
    alias la="ls -la"
    alias lt="ls -lt"
    alias ll="ls -l"
    alias l.="ls -ld .?*"
fi

if (( ${+commands[helm]} )); then
    alias h="helm"
    alias hi="helm install"
    alias hd="helm delete"
    alias hl="helm ls"
    alias hg="helm get"
fi

if (( ${+commands[kubectl]} )); then
    alias k="kubectl"
    alias ka="kubectl apply"
    alias kd="kubectl delete"
    alias kl="kubectl logs"
    alias kg="kubectl get"
fi

(( ${+commands[kubens]} )) && alias kns="kubens"
(( ${+commands[kubectx]} )) && alias kctx="kubectx"

if (( ${+commands[terraform]} )); then
    alias tf="terraform"
    alias tfa="terraform apply"
    alias tfd="terraform destroy"
fi

if (( ${+commands[terragrunt]} )); then
    alias tg="terragrunt"
    alias tga="terragrunt apply"
    alias tgd="terragrunt destroy"
fi

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
