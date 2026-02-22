#!/usr/bin/env sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install stow				# deploys these lovely dotfiles
brew install git				# version control
brew install gh					# github CLI
brew install lazygit				# git TUI
brew install zsh zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting starship
brew install fzf bat				# Better cat
brew install ripgrep fd
brew install tmux neovim
brew install mise				# 

brew install colima 				# Install container manager
brew install docker 				# Install docker CLI
brew install docker-completion			# Add auto-completion for the CLI

brew install flyctl				# CLI for fly.io deployments

brew install --cask ghostty			# Install a better terminal
brew install --cask font-hack-nerd-font		# Font for terminal & vscode

brew install --cask visual-studio-code		# IDE
brew install neovim				# Next IDE

brew install --cask obsidian			# Note Taking
mkdir -p ~/vaults				# Directory for Obsidian Vaults
