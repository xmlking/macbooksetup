#!/bin/zsh

# Add commonly used folders to $PATH
export PATH=$PATH:$(go env GOPATH)/bin


export PATH=$HOME/bin:$PATH

# Specify default editor. Possible values: vim, nano, ed etc.
export EDITOR=vim

# File search functions
function f() { find . -iname "*$1*" ${@:2} }
function r() { grep "$1" ${@:2} -R . }

# Create a folder and move into it in one command
function mkcd() { mkdir -p "$@" && cd "$_"; }

# Example aliases
alias clr="clear" # Clear your terminal screen
alias ip="curl icanhazip.com" # Your public IP address
alias o="open ." # Open the current directory in Finder

## kubernetes
alias k="kubectl"
alias watch="watch "


# extra
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Developer/Applications/google-cloud-sdk/path.zsh.inc' ]; then . '/Developer/Applications/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Developer/Applications/google-cloud-sdk/completion.zsh.inc' ]; then . '/Developer/Applications/google-cloud-sdk/completion.zsh.inc'; fi

