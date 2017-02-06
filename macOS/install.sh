#! /bin/bash

# Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# Core packages
brew install wget curl git

# Oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
zsh --version > setup.log

# iTerm2
wget https://iterm2.com/downloads/stable/latest -O iTerm.zip && \
  unzip iTerm.zip && \
  mv iTerm.app /Applications/

### Install hidden files and directories ###

cd $HOME && echo "Going to $HOME..." >> setup.log
# Loop over files
for file in $(ls -a $OLDPWD); do
  case "$file" in
    ".git")         echo "Ignoring .git";;
    ".gitignore")   echo "Ignoring .gitignore";;
    "$0")           echo "Ignoring $0";;
    # Make symlinks from git repository to $HOME
    *)              ln -sf "$OLDPWD/$file";;
  esac
done

# Neobundle -> neocomplete, vim-airline
brew install vim --with-lua --with-python3 --with-override-system-vi
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

# Reload zsh configuration
source ~/.zshrc

# TODO: install docker via .dmg
# TODO: install code editors

echo "\n----- TODO -----\n"

echo "Install code editors\n"
echo "Install Monaco for Powerline font\n"
echo "Setup ssh\n"

echo "----- Optional -----\n"

