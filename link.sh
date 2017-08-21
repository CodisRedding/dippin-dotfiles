DOTFILES_ROOT=$(pwd -P)

for src in $(find -H "$DOTFILES_ROOT" -maxdepth 2 -name '.*' -not -path '*.git*')
do
	ln -s $src $HOME
done

ln -s $DOTFILES_ROOT/bin $HOME
ln -s $DOTFILES_ROOT/fonts $HOME
ln -s $DOTFILES_ROOT/init $HOME
ln -s $DOTFILES_ROOT/.gitconfig $HOME

source ~/.bash_profile
