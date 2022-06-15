# .bashrc
export BASE_SHELL=$(basename $SHELL)

# NB this only works if compinit is loaded prior to changes in $fpath
# https://apple.stackexchange.com/questions/296477/my-command-line-says-complete13-command-not-found-compdef/340718#340718
if [[ "$BASE_SHELL" == "zsh" ]] ; then
autoload -Uz compinit
compinit -D
autoload bashcompinit && bashcompinit -D
fi

_pipenv-pipes_completions() {
COMPREPLY=($(compgen -W "$(pipes --_completion)" -- "${COMP_WORDS[1]}"))
}

complete -F _pipenv-pipes_completions pipes