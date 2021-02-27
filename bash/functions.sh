#!/usr/bin/env bash

# Move quickly into a project repo
repo() {
    local repoPath

    if [[ -z $1 ]]; then
        cd "$REPO_BASE" || return
    else
        repoPath=$(find "$REPO_BASE" -mindepth 1 -maxdepth 2 -type d -iname "*$1*" | head -n 1)
        cd "$repoPath" || return
    fi
}
