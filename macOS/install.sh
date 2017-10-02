#! /bin/bash

### Install hidden files and directories ###

cd $HOME && echo "Going to $HOME..." >> $OLDPWD/setup.log
# Symlink important files
ln -sf $OLDPWD/.vimrc
ln -sf $OLDPWD/.zshrc
# Copy those files because they will be modified after installation
cp -r $OLDPWD/.fonts .
cp -r $OLDPWD/.vim .

# We assume Homebrew was installed before. If it is not the case, do it using
# /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Core packages
brew install wget curl git tree

# Oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
zsh --version > setup.log

# iTerm2
if [ ! -d /Application/iTerm.app ]; then
  wget https://iterm2.com/downloads/stable/latest -O iTerm.zip && \
    unzip iTerm.zip && \
    mv iTerm.app /Applications && \
    rm -r ./iTerm.zip && \
    echo "Done installing iTerm2." >> setup.log
fi

# Neobundle -> neocomplete, vim-airline
brew install vim --with-lua --with-python3 --with-override-system-vi
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

# Reload zsh configuration
source ~/.zshrc

# TODO: install docker via .dmg
# TODO: install code editors
# TODO: check .zshrc

echo "\n----- TODO -----\n"

echo "Install code editors\n"
echo "Install Monaco for Powerline font\n"
echo "Setup ssh\n"
