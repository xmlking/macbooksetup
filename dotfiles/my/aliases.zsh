#!/bin/zsh

# Alias
## user's extra alias and oh-my-zsh's overwrites
## Did you know that you can use dots/periods in your alias names?
## It makes remembering them easier, and allows you to group them.

# ls (overwrite MacOS ls & ll alias)
#alias ll="ls -AlhG"

# exa
if [ "$(command -v exa)" ]; then
    unalias -m 'ls'
    unalias -m 'll'
    alias ls='exa --header --group --git --long'
    alias ls.tree='exa --header --group --tree --level=2  --git --long --icons'
    alias ll='exa --header --group --git --long --all'
    alias ll.tree='exa --header --group --tree --level=2  --git --long --icons --all'
fi

# my favorite aliases
alias clr="clear" # Clear your terminal screen
alias ip="curl icanhazip.com" # Your public IP address
alias o="open ." # Open the current directory in Finder
alias myip="ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'"

# git
alias ga='git add'
alias gaa='git add --all'
alias gsd="git switch develop"
alias gsm="git switch main"
alias gl='git pull'
alias gp='git push'
alias gpd='git push --dry-run'
alias gpoat='git push origin --all && git push origin --tags'

# Kubernetes
alias watch='watch '

# Paths
alias go.work='cd ~/Developer/Work'
alias go.go='cd ~/Developer/Work/go'
alias go.rust='cd ~/Developer/Work/rust'
alias go.spa='cd ~/Developer/Work/SPA'
alias go.java='cd ~/Developer/Work/java'
alias go.tools='cd ~/Developer/Work/tools'

# Mac
alias mac.cleardns='sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder; say cache flushed'

# tools
if [ -x "$(command -v bat)" ]; then
  alias cat="bat --theme='OneHalfLight'"
fi


# Docker
alias docker.cleancontainer='docker ps -a -q | xargs docker rm'
alias docker.cleanimage='docker images --filter dangling=true -q | xargs docker rmi'
