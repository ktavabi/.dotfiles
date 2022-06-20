# Fig pre block. Keep at the top of this file.
. "$HOME/.fig/shell/profile.pre.bash"
export PATH="/opt/homebrew/bin:$PATH"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# Fig post block. Keep at the bottom of this file.
. "$HOME/.fig/shell/profile.post.bash"
