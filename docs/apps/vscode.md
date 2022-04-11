# VSCode

## Prerequisites
Fonts should be installed as described in [Essentials](../essentials/essentials.md#Fonts) section.

## Install

```shell
brew install --cask --appdir=~/Applications visual-studio-code
```

### Plugins

Useful extensions:

- [Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker)
- Git history
- [GitLens](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens)
- Highlight Matching Tag
- Prettier — Code formatter
- Markdown table of content
- [GitHub copilot](https://marketplace.visualstudio.com/items?itemName=GitHub.copilot)



For Angular/NodeJS projects:

- ESLint
- Angular's language service

List VS Code extension:
```bash
code --list-extensions | xargs -L 1 echo code --install-extension
```

## Customizations

VSCode Settings. Use settings from [.vscode](../../apps/vscode) for new project.

### Fonts
