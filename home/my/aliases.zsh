#!/bin/zsh

# Alias
## user's extra alias and oh-my-zsh's overwrites
## Did you know that you can use dots/periods in your alias names?
## It makes remembering them easier, and allows you to group them.

# ls (overwrite oh-my-zsh's ll alias)
alias ll="ls -AlhG"

# my favorite aliases
alias clr="clear" # Clear your terminal screen
alias ip="curl icanhazip.com" # Your public IP address
alias o="open ." # Open the current directory in Finder
alias myip="ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'"

# Kubernetes
alias watch="watch "

# Paths
alias go.work="/Developer/Work"
alias go.go="/Developer/Work/go"
alias go.spa="/Developer/Work/SPA"
alias go.java="/Developer/Work/java"

# Mac
alias mac.showhidden="defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder"
alias mac.hidehidden="defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder"
alias mac.cleardns="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder; say cache flushed"

# Docker
alias docker.cleancontainer="docker ps -a -q | xargs docker rm"
alias docker.cleanimage="docker images --filter dangling=true -q | xargs docker rmi"
