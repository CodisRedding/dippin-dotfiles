# fork repo

# cd path/where/you/keep/code (ex ~/dotfiles)

# install
for me
```
bash -c "$(curl -H 'Cache-Control: no-cache' -fsSL http://bit.ly/dippin-dotfiles)"
```

for you
```
export DOTFILES_GH_USER=<username>
export DOTFILES_GH_BRANCH=master
bash -c "$(curl -fsSL https://raw.githubusercontent.com/$DOTFILES_GH_USER/dippin-dotfiles/$DOTFILES_GH_BRANCH/bootstrap.sh)"
```
