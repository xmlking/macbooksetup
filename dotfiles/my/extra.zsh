#!/bin/zsh

# Extras
## Some tools (sdkman, gcloud) install scripts append extra scripts to .zshrc.
## move them here.

# The next line updates PATH for rust language. i.e., append /Users/<username>/.cargo/bin
[[ -s "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

# The next line updates PATH for the Google Cloud SDK.
if [ -f "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc" ]; then . "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"; fi
# The next line enables shell command completion for gcloud.
if [ -f "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc" ]; then . "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"; fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# add pnpm's globally installed packages to PATH
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# add bun's globally installed packages to PATH
BUN_HOME="$HOME/.bun/bin"
case ":$PATH:" in
  *":$BUN_HOME:"*) ;;
  *) export PATH="$BUN_HOME:$PATH" ;;
esac

# add GoLang's globally installed executable packages to PATH
GO_HOME=$(go env GOPATH)/bin
case ":$PATH:" in
  *":$GO_HOME:"*) ;;
  *) export PATH="$GO_HOME:$PATH" ;;
esac
