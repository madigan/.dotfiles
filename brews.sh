#!/usr/bin/env sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install stow
brew install git
brew install gh
brew install lazygit
brew install zsh zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting starship
brew install fzf bat
brew install ripgrep fd
brew install tmux neovim
brew install mise

brew install colima docker docker-completion
brew install flyctl
brew install --cask ghostty
brew install --cask font-hack-nerd-font
brew install --cask vscodium
