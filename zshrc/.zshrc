# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# zsh plugins
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh

source <(mise activate zsh)
source <(starship init zsh)
source <(fzf --zsh)

export FZF_DEFAULT_COMMAND='fd --type file --color=always --follow --hidden --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--ansi"

export PATH="/Users/john/.bun/bin:$PATH"
export PATH="$PATH:/Users/john/Applications/Visual\ Studio \ Code.app/Contents/Resources/app/bin"
alias lg=lazygit
alias nuke='rm -rf'
alias mid='date +%Y%m%d%H%M'
alias routes="bin/rails routes | fzf -e"
. "$HOME/.local/bin/env"

# pnpm
export PNPM_HOME="/Users/john/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# bit
case ":$PATH:" in
  *":/Users/john/bin:"*) ;;
  *) export PATH="$PATH:/Users/john/bin" ;;
esac
# bit end

# Added by Antigravity
export PATH="/Users/john/.antigravity/antigravity/bin:$PATH"

# Android Development
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Find Files Fast
ff() {
  rg "$1" --files-with-matches \
  | fzf --preview "rg \"$1\" -n -C 2 {}"
}

# GPG
export GPG_TTY=$(tty)

