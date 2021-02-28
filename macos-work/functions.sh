#!/usr/bin/env bash

function updatevip {
    local vmId=${1:-"Windows Dev Environment"}
    local adapter=${2:-"1"}
    local valueLiteral="Value: "
    local host="local.energage.com"
    local ip

    ip=$(VBoxManage guestproperty get "$vmId" "/VirtualBox/GuestInfo/Net/$adapter/V4/IP")
    ip=${ip#$valueLiteral}

    if sudo sed -i "" "/$host/ s/.*/$ip     $host/g" /etc/hosts;
    then
        echo "Using $ip as $host"
    fi
}

function add_to_sourcetree_path {
    local sourcetree_path="/Applications/Sourcetree.app/Contents/Resources/git_local/bin"
    ln -s "$(command -v "$1")" "$sourcetree_path/$1"
}

function disable_dashboard {
    defaults write com.apple.dashboard.plist db-enabled-state 1
}

# Layout displays using displayplacer (https://github.com/jakehilborn/displayplacer)
# TODO: Expand this functionality to save the current layout to a named layout
function display_layout {
    local name=$1
    shift
    eval "display_layout_$name" "$0"
}
