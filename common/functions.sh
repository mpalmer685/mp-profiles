#!/usr/bin/env bash

# My IP on the network
function ip() {
    ip=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
    echo "$ip"
}

# The SSID of the currently connect Wi-Fi network
function ssid() {
    local hardwarePort=${1:-en0}
    networksetup -getairportnetwork "$hardwarePort" | awk -F ": " '{print $2}'
}

# Create a new directory and enter it
function mkd() {
    mkdir -p "$@" && cd "$_" || return
}

# Print the PATH variable with each entry on its own line
function path() {
    echo "$PATH" | tr : '\n'
}

# Strip any color codes from shell output
function unchalk() {
    sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[mGK]//g" "$1"
}
