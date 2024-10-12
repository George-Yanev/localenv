export ZSH="$HOME/.oh-my-zsh"

# activate the rtx environment
eval "$(mise activate --status zsh)"
# rtx activate will not update PATH until the shell prompt is displayed. Calling manually hook-env fix that
eval "$(mise hook-env)"

# eza plugin
export EZA_ENABLE_SORT_ALIASES=1
export EZA_ENABLE_EXTENDED_ALIASES=1

ZSH_THEME="starship"
plugins=(
  starship
#  mise
  direnv
  git
  eza
  battery
  compleat
  #zsh-autocomplete
  fzf-tab
  zsh-autosuggestions
  zsh-syntax-highlighting
  #fast-syntax-highlighting
  zsh-fzf-history-search
  zsh-bat
  z
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
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Aliases
alias cat='bat --theme zenburn'
alias cal='gcal --starting-day=1'
