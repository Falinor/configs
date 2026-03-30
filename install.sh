#!/bin/bash
# Bootstrap a new Mac.
# Run this once, then yadm takes over.

# 1. Install Homebrew
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval $(/opt/homebrew/bin/brew shellenv)

# 2. Install yadm
brew install yadm

# 3. Clone dotfiles — yadm will automatically run .config/yadm/bootstrap
yadm clone https://github.com/Falinor/configs.git
