#! /bin/bash

# Install homebrew
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> /Users/inad/.zprofile
eval $(/opt/homebrew/bin/brew shellenv)

### Install hidden files and directories ###

cd $HOME && echo "Going to $HOME..." >> $OLDPWD/setup.log
# Symlink important files
ln -sf $OLDPWD/.gitconfig
ln -sf $OLDPWD/.vimrc
ln -sf $OLDPWD/.zshrc
# Copy those files because they will be modified after installation
cp -r $OLDPWD/.fonts .
cp -r $OLDPWD/.vim .

# Core packages
brew install wget curl git tree jq thefuck tldr yarn nvm
brew tap homebrew/cask-fonts
brew install --cask font-fira-code

# Oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
zsh --version > $OLDPWD/setup.log

# Install iTerm2
brew install --cask iterm2

# Install vim
# https://github.com/amix/vimrc
brew install vim
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

# Install docker
brew install --cask docker

# Reload zsh configuration
source ~/.zshrc

echo "\n----- TODO -----\n"
echo "Install code editors\n"
