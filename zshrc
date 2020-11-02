#export ZSH="/home/ispirts/.oh-my-zsh"
HIST_STAMPS="dd.mm.yyyy"

#source $ZSH/oh-my-zsh.sh

# load custom modules
for file in $HOME/mtenv/zsh/*sh; do
        source $file
done;
