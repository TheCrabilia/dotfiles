if [[ $OSTYPE == darwin* ]]; then
    command -v terraform &>/dev/null && export TF_PLUGIN_CACHE_DIR="$HOME/.terraform.d/plugin-cache"

    # Increase open file count limit
    ulimit -n 10240
fi
