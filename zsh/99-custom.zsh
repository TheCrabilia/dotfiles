if [[ $OSTYPE == darwin* ]]; then
    command -v terraform &>/dev/null && export TF_PLUGIN_CACHE_DIR="$HOME/.terraform.d/plugin-cache"

    # Pyenv
    export PYENV_ROOT="$HOME/.pyenv"
    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"

    # Nodenv
    eval "$(nodenv init -)"

    # Increase open file count limit
    ulimit -n 10240
fi
