# Essentials

**MacOS** comes with `python3`, `ruby`, `git` _preinstalled_. <br/>
We will install other missing essential tools used frequently by _Developers_.

## Tools

### Command-line tools

Install essential _command-line tools_

* [watch](https://cli.github.com/) — `watch` will run a command repeatedly and then display the output in an `ncurses` friendly manner.
* [jq](https://stedolan.github.io/jq/) —  `jq` is like `sed` for JSON data
* [git](https://git-scm.com/) — `git` is a version control system CLI
* [cocogitto](https://github.com/cocogitto/cocogitto)

#### Better CLI Alternative Tools

* [gh](https://cli.github.com/) —  `GitHub CLI` brings GitHub to your terminal.
* [bat](https://github.com/sharkdp/bat) — A syntax highlighting clone of `cat` and can stand in for `less`
* [delta](https://github.com/dandavison/delta) — A syntax highlighting pager for `diff`-ing
* [fd](https://github.com/sharkdp/fd) — A user-friendly version of `find`
* [htop](https://htop.dev/) — An interactive replacement for `top`
* [procs](https://github.com/dalance/procs) — A modern replacement for `ps`
* [eza](https://eza.rocks/) — A modern replacement for `ls`
* [ripgrep](https://github.com/BurntSushi/ripgrep) — An improved `grep`
* [dust](https://github.com/bootandy/dust) — A more intuitive version of `du`
* [duf](https://github.com/muesli/duf) — A better `df` alternative
* [prettyping](https://github.com/denilsonsa/prettyping) —A pretty wrapper around `ping`

```shell
brew install watch
brew install jq

brew install git
brew install gh # GitHub official command line tool.
# for first time use, run `gh auth login`

# Better CLI alternative Tools
brew install ack
brew install tree
brew install eza # replacement for LS. https://eza.rocks/
brew install bat # a better `cat`
brew install git-delta  # a better git `diff`
brew install fd # user-friendly alternative to `find`
brew install procs # a modern replacement for `ps`
brew install dust # a better `du`
brew install ripgrep # a better `grep` use: rg
brew install htop # a better `top`
brew install httpie # a better `curl`
brew install cocogitto # monorepo version/release management 
```

### Fonts

We need developer friendly fonts for **Terminals** (_ghostty, macOS Terminal app_) and **Editors** (_IntelliJ, VSCode,  sublime-text_) to enhance visual experience.
You can explore various fonts for IDEs at [Programming Fonts](https://www.programmingfonts.org) website.

We recommend:

* **Editor Font:** _Source Code Pro, Fira Code or [Jetbrains Mono](https://www.jetbrains.com/lp/mono/)_
* **Terminal Font:** _Meslo LG, FiraCode Nerd Font or Hack Nerd Font_ from [nerd-fonts](https://www.nerdfonts.com/font-downloads)

```shell
# Terminal Fonts
# brew install --cask font-<FONT NAME>-nerd-font
brew install --cask font-meslo-lg-nerd-font
#brew install --cask font-fira-code-nerd-font
#brew install --cask font-hack-nerd-font

# Editor Fonts
brew install --cask font-source-code-pro
#brew install --cask font-fira-code
#brew install --cask font-jetbrains-mono
```

<img src="../images/font-book.png" width=50% height=50%>

After installing your choice of font, you have to configure each _Editor_ and _Terminal_ to use this font, which is covered in [Apps](../apps) section.

### Apps

Install essential _Apps_ via brew cask

Since many of us won't have _admin_ rights on **Company** issued MacBooks, we will be installing software into **User's** Applications (i.e., `~/Applications`) directory:<br/>

> If you have admin privilege, you can skip `--appdir=~/Applications` flag

#### Development Tools

* [ghostty](https://ghostty.org): macOS Terminal Replacement
* [Sublimetext](https://www.sublimetext.com): lightweight text/markdown editor
* [VSCode](https://code.visualstudio.com): lightweight code editor
* [Jetbrains](https://www.jetbrains.com/toolbox-app/): toolbox to install jetbrains IDEs

```shell
brew install --cask --appdir=~/Applications ghostty
brew install --cask --appdir=~/Applications sublime-text
brew install --cask --appdir=~/Applications visual-studio-code
brew install --cask --appdir=~/Applications jetbrains-toolbox
# optional
brew install --cask --appdir=~/Applications windsurf # VSCode alternative
brew install --cask --appdir=~/Applications marta
```

Other benefit of installing `Apps` via `Brew` is, it links binaries to `/opt/homebrew/bin` which is added to `$PATH`.

    'subl' to '/opt/homebrew/bin/subl'
    'code' to '/opt/homebrew/bin/code'

So, you can open _projects/directors_ from command-line in _VSCode_ or _Sublime-text_ with:

```shell
code ~/Developer/Work/tools/macbooksetup
subl ~/Developer/Work/tools/macbooksetup
```

#### Productivity

* [Alfred](https://www.alfredapp.com): Spotlight on steroids.

```shell
brew install --cask --appdir=~/Applications alfred
```

#### Other

* Google Chrome

* Microsoft Remote Desktop: rdp (optional)
* [OBS](https://obsproject.com): Record your screen with audio, mouse highlight and other features. (optional)
* [logitech-options](https://www.logitech.com/en-us/software/options.html): logitech driver, install only if you have _MX mouse_ (optional)
* [slack](https://slack.com/): app for communication (optional)

```shell
brew install --cask --appdir=~/Applications google-chrome
# Logitech Options software - will prompt for password.
brew tap "homebrew/cask-drivers"
brew install --cask --appdir=~/Applications logitech-options
# Remote communication (optional)
brew install --cask --appdir=~/Applications zoom
brew install --cask --appdir=~/Applications slack
brew install --cask --appdir=~/Applications discord
brew install --cask --appdir=~/Applications obs
```

Customize above applications further from: [Apps](../apps) docs
