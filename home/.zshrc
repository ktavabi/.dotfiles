# Fig pre block. Keep at the top of this file.
. "$HOME/.fig/shell/zshrc.pre.zsh"
#
# ~/.zshrc
#

# ------------------------------------------------------------------------------
# Environment
# ------------------------------------------------------------------------------

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

# Export path to root of dotfiles repo
export DOTFILES=${DOTFILES:="$HOME/.dotfiles"}

# Locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# Do not override files using `>`, but it's still possible using `>!`
set -o noclobber

# Extend $PATH without duplicates
_extend_path() {
  if ! $(echo "$PATH" | tr ":" "\n" | grep -qx "$1"); then
    export PATH="$1:$PATH"
  fi
}

# Add Homebrew bin to $PATH
[[ -d "/opt/homebrew/bin" ]] && _extend_path "/opt/homebrew/bin"

# Add openssl to $PATH
[[ -d "/opt/homebrew/opt/openssl@3/bin" ]] && _extend_path "/opt/homebrew/opt/openssl@3/bin"

# Add Homebrew Ruby to $PATH
[[ -d "/opt/homebrew/opt/ruby/bin" ]] && _extend_path "/opt/homebrew/opt/ruby/bin"

# Add custom bin to $PATH
[[ -d "$HOME/.bin" ]] && _extend_path "$HOME/.bin"
[[ -d "$DOTFILES/bin" ]] && _extend_path "$DOTFILES/bin"
[[ -d "$HOME/.npm-global" ]] && _extend_path "$HOME/.npm-global/bin"
[[ -d "$HOME/.rvm/bin" ]] && _extend_path "$HOME/.rvm/bin"
[[ -d "$HOME/.local/bin" ]] && _extend_path "$HOME/.local/bin"

# Add pyenv to $PATH
export PYENV_ROOT="$HOME/.pyenv"
[[ -d "$PYENV_ROOT/bin" ]] && _extend_path "$PYENV_ROOT/bin"

# Extend $NODE_PATH
if [ -d ~/.npm-global ]; then
  export NODE_PATH="$NODE_PATH:$HOME/.npm-global/lib/node_modules"
fi

# Default pager
export PAGER='less'

# less options
less_opts=(
  # Quit if entire file fits on first screen.
  -FX
  # Ignore case in searches that do not contain uppercase.
  --ignore-case
  # Allow ANSI colour escapes, but no other escapes.
  --RAW-CONTROL-CHARS
  # Quiet the terminal bell. (when trying to scroll past the end of the buffer)
  --quiet
  # Do not complain when we are on a dumb terminal.
  --dumb
)
export LESS="${less_opts[*]}"

# Default editor for local and remote sessions
if [[ -n "$SSH_CONNECTION" ]]; then
  # on the server
  if [ command -v vim ] >/dev/null 2>&1; then
    export EDITOR='vim'
  else
    export EDITOR='vi'
  fi
else
  export EDITOR='vim'
fi

# Compilation flags
export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"

# Source local configuration
if [[ -f "$HOME/.zshlocal" ]]; then
  source "$HOME/.zshlocal"
fi

# Sourcing all zsh files from $DOTFILES/custom
for file in "$DOTFILES/custom/"*.zsh; do
  source "$file"
done

# Add command gitit to open Github repo in default browser from a local repo
source $DOTFILES/lib/gitit.zsh

# ------------------------------------------------------------------------------
# Oh My Zsh
# ------------------------------------------------------------------------------

# OMZ is managed by Sheldon
export ZSH="$HOME/.sheldon/repos/github.com/ohmyzsh/ohmyzsh"

ZSH_THEME="spaceship"

# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# partial completion suggestions
zstyle ':completion:*' list-suffixeszstyle ':completion:*' expand prefix suffix
plugins=(
  history
  history-substring-search
  git
  gitfast
  npm
  yarn
  nvm
  sudo
  extract
  gpg-agent
  macos
  gh
  vscode
  common-aliases
  command-not-found
  mvn
  docker
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source "$ZSH/oh-my-zsh.sh"

# ------------------------------------------------------------------------------
# Dependencies
# ------------------------------------------------------------------------------

eval "$(sheldon source)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
eval "$(_PIPENV_COMPLETE=zsh_source pipenv)" # pipenv zsh tab autocomp
# eval "$(_FOO_BAR_COMPLETE=zsh_source foo-bar)"

# Fig post block. Keep at the bottom of this file.
. "$HOME/.fig/shell/zshrc.post.zsh"
