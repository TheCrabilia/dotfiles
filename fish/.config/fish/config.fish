if status is-interactive
    fzf --fish | source
    zoxide init fish --cmd cd | source
    mise activate fish | source
end
