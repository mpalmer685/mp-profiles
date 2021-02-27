#!/usr/bin/env bash
# Common directories functions

alias ..='cd ../'
alias ...='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias .6='cd ../../../../../../'

alias -- -='cd -'

mkd() {
    mkdir -p "$@" && cd "$_" || return
}

alias md='mkdir -p'
alias rd='rmdir'

# List directory contents
alias lsa='ls -lah'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'
