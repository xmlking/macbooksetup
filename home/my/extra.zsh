#!/bin/zsh

# Extras
## Some tools (sdkman, gcloud) install scripts append extra scripts to .zshrc.
## move them here.

# The next line updates PATH for the Google Cloud SDK.
if [ -f "/Users/schintha/Developer/Apps/google-cloud-sdk/path.zsh.inc" ]; then . "/Users/schintha/Developer/Apps/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "/Users/schintha/Developer/Apps/google-cloud-sdk/completion.zsh.inc" ]; then . "/Users/schintha/Developer/Apps/google-cloud-sdk/completion.zsh.inc"; fi

# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
