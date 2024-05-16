set -x XDG_DATA_HOME $HOME/.local/share
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_STATE_HOME $HOME/.local/state
set -x XDG_CACHE_HOME $HOME/.cache

set -x PATH \
    $HOME/.local/scripts \
    $HOME/.local/bin \
    $HOME/.cargo/bin \
    /opt/homebrew/bin \
    /opt/homebrew/sbin \
    /usr/local/bin \
    /usr/bin \
    /usr/sbin \
    /bin \
    /sbin

set -x SHELL (which fish)

set -l editors nvim vim vi nano
for editor in $editors
    if type -q $editor
        set -x EDITOR $editor
        break
    end
end

if type -q nc; and nc -z 127.0.0.1 3128 &>/dev/null
    set -x ALL_PROXY "http://127.0.0.1:3128"
    set -x HTTP_PROXY "http://127.0.0.1:3128"
    set -x HTTPS_PROXY "http://127.0.0.1:3128"
    set -x http_proxy "http://127.0.0.1:3128"
    set -x https_proxy "http://127.0.0.1:3128"
    set -x ftp_proxy "http://127.0.0.1:3128"
end
