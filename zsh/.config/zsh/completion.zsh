## Completion
zstyle ':completion:*' completer _extensions _complete

# Enable caching
zstyle ':completion::complete:*' use-cache on
zstyle ':completion:*' cache-path $XDG_CACHE_HOME/zsh/zcompcache

# Group matches and describe.
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:corrections' format '%F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*' verbose yes
zstyle ':completion:*' complete-options no

zstyle ':completion:*' matcher-list '' 'r:|?=**'

# Ignore useless commands and functions
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec)|prompt_*)'
# Array completion element sorting.
zstyle ':completion:*:*:-subscript-:*' tag-order 'indexes' 'parameters'

# Directories
if (( ${+LS_COLORS} )); then
    zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
else
    # Use same LS_COLORS definition from utility module, in case it was not set
    zstyle ':completion:*:default' list-colors ${(s.:.):-di=1;34:ln=35:so=32:pi=33:ex=31:bd=1;36:cd=1;33:su=30;41:sg=30;46:tw=30;42:ow=30;43}
fi
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
zstyle ':completion:*' squeeze-slashes true

# History
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes

# Populate hostname completion.
zstyle -e ':completion:*:hosts' hosts 'reply=(
    ${=${=${=${${(f)"$(cat {/etc/ssh/ssh_,~/.ssh/}known_hosts{,2} 2>/dev/null)"}%%[#| ]*}//\]:[0-9]*/ }//,/ }//\[/ }
    ${=${(f)"$(cat /etc/hosts 2>/dev/null; ypcat hosts 2>/dev/null)"}%%(\#)*}
    ${=${${${${(@M)${(f)"$(cat ~/.ssh/config{,.d/*(N)} 2>/dev/null)"}:#Host *}#Host }:#*\**}:#*\?*}}
)'

# Don't complete uninteresting users...
zstyle ':completion:*:*:*:users' ignored-patterns \
    '_*' adm amanda apache avahi beaglidx bin cacti canna clamav daemon dbus \
    distcache dovecot fax ftp games gdm gkrellmd gopher hacluster haldaemon \
    halt hsqldb ident junkbust ldap lp mail mailman mailnull mldonkey mysql \
    nagios named netdump news nfsnobody nobody nscd ntp nut nx openvpn \
    operator pcap postfix postgres privoxy pulse pvm quagga radvd rpc rpcuser \
    rpm shutdown squid sshd sync uucp vcsa xfs

# ... unless we really want to.
zstyle ':completion:*' single-ignored show

# Ignore multiple entries.
zstyle ':completion:*:(rm|kill|diff):*' ignore-line other
zstyle ':completion:*:rm:*' file-patterns '*:all-files'

# Man
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true

autoload -Uz compinit && compinit -C -d $XDG_CACHE_HOME/zsh/zcompdump

# Docker
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

# Load external tool completions
for f in $(ls ${0:h:a}/completions/*.zsh); do
    cmd=$(basename "${f%.zsh}")
    if (( ${+commands[$cmd]} )); then
        source "${f}"
    fi
done
