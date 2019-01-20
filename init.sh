DOTFILES_ROOT=$(pwd -P)

git pull origin master
git submodule update --init --recursive

for src in $(find -H "$DOTFILES_ROOT" -maxdepth 2 -name '.*' -not -path '*.git*')
do
	ln -s $src $HOME
done

ln -s $DOTFILES_ROOT/bin $HOME
ln -s $DOTFILES_ROOT/init $HOME
ln -s $DOTFILES_ROOT/.gitconfig $HOME

# Install Nerd fonts for iterm/nvim
git clone https://github.com/ryanoasis/nerd-fonts
cd nerd-fonts
sh install.sh
cd ..
rm -rf nerd-fonts

xcode-select --install
sh brew.sh
sh .macos

source .bash_profile
