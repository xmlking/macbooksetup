#!/bin/zsh

# Alias
## user's extra alias and oh-my-zsh's overwrites
## Did you know that you can use dots/periods in your alias names?
## It makes remembering them easier, and allows you to group them.

# ls (overwrite MacOS ls & ll alias)
#alias ll="ls -AlhG"

# eza
if [ "$(command -v eza)" ]; then
    unalias -m 'ls'
    unalias -m 'll'
    alias ls='eza --header --group --git --long'
    alias ls.tree='eza --header --group --tree --level=2  --git --long --icons'
    alias ll='eza --header --group --git --long --all'
    alias ll.tree='eza --header --group --tree --level=2  --git --long --icons --all'
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
alias k="kubectl"
alias watch="watch "
alias kg="kubectl get"
alias kgdep="kubectl get deployment"
alias ksys="kubectl --namespace=kube-system"
alias kd="kubectl describe"
alias bb="kubectl run busybox --image=busybox:1.36.1 --rm -it --restart=Never --command --"

# Paths
alias go.work='cd ~/Developer/Work'
alias go.go='cd ~/Developer/Work/go'
alias go.rust='cd ~/Developer/Work/rust'
alias go.spa='cd ~/Developer/Work/SPA'
alias go.java='cd ~/Developer/Work/java'
alias go.tools='cd ~/Developer/Work/tools'
alias go.python='cd ~/Developer/Work/python'

# Mac
alias mac.cleardns='sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder; say cache flushed'

# tools
if [ -x "$(command -v bat)" ]; then
  alias cat="bat --theme='OneHalfLight'"
fi
if [ "$(command -v htop)" ]; then
    alias top='htop --tree'
fi
# By default, fd ignores files and directories that are hidden or listed in the .gitignore.
# `fda` & `rga` disable this feature
if [ -x "$(command -v fd)" ]; then
  alias fda='fd -IH'
fi
if [ -x "$(command -v rg)" ]; then
  alias rga='rg -uuu'
  alias grep='rga'
fi
if [ -x "$(command -v dust)" ]; then
  alias du='dust'
fi
if [ -x "$(command -v procs)" ]; then
  alias ps='procs'
fi

# Docker
alias docker.cleancontainer='docker ps -a -q | xargs docker rm'
alias docker.cleanimage='docker images --filter dangling=true -q | xargs docker rmi'
