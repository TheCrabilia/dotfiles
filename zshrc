if [[ -d $HOME/.mtenv ]]; then
	repo_folder=.mtenv
elif [[ -d $HOME/mtenv ]]; then
	repo_folder=mtenv
else
	echo "Please name downloaded repository root folder as mtenv or .mtenv and put it in home directory! Then try again!"
	exit 1
fi

# Load custom modules
for file in $HOME/$repo_folder/zsh/*.zsh; do
        source $file
done;

# Load Oh-My-Zsh libs
for file in $HOME/$repo_folder/zsh/omz_lib/*.zsh; do
        source $file
done;
