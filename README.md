# dotfiles

macOS dotfiles managed with [yadm](https://yadm.io).

## New machine setup

**1. Install Homebrew**

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval $(/opt/homebrew/bin/brew shellenv)
```

**2. Install yadm and clone**

```sh
brew install yadm
yadm clone https://github.com/Falinor/configs.git
```

yadm will automatically run `.config/yadm/bootstrap`, which installs all packages, oh-my-zsh, vim, and Claude Code.

## After setup

- **Git identity** — the bootstrap script will prompt for your name and email, saved locally to `~/.gitconfig.local` (not tracked)
- **SSH keys** — copy `~/.ssh/` from your old machine manually
- **Credentials** — `.sentryclirc`, `.npmrc`, `.netrc`, `.clever.json` are not tracked; set them up manually
- **VSCode** — sign into Settings Sync to restore extensions and settings
- **Switch yadm remote to SSH** once your keys are in place:
  ```sh
  yadm remote set-url origin git@github.com:Falinor/configs.git
  ```

## Updating packages

```sh
brewup        # alias for: brew update && brew upgrade
```
