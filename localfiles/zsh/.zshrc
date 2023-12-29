export ZSH="$HOME/.oh-my-zsh"

eval "$(rtx activate zsh)"
eval "$(rtx env -s zsh)"

ZSH_THEME="starship"
plugins=(
  starship
  rtx
  direnv
  git
  zoxide
  eza
  #battery
  compleat
  #zsh-autocomplete
  fzf-tab
  zsh-autosuggestions
  zsh-syntax-highlighting
  fast-syntax-highlighting
  zsh-fzf-history-search
)

source $ZSH/oh-my-zsh.sh

### Autocomplete

# aws - probably rtx issue
complete -C $(which aws_completer) aws

# from zsh completions autocomplete
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

# Exports
export EDITOR=nvim
export PATH=$HOME/bin:$PATH

# Aliases
alias cat='bat --theme Dracula'

