switch (uname)
    case Linux
        abbr -a apt "sudo apt"
        abbr -a yum "sudo yum"
        abbr -a dnf "sudo dnf"
        abbr -a pacman "sudo pacman"
        abbr -a systemctl "sudo systemctl"
    case Darwin
end

# git
abbr -a g "git"
abbr -a ga "git add"
abbr -a gd "git diff"
abbr -a gf "git fetch"
abbr -a gp "git push"
abbr -a gpl "git pull"
abbr -a gr "git rebase"
abbr -a gs "git status"

# python
abbr -a py "python"
abbr -a pip "python -m pip"

# kubectl
abbr -a k "kubectl"
abbr -a kl "kubectl logs"
abbr -a klf "kubectl logs -f"
abbr -a ka "kubectl apply"
abbr -a kc "kubectl create"
abbr -a kd "kubectl delete"
abbr -a --position anywhere -- kg "kubectl get"

# helm
abbr -a h "helm"
abbr -a hi "helm install"
abbr -a hd "helm delete"
abbr -a hl "helm ls"

# kubectx & kubens
abbr -a kctx "kubectx"
abbr -a kns "kubens"

# terraform & terragrunt
abbr -a tf "terraform"
abbr -a tfa "terraform apply"
abbr -a tfd "terraform destroy"
abbr -a tg "terragrunt"
abbr -a tga "terragrunt apply"
abbr -a tgra "terragrunt run-all apply"
abbr -a tgd "terragrunt destroy"
abbr -a tgrd "terragrunt run-all destroy"

# watchexec
abbr -a we "watchexec -e"

# vi/vim -> nvim
abbr -a nvim --position command --regex "vim?" -- "nvim"

function last_history_item
    echo "$history[1]"
end
abbr -a !! --position anywhere --function last_history_item

abbr -a ... --position anywhere -- "../.."
abbr -a .... --position anywhere -- "../../.."
abbr -a ..... --position anywhere -- "../../../.."
abbr -a ...... --position anywhere -- "../../../../.."
