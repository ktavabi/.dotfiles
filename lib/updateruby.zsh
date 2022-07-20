
# +---------+
# | General |
# +---------+
# use rbenv to install and manage our Ruby versions.
# https://gorails.com/setup/osx/12-monterey#ruby

rbenv install $(rbenv install -l | grep -v - | tail -1)
rbenv global  $(rbenv install -l | grep -v - | tail -1)
