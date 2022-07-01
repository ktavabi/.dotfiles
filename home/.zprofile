# Fig post block. Keep at the bottom of this file.
if [ "$(uname)" != "Darwin" ]; then
    export PATH="/opt/homebrew/bin:$PATH"
    if command -v fig >/dev/null 2>&1; then
        . "$HOME/.fig/shell/zshrc.pre.zsh"
    fi
fi

#
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"
# eval "$(_PIPENV_COMPLETE=zsh_source pipenv)" # pipenv zsh tab autocomp

# Fig post block. Keep at the bottom of this file.
if [ "$(uname)" != "Darwin" ]; then
    if command -v fig >/dev/null 2>&1; then
        . "$HOME/.fig/shell/profile.post.bash"

    fi
fi
