# Fig post block. Keep at the bottom of this file.
if [ "$(uname)" != "Darwin" ]; then
    if command -v fig >/dev/null 2>&1; then
        . "$HOME/.fig/shell/profile.post.bash"

    fi
fi
