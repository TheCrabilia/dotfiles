## System specific aliases
case $OSTYPE in
    linux*)
        add_alias apt="sudo apt",if:apt
        add_alias pacman="sudo pacman",if:pacman
        add_alias yum="sudo yum",if:yum
        add_alias dnf="sudo dnf",if:dnf
        add_alias systemctl="sudo systemctl",if:systemctl

        # Enable color support
        add_alias grep="grep --color=auto"
        add_alias ip="ip --color=auto",if:ip
        ;;
    darwin*)
        # Shadow BSD utils, replace with GNU utils
        add_alias grep="ggrep --color=auto",if:ggrep
        add_alias egrep="gegrep --color=auto",if:gegrep
        add_alias fgrep="gfgrep --color=auto",if:gfgrep
        add_alias xargs="gxargs",if:gxargs
        add_alias find="gfind",if:gfind

        # Cool aliases
        add_alias browse="open -a /Applications/Firefox.app"
        ;;
esac

## Commonly used commands
if (( ${+commands[exa]} )); then
    add_alias ls="exa"
    add_alias la="exa --long --all --git --group"
    add_alias lt="exa --long --git --group -snew"
    add_alias ll="exa --long --git --group"
else
    add_alias ls="ls --color=auto"
    add_alias la="ls -la"
    add_alias lt="ls -lt"
    add_alias ll="ls -l"
    add_alias l.="ls -ld .?*"
fi

add_alias cat="bat",if:bat

# cd to sub-dirs
add_alias ...="../..",tag:global
add_alias ....="../../..",tag:global
add_alias .....="../../../..",tag:global

add_alias sudo="nocorrect sudo",if:sudo

# aliases for kubernetes tools
add_alias k="kubectl",ka="kubectl apply",kd="kubectl delete",kl="kubectl logs",kg="kubectl get",if:kubectl
add_alias h="helm",hi="helm install",hd="helm delete",hl="helm ls",hg="helm get",if:helm
add_alias kns="kubens",if:kubens
add_alias kctx="kubectx",if:kubectx

# docker
add_alias d="docker",di="docker images",dn="docker network",dc="docker compose",db="docker build",if:docker

# ansible
add_alias a="ansible",ap="ansible-playbook",if:ansible

# terraform & terragrunt
add_alias tf="terraform",tfa="terraform apply",tfd="terraform destroy",if:terraform
add_alias tg="terragrunt",tga="terragrunt apply",tgd="terragrunt destroy",tgra="terragrunt run-all apply",tgrd="terragrunt run-all destroy",if:terragrunt

## Nocorrect aliases
add_alias mv="nocorrect mv -i"
add_alias cp="nocorrect cp -i"
add_alias mkdir="nocorrect mkdir"
add_alias man="nocorrect man"

# vim -> nvim if it exists
add_alias vim="nvim",if:nvim
