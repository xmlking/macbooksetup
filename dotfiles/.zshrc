# iterm shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

# use starship prompt
if type starship  &>/dev/null; then
	eval "$(starship init zsh)"
fi

#  brew initialize all completions
if type brew &>/dev/null; then
	FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
	FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

	autoload -Uz compinit
	compinit
fi

# zsh-syntax-highlighting
if [[ -f "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
	source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# zsh-autosuggestions
if [[ -f "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
	# will first try to find a suggestion from your history, but,
	# if it can't find a match, will find a suggestion from the completion engine.
	export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
	source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
	# Search Previous Used Commands using arrows
	# up and down arrows - history search
	autoload -U history-search-end
	zle -N history-beginning-search-backward-end history-search-end
	zle -N history-beginning-search-forward-end history-search-end
	bindkey "^[[A" history-beginning-search-backward-end
	bindkey "^[[B" history-beginning-search-forward-end
fi


# add my scripts
[[ -f ~/my/exports.zsh ]] && source ~/my/exports.zsh
[[ -f ~/my/paths.zsh ]] && source ~/my/paths.zsh
[[ -f ~/my/functions.zsh ]] && source ~/my/functions.zsh
[[ -f ~/my/aliases.zsh ]] && source ~/my/aliases.zsh
[[ -f ~/my/extra.zsh ]] && source ~/my/extra.zsh


# keep new line here
