#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

alias vim='mvim -v'
alias objdump='gobjdump'
alias rvm='/Users/viktorchibotaru/.rvm/bin/rvm'


# Switch to latest version of Ruby
source $HOME/.rvm/scripts/rvm
