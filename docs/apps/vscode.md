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
- Git
  - [GitLens](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens)
  - [GitHub Pull Requests and Issues](https://marketplace.visualstudio.com/items?itemName=GitHub.vscode-pull-request-github)
  - [GitHub Theme](https://marketplace.visualstudio.com/items?itemName=GitHub.github-vscode-theme) - Choose either **Light** & **Dark** themes
- Highlight Matching Tag
- [EditorConfig for VS Code](https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig)
- [Material Icon Theme](https://marketplace.visualstudio.com/items?itemName=PKief.material-icon-theme)
- Code formatter
  - [Prettier](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)
- [Markdown All in One](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one)
- [GitHub Copilot](https://marketplace.visualstudio.com/items?itemName=GitHub.copilot)
  - [Getting Started with GitHub Copilot in Visual Studio Code](https://github.com/github/copilot-docs/blob/main/docs/visualstudiocode/gettingstarted.md)
- Drawing
- [excalidraw Editor](https://marketplace.visualstudio.com/items?itemName=pomdtr.excalidraw-editor)
- [Draw.io Integration](https://marketplace.visualstudio.com/items?itemName=hediet.vscode-drawio)
- Internationalization and localization (i18n)
  - [inlang – i18n](https://marketplace.visualstudio.com/items?itemName=inlang.vs-code-extension)
- Monorepo
  - [Monorepo Workspace](https://marketplace.visualstudio.com/items?itemName=folke.vscode-monorepo-workspace) helps to pick Workspaces To Focus On
- ESLint

**List VS Code extension:**

```shell
code --list-extensions | xargs -L 1 echo code --install-extension
```

installing plugins via command line

```shell
code --install-extension GraphQL.vscode-graphql
```

## Customizations

VSCode Settings. Use settings from [.vscode](../../apps/vscode) for new project.

### Fonts

Assume you installed **MesloLGM Nerd Font Mon font**[font-meslo-lg-nerd-font]
from [essentials](../essentials/essentials.md) guide.  
In your project's `.vscode/settings.json` file, set **fontFamily** for _editor_ and _terminal_ as shown below.

```json5
////////// Editor //////////
"editor.fontFamily": " SourceCodePro-Regular, FiraCode-Retina, Menlo",
"editor.fontLigatures": true,
////////// Terminal //////////
"terminal.integrated.fontFamily": "MesloLGM Nerd Font Mono",
```

### Tips

#### General key bindings

| Key                       | Command |
|---------------------------|---------|
| `option` + `shift` + `F`  | Format  |
|                           |         |
|                           |         |
|                           |         |
|                           |         |

#### Markdown key bindings

| Key                  | Command                      |
| -------------------- | ---------------------------- |
| Ctrl/Cmd + B         | Toggle bold                  |
| Ctrl/Cmd + I         | Toggle italic                |
| Ctrl/Cmd + Shift + ] | Toggle heading (uplevel)     |
| Ctrl/Cmd + Shift + [ | Toggle heading (downlevel)   |
| Opt + C              | Check/Uncheck task list item |
| Ctrl/Cmd + Shift + V | Toggle preview               |
|                      |                              |


## References
- [VS code setup for Svelte](https://webjeda.com/blog/vscode-setup-svelte)