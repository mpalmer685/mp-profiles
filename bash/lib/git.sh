#!/usr/bin/env bash

# Outputs current branch info in prompt format
function git_prompt_info() {
    local ref
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
    echo "$green${ref#refs/heads/}$(parse_git_dirty)$reset_color"
}

# Checks if working tree is dirty
function parse_git_dirty() {
    local STATUS=''
    STATUS=$(command git status --porcelain --ignore-submodules=dirty 2> /dev/null | tail -n1)
    if [[ -n $STATUS ]]; then
        echo " $red✗$reset_color"
    else
        echo " $green✔$reset_color"
    fi
}

# Outputs the name of the current branch
function git_current_branch() {
    local ref
    ref=$(command git symbolic-ref --quiet HEAD 2> /dev/null)
    local ret=$?
    if [[ $ret != 0 ]]; then
        [[ $ret == 128 ]] && return # no git repo
        ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
    fi
}
