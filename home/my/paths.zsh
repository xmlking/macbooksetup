#!/bin/zsh

# Paths
## Add commonly used folders to $PATH, Order is important.

# GoLang Path
export PATH=$PATH:$(go env GOPATH)/bin

# Executable scripts from Python packages you install will be put in here
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# Add RVM to PATH for scripting
export PATH=$PATH:$HOME/.rvm/bin  

# Android
# export ANDROID_HOME=$HOME/Library/Android/sdk
# export PATH=$PATH:$ANDROID_HOME/tools
# export PATH=$PATH:$ANDROID_HOME/platform-tools


# At the end, add user's bin
export PATH=$HOME/bin:$PATH
