#!/usr/bin/env zsh

# Get System Updates, update NPM packages and dotfiles
# Source: https://github.com/sapegin/dotfiles/blob/master/setup/update.sh

trap on_error SIGTERM

e='\033'
RESET="${e}[0m"
BOLD="${e}[1m"
CYAN="${e}[0;96m"
RED="${e}[0;91m"
YELLOW="${e}[0;93m"
GREEN="${e}[0;92m"

_exists() {
  command -v $1 > /dev/null 2>&1
}

# Success reporter
info() {
  echo -e "${CYAN}${*}${RESET}"
}

# Error reporter
error() {
  echo -e "${RED}${*}${RESET}"
}

# Success reporter
success() {
  echo -e "${GREEN}${*}${RESET}"
}

# End section
finish() {
  success "Done!"
  echo
  sleep 1
}

# Set directory
export DOTFILES=${1:-"$HOME/.dotfiles"}

on_start() {
  info '           __        __   ____ _  __            '
  info '      ____/ /____   / /_ / __/(_)/ /___   _____ '
  info '     / __  // __ \ / __// /_ / // // _ \ / ___/ '
  info '  _ / /_/ // /_/ // /_ / __// // //  __/(__  )  '
  info ' (_)\__,_/ \____/ \__//_/  /_//_/ \___//____/   '
  info '                                                '
  info '              by @denysdovhan                   '
  info '                                                '
}

update_dotfiles() {
  info "Updating dotfiles..."

  cd $DOTFILES
  git pull origin
  # TODO python -m sync "$HOME/.dotfiles" "$HOME" "$HOME/dotfiles_bak"
  cd - > /dev/null 2>&1

  info "Updating Zsh plugins..."
  sheldon lock --update

  finish
}

update_brew() {
  if ! _exists brew; then
    return
  fi

  info "Updating Homebrew..."

  brew update
  brew upgrade
  brew cleanup

  finish
}

update_apt_get() {
  if ! _exists apt-get; then
    return
  fi

  info "Updating Ubuntu and installed packages..."

  sudo apt-get update
  sudo apt-get upgrade -y
  sudo apt-get autoremove -y
  sudo apt-get autoclean -y

  finish
}

update_npm() {
  if ! _exists npm; then
    return
  fi

  info "Updating NPM..."

  npm install npm -g

  finish
}

update_gem() {
  if ! _exists gem; then
    return
  fi

  info "Updating Ruby gems..."

  sudo gem update

  finish
}

on_finish() {
  success "Done!"
  success "Happy Coding!"
  echo
  echo -ne $RED'-_-_-_-_-_-_-_-_-_-_-_-_-_-_'
  echo -e  $RESET$BOLD',------,'$RESET
  echo -ne $YELLOW'-_-_-_-_-_-_-_-_-_-_-_-_-_-_'
  echo -e  $RESET$BOLD'|   /\_/\\'$RESET
  echo -ne $GREEN'-_-_-_-_-_-_-_-_-_-_-_-_-_-'
  echo -e  $RESET$BOLD'~|__( ^ .^)'$RESET
  echo -ne $CYAN'-_-_-_-_-_-_-_-_-_-_-_-_-_-_'
  echo -e  $RESET$BOLD'""  ""'$RESET
  echo
}

on_error() {
  error "Wow... Something serious happened!"
  error "Though, I don't know what really happened :("
  exit 1
}

main() {
  echo "Before we proceed, please type your sudo password:"
  sudo -v

  on_start "$*"
  update_dotfiles "$*"
  update_brew "$*"
  update_apt_get "$*"
  update_npm "$*"
  update_gem "$*"
  on_finish "$*"
}

main "$*"
