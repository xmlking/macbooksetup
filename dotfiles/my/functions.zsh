#!/bin/zsh

# Functions
## user's extra functions

# File search functions
function f() { find . -iname "*$1*" ${@:2} }
function r() { grep "$1" ${@:2} -R . }

# Create a folder and move into it in one command
function mkcd() { mkdir -p "$@" && cd "$_"; }

# Functions - My perfected ls command!
cll() { ls -AlhG "$@" | awk '{k=0;for(i=0;i<=8;i++)k+=((substr($1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(" %0o ",k);print}' | cut -c 1-5,21-; }


# get my VPN IP
function getMyIP()
{
    local myip=$(ifconfig | grep 172 | awk '{print $2; exit}')
    echo "$myip"
}
