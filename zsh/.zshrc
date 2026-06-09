
# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/max/.lmstudio/bin"
# End of LM Studio CLI section

export PATH="$HOME/.local/bin:$PATH"

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# XDG base directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# Starship prompt
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
export STARSHIP_THEME="nord"
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
  starship config palette "$STARSHIP_THEME" >/dev/null 2>&1
fi

# Better shell UX
command -v fzf >/dev/null 2>&1 && source <(fzf --zsh) 2>/dev/null
command -v zoxide >/dev/null 2>&1 && eval "$(zoxide init zsh)"

# zsh plugins from Homebrew
if command -v brew >/dev/null 2>&1; then
  ZSH_HIGHLIGHT="$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
  ZSH_AUTOSUGGEST="$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
  [ -f "$ZSH_HIGHLIGHT" ] && source "$ZSH_HIGHLIGHT"
  [ -f "$ZSH_AUTOSUGGEST" ] && source "$ZSH_AUTOSUGGEST"
fi

# Aliases
command -v eza >/dev/null 2>&1 && alias ls='eza --all --icons=always'
command -v bat >/dev/null 2>&1 && alias cat='bat'
command -v lazygit >/dev/null 2>&1 && alias lg='lazygit'
alias c='clear'
alias g='git'
alias gs='git status'
alias gss='git status -s'
alias gd='git diff'
alias ga='git add'
alias gc='git commit -v'
alias gp='git push'
