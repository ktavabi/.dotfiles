# Kambizzz's dotfiles

On top of all the excellent ใ work found [here!](https://github.com/denysdovhan/dotfiles):

- The usefulness of [โOh My ZSH!โ](http://ohmyz.sh/) is already builtโin.
- [๐โญ๏ธ Spaceships](https://github.com/spaceship-prompt/spaceship-prompt) as a prompt.
- ๐ [Fish](https://fishshell.com/)-like autosuggestions.
- Syntax highlighting of commands while they are typed.
- Automatically closing and deleting of quotes and brackets when you type them.
- Browser-like substring search for history.
- [sheldon](https://sheldon.cli.rs) for dependency management.
- Useful [aliases](./lib/aliases.zsh).
- Git config, global `.gitignore` file and aliases.
- Dotfiles synchronization (`sync.py`) with backup.
- Restoring old dotfiles (`restore.py`) from backup.
- A lot of [useful bins](https://github.com/ktavabi/dotfiles/tree/master/bin).
- `update` script for updating dotfiles, npm, brew, gems, etc.

I've hooked in:

- Some "sensible" macOS default [configs](https://github.com/mathiasbynens/dotfiles/blob/66ba9b3cc0ca1b29f04b8e39f84e5b034fdb24b6/.macos)

  ```sh

    .macos

  ```

- Little [.bash ๐ณ](https://pipenv-pipes.readthedocs.io/en/latest/completions.html#bash-zsh) script for `pipenv` autocompletion

Missing feature? ๐ด Fork this repo and make it better!

## Installation

Dotfiles are installed by running one of the following commands in your terminal, just copy one of the following commands and execute in the terminal:

**via `curl`**

```sh

bash -c "$(curl -fsSL https://raw.githubusercontent.com/ktavabi/dotfiles/master/installer.sh)"

```

**via `wget`**

```sh

bash -c "$(wget https://raw.githubusercontent.com/ktavabi/dotfiles/master/installer.sh -O -)"

```

Tell Git who you are using these commands:

```sh

git config -f ~/.gitlocal user.email "email@yoursite.com"
git config -f ~/.gitlocal user.name "Name Lastname"

```

## Updating

Use single command to get latest updates:

```sh

update

```

This command will update dotfiles, their dependencies, `brew` or `apt-get` packages, global `npm` dependencies, `gem`s, `apm` plugins.

## Under the hood

> **Note:** You may put your custom settings into `~/.zshlocal`.

### Projects tree

I suggest you to organize project folder as follows:

```sh

~/Projects
โโโ Forks       # for GitHub fork
โโโ Job         # for job projects
โโโ Playground  # for short-term experiments
โโโ Repos       # for long-term projects

```

### Aliases

Aliases are gonna make your work fast and enjoyable. See code in `$DOTFILES/lib/aliases.zsh`. Here is what's included:

- Aliases from Oh-My-Zsh. See [Oh-My-Zsh Cheatsheet](https://github.com/robbyrussell/oh-my-zsh/wiki/Cheatsheet#commands) for more.
- Easier navigation
  - **`..`** โ `cd ..`
  - **`...`** โ `cd ../..`
  - **`....`** โ `cd ../../..`
  - **`.....`** โ `cd ../../../..`
  - **`~`** โ `cd ~`
  - **`-`** โ `cd -`
- Folders shortcuts
  - **`dr`** โ `cd ~/Dropbox`
  - **`dl`** โ `cd ~/Downloads`
  - **`dt`** โ `cd ~/Desktop`
  - **`pj`** โ `cd ~/Projects`
  - **`pjr`** โ `cd ~/Projects/_Repos`
  - **`pjf`** โ `cd ~/Projects/_Forks`
  - **`pl`** โ `cd ~/Projects/_Playground/`
- Commands Shortcuts
  - **`e`** โ `$EDITOR`
  - **`+x`** โ `chmod +x`
  - **`x+`** โ `chmod +x`
  - **`ll`** โ `ls -alF`
  - **`la`** โ `ls -A`
  - **`l`** โ `ls -CF`
- Open
  - **`open <FILE>`** โ open file from terminal.
  - **`o <FILE>`** โ open file from terminal.
  - **`oo`** โ open current folder.
- Misc
  - **`update`** โ get updates (Runs `$DOTFILES/scripts/update.zsh`).
  - **`dotfiles`** โ jump quickly into dotfiles folder.
  - **`myip`** โ my local IP address.
  - **`password`** โ generate random password, copies it into clipboard and outputs it to terminal.
  - **`path`** โ print $PATH in readable view.
  - **`getpage`** โ download web page with all assets.
  - **`get`** โ download file with original filename.

### Oh-My-Zsh plugins

These OMZ plugins are included:

- [`git`](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/git) โ git aliases and functions.
- [`npm`](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/npm) โ provides completion as well as adding many useful aliases.
- [`yarn`](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/yarn) โ the same as for `npm`, but for `yarn`
- [`nvm`](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/nvm) โ auto-sourcing `nvm`.
- [`sudo`](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/sudo) โ `[Esc] [Esc]` to re-run previous command with sudo.
- [`ssh-agent`](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/ssh-agent) โ automatically starts ssh-agent to set up and load whichever credentials you want for ssh connections.
- [`gpg-agent`](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/gpg-agent) โ enables `gpg-agent` if it is not running.
- More are listed in `.zshrc` (it's hard to keep the list updated).

### Bin

Dotfiles also include some functions that will make your life easier. See code in [`bin/`](./bin).

- `emptytrash` โ empty the Trash on all mounted volumes and the main HDD.
- `git-cleanup` โ removes old Git branches and does other cleanup.
- `git-fork` โ add remote upsteam.
- `git-upstream` โ sync branch with upstream.
- `gz` โ get gzipped file size
- `n` โ runs given command using binary in `node_modules/.bin` of the current project.
- `nyan` โ print [nyan cat](https://www.youtube.com/watch?v=QH2-TGUlwu4).
- `osx-shadow` โ add macOS-like shadow to an image.
- `server` โ start an HTTP server from a directory.

### Git

> **Note:** Add your git user data and custom settings to `~/.gitlocal`.

#### Configuration

- UI color is `auto`.
- Diff colors are:
  - `white bold` for meta information;
  - `cyan bold` for frag;
  - `red bold` for old lines;
  - `green bold` for new lines.
- Default editor is [Vim](http://www.vim.org/) instead of [Vi](http://www.tutorialspoint.com/unix/unix-vi-editor.htm).
- `push.default` set as `current`.
- Automatic replacement `git://github.com/`, `gh:`, `github:` addresses as `git@github.com:` for GitHub.
- Automatic replacement `git://gist.github.com/`, `gst:`, `gist:` addresses as `git@gist.github.com:` for Gists.
- User custom settings gets from a `~/.gitlocal` file.

#### Git Aliases

- **`git a`** โ `git add` โ patch mode for specified files.
- **`git ua`** โ `git reset HEAD` โ unstage files.
- **`git b`** โ `git branch` โ list, create, or delete branches.
- **`git c`** โ `git commit` โ record changes to the repository.
- **`git co`** โ `git checkout` โ checkout a branch or paths to the working tree.
- **`git ap`** โ `git add -p` โ add file contents to the index.
- **`git ca`** โ `git commit -a` โ commit with automatically stage files that have been modified and deleted.
- **`git cm`** โ `git commit -m` โ commit with commit message.
- **`git cam`** โ `git commit -am` โ add all files and commit with message.
- **`git s`** โ `git status -sb` โ short status with current branch.
- **`git master`** โ go to `master` branch and pull from remote.
- **`git develop`** โ go to `develop` branch and pull from remote.
- **`git git`** โ do not complain about `git git`.
- **`git l`** โ commits log with pretty single line format.
- **`git ll`** โ log with list of changed files for each commit.
- **`git ignore`** โ ignore files: append file to `.gitignore`.
- **`git this`** โ initialize, add all files and commit.
- **`git amend`** โ amend last commit.
- **`git redo`** โ amend last commit with its original message.
- **`git undo`** โ `reset --mixed HEAD^` โ reset index changes, but not the working tree.
- **`git discard`** โ `checkout --` โ discard changes.
- **`git contrib`** โ list of contributors and how many commits each person has.
- **`git today`** โ see how many lines of code you have written today.
- **`git stat`** โ how many lines of code in repo.
- **`git sync`** โ pull and push changes from/to remote.
- **`git-changelog [-l,--list,-t,--tag] <FILE>`** โ generate changelog based on commit history.
- **`git-cleanup [--force]`** โ removes old Git branches.
- **`git-fork <original-author>`** โ add remote upstream.
- **`git-upstream [branch]`** โ sync branch with upstream (as default `master`).

## Bash

If you wanna stand on `bash` version of dotfiles, please execute following commands inside the `~/.dotfiles` folder:

```sh
git checkout bash
./sync.py
```

I do not support `bash` version anymore, so if you need fixes or new features, please send me a pull request into `bash` branch. Thank you!

## Resources

Resources that I used to make these dotfiles better:

- [GitHub โค ~/](http://dotfiles.github.com/)
- [Artem Sapeginโs dotfiles](https://github.com/sapegin/dotfiles)
- [Mathiasโs dotfiles](https://github.com/mathiasbynens/dotfiles)
- [Yet another cool story about bash prompt](http://habrahabr.ru/company/mailru/blog/145008/)

## License

MIT ยฉ [Kambiz Tavabi](https://kambiztavabi.com)
