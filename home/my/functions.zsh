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

# Colorise the top Tabs of Iterm2 with the same color as background

# Set the tab color
function iterm2.tab.color() {
    # takes 1 hex string argument or 3 hex values for RGB
    local R G B
    case "$#" in
        3)
            R="$1"
            G="$2"
            B="$3"
            ;;
        1)
            local hex="$1"
            # Remove leading # if present
            if [[ "${hex:0:1}" == "#" ]]; then
                hex="${hex:1}"
            fi
            # Get hex values for each channel and convert to decimal
            R="$((16#${hex:0:2}))"
            G="$((16#${hex:2:2}))"
            B="$((16#${hex:4}))"
            ;;
        *)
            echo "Usage: iterm2.tab.color color_hex"
            echo "          color_hex: 6 digit hex value (e.g. 1B2B34)"
            echo "       iterm2.tab.color r_val g_val b_val"
            echo "          *_val: values for R, G, B from 0-255 (e.g. 27 43 52)"
            return
            ;;
    esac
    echo -ne "\033]6;1;bg;red;brightness;$R\a"
    echo -ne "\033]6;1;bg;green;brightness;$G\a"
    echo -ne "\033]6;1;bg;blue;brightness;$B\a"
}

# Just change the 18/26/33 wich are the rgb values
function iterm2.tab.change {
    case $1 in
    green)
    iterm2.tab.color 57 197 77
    ;;
    red)
    iterm2.tab.color 270 60 83
    ;;
    orange)
    iterm2.tab.color 227 143 10
    ;;
    *)
    # Reset tab color to default
    iterm2.tab.color 18 26 33
    ;;
    esac
 }

# Functions for iTerm2 Status Bar (3.3+)
function iterm2_print_user_vars() {
  iterm2_set_user_var kubecontext $(kubectl config current-context)
}

# minikube functions
function minikube-eval() {
    test $(minikube status | grep Running | wc -l) -eq 3 && $(minikube status | grep -q 'kubeconfig: Configured') || minikube start
      rval=$?
      if [[ $rval -ge 1 ]]; then
        echo "Error: Is minikube running?"
        exit 1
      fi
      eval $(minikube docker-env)
}

function minikube-init() {
    echo "--> starting minikbe"
    command minikube status | grep -q 'kubeconfig: Configured'
    if [[ $? -ne 0 ]]; then
        command minikube start
        if [[ $? -ne 0 ]]; then
            echo "--> failed to start minikube" >&2
            return 1
        fi
        echo "--> started minikube"
    else
        echo "--> minikube is already started"
    fi
}