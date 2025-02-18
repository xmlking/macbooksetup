#!/bin/zsh

# Paths
## Add commonly used folders to $PATH, Order is important.

# If you install `python` via `brew`, you have to manually set path to unversioned `python` `python-config`, `pip`.
# Unversioned symlinks `python`, `python-config`, `pip` etc. pointing to `python3`, `python3-config`, `pip3`
export PATH=$(brew --prefix python)/libexec/bin:$PATH

# RANCHER DESKTOP (optional): uncomment if you use RANCHER DESKTOP
# export PATH=$HOME/.rd/bin:$PATH

# orbstack (optional): uncomment if you use orbstack.
# NOTE: only enable here, if orbstack is not added to: ~/.zprofile
# export PATH="$PATH":$HOME/.orbstack/bin

# Android (optional): uncomment if you use Android SDK
# export ANDROID_HOME=$HOME/Library/Android/sdk
# export PATH=$PATH:$ANDROID_HOME/tools
# export PATH=$PATH:$ANDROID_HOME/platform-tools

# LM Studio CLI (lms) (optional): uncomment if you use lmstudio
# export PATH="$PATH:$HOME/.lmstudio/bin"

# At the end, add user's bin
export PATH=$HOME/bin:$PATH
