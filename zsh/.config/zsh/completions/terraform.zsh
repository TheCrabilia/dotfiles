complete -o nospace -C "$(mise which terraform 2>/dev/null || echo terraform)" terraform
