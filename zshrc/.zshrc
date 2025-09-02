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
alias lg=lazygit
alias code=codium
alias mid='date +%Y%m%d%H%M'
. "$HOME/.local/bin/env"
