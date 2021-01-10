# Mac Developer Setup

- [Mac Admin Privileges](#mac-admin-privileges)
- [macOS Setup Guide](#mac-setup)
- [Apps Installation](#apps-installation)
- [xcode](#post-xcode-install)
- [Enable Developer Mode](#developer-mode)
- [Homebrew](#homebrew)
- [zsh](#zsh)
- [iTerm2](#iterm2)
- [Rust](#rust)
- [Setup work directories](#setup-work-directories)
- [VSCode](#vscode)
- [Sublime Text 3](#sublime-text-3)
- [SDKman](#sdkman)
- [Docker](#docker)
- [Kubernetes](#kubernetes)
- [Istio](#istio)
- [SDKman Software Installations](#sdkman-software-installations)
- [Cloud SDK](#cloud-sdk-optional)
- [Setup Profile](#setup-profile)
 
**Installation steps below assume that you are have Admin Access currently enabled**

## Mac Setup


---

## Apps Installation

based on you needed, install following software

- Microsoft Office
- Chrome
- Xcode
- IntelliJ
- [kubernetic](https://kubernetic.com)

`Xcode/ Xcode Command Line Tools` is requred even if you don't use xcode, for `NodeJS`, `GoLang` etc to work.

---

### Install Apps via brew cask

> `brew cask install --appdir=~/Applications xyz` will install into user Apps (i.e., `~/Applications`)<br/>
> if you have admin privilege you can skip `--appdir=~/Applications` flag

> for **iterm2**, I prefer installing `Nightly Builds` from https://www.iterm2.com/downloads.html

```bash
brew cask install --appdir=~/Applications iterm2
brew cask install --appdir=~/Applications sublime-text
brew cask install --appdir=~/Applications visual-studio-code
brew cask install --appdir=~/Applications bloomrpc
```

## Post xcode install

Check if the full Xcode package is already installed:

`$ xcode-select -p`

If you see:

`/Library/Developer/CommandLineTools`

the full Xcode package is already installed. Otherwise:

`xcode-select --install`

You should see the pop up below on your screen. Click Install when it appears.

Once the software is installed, click Done.

Before you go to the next step, verify that you’ve successfully installed Xcode Command Line Tools:

`$ xcode-select -p`

You should see:

`/Library/Developer/CommandLineTools`

Just to be certain, verify that gcc is installed:

`$ gcc --version`

If all went well, you should see the GCC version in the output.

It will show something like this:

```
Configured with: --prefix=/Applications/Xcode.app/Contents/Developer/usr --with-gxx-include-dir=/usr/include/c++/4.2.1
Apple LLVM version 10.0.0 (clang-1000.11.45.5)
Target: x86_64-apple-darwin17.7.0
Thread model: posix
InstalledDir: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
```

---

## Developer Mode

> Enable `Developer Mode` on this Mac so that you can use debugger and other dev tools

```bash
# check status
DevToolsSecurity -status
# DevToolsSecurity -status -verbose

#  substitute your username in palace of <username>
DevToolsSecurity -enable
# or
sudo dscl . append /Groups/_developer GroupMembership <username>
```

---

## Homebrew

Reference [Homebrew](https://sourabhbajaj.com/mac-setup/Homebrew/) for detailed instructions.

Go to terminal and run:

`$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

Once the installation is successful, run the following command:

`$ brew doctor`

If you get Your system is ready to brew, you can move on to the next step.

---

## Homebrew Software Installations

To update brew:

`$ brew update`

```bash
# tools
brew install watch
brew install jq
brew install git
brew install git-flow-avh
brew install ack
brew install tree
brew install vim
# a better `cat`
brew install bat
# a better `curl`
brew install httpie
# better then a Makefile
brew install go-task/tap/go-task

## languages
# node
brew install node
brew install yarn

brew install python

# GoLang
brew install protobuf
brew install go
# grpc cli client
brew install grpc

# Developer IDE Fonts
brew tap homebrew/cask-fonts 
brew cask install font-source-code-pro
brew cask install font-fira-code

## kubernetes
# if you are going to install `docker-for-mac`, it comes with `kubectl` and don't need install it again via brew.
brew install kubectx
brew install kubernetes-cli
brew install kustomize
brew install kubernetes-helm
# Manage Your lk8s In Style!
brew install derailed/k9s/k9s
brew install istioctl

# gcloud cli
brew cask install google-cloud-sdk
```

---

## zsh

Reference [zsh](https://sourabhbajaj.com/mac-setup/iTerm/zsh.html) for detailed instructions.

Install `Oh My Zsh`

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

The installation script should set zsh to your default shell, but if it doesn't you can do it manually:

```bash
chsh -s $(which zsh)
```

---

## iTerm2


Follow [iTerm2 Configuration](https://medium.com/@Clovis_app/configuration-of-a-beautiful-efficient-terminal-and-prompt-on-osx-in-7-minutes-827c29391961)
for applying the color scheme, install fonts, `Oh my Zsh` add-ons. Note: use `Powerlevel10k` instead of `Powerlevel9k`

### Powerlevel10k

Follow [Offical Powerlevel10k](https://github.com/romkatv/powerlevel10k) or [Opinionated Powerlevel10k](https://gist.github.com/kevin-smets/8568070) instructions

```bash
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
```

Note: After Powerlevel10k setup, when you restart iTerm2 first time, it will ask you to install `MesloLGS NF` font and sequence of questions to customize prompt. To customize prompt again, run `p10k configure` or edit ~/.p10k.zsh.

### plugins

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
```

Download and install first [MesloLGS NF Regular] patched font for terminal use 

> other terminal fonts are optional 

1. [MesloLGS NF Regular](https://github.com/romkatv/dotfiles-public/raw/master/.local/share/fonts/NerdFonts/MesloLGS%20NF%20Regular.ttf)

Recommended to use **MesloLGS NF Regular** font all terminals and adjust terminal font size e.g., terminal.integrated.fontSize=14

1. iTerm2: Open iTerm2 → Preferences → Profiles → Text and set Font to _MesloLGS NF Regular_
2. Visual Studio Code: Open File → Preferences → Settings, enter `terminal.integrated.fontFamily` in the search box and set the value to _MesloLGS NF Regular_

   e.g., `"terminal.integrated.fontFamily": "MesloLGS NF, 'SourceCodePro+Powerline+Awesome Regular', Source Code Pro for Powerline, monospace, Meslo LG M for Powerline"`

Download and install following color schemas for iTerm2

1. [Clovis-iTerm2-Color-Scheme](apps/iterm2/colors/Clovis-iTerm2-Color-Scheme.itermcolors)

### Status Bar Customization (Optional)

#### Install iTerm2 Shell Integration

`iTerm2 > Install Shell Integration`

> Go into iTerm preferences and untick the indicators: Profiles > Terminal > Show mark indicators.

#### Add kubecontext Status Bar component

- iTerm2 > Preferences > Profiles > Session > Configure Status Bar
- Drag a new Interpolated String component to Active Components.
- Select the new component and click Configure Component.
- Set String Value to `\(user.kubecontext)`

Refer:

1. <https://sig.gy/itermkube/>
2. <https://www.stefanjudis.com/blog/declutter-emojify-and-prettify-your-iterm2-terminal/>

---

## Rust
 
Rust is a systems programming language that runs blazingly fast, prevents segfaults, and guarantees thread safety.

### Installation
For installation, it's advised to use `rustup` as it will (among other things) allow you to switch between versions of Rust without having to download anything additional.

```bash
brew install rustup
```

Use rustup to install the Rust compiler (rustc) and the Rust package manager (cargo).

```bash
rustup-init
```

To verify you can run:

```bash
rustc --version
```

To upgrade `rustup`

```bash
brew upgrade rustup
# or
rustup self update
```

Enable tab completion for Zsh
```bash
rustup completions bash > $(brew --prefix)/etc/bash_completion.d/rustup.bash-completion
```

To update `rust`

```bash
rustup update
rustup update stable
```

---
## Setup Work Directories

Go to terminal and run the following commands:

To go your home directory:

`$ cd ~`

Make 'Developer' directory:

`$ mkdir -p ~/Developer`

Change directory to Developer

`$ cd ~/Developer`

Make 'Work' directory under ~/Developer:

`$ mkdir Work`

Make 'Apps' directory under ~/Developer:

`$ mkdir Apps`

Change directory to ~/Developer/Work

`$ cd Work`

Make `SPA` , `go`, `java` etc directories under ~/Developer/Work:

```bash
mkdir SPA
mkdir go
mkdir rust
mkdir java
mkdir node
mkdir tools
```

---


## VSCode

Go to [VSCode](https://code.visualstudio.com/) and install VSCode if you prefer VSCode instead of Intellij

### Create a shortcut to launch Visual Studio Code in terminal

```bash
cd ~
mkdir bin
# change `schintha` to your user name
ln -s "/Users/schintha/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code" ~/bin/code
```

To open dir in `Visual Studio Code` from terminal:

`$ ~/bin/code dir.name`

---

## Sublime Text 3

Reference [SublimeText](https://sourabhbajaj.com/mac-setup/SublimeText/) for detailed instructions.

you can use my user [preferences](apps/sublimetext/preferences.json)

#### Install package control

Ref: https://packagecontrol.io/installation

Install Package control by going to Sublime Text Console. Access console by **View > Show Console** menu.
Once open, paste the following python code:

`import urllib.request,os,hashlib; h = '2915d1851351e5ee549c20394736b442' + '8bc59f460fa1548d1514676163dafc88'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); by = urllib.request.urlopen( 'http://packagecontrol.io/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by)`

---

#### Install packages

Go to Sublime and do `CMD + Shift + P`

Type 'install' and select 'Package Control: Install Package'

Install the 5 packages listed below:

1. Theme - Soda
2. SCSS
3. Markdown Preview
4. Monokai Extended
5. TypeScript

Afterwards, go to **Preferences -> Settings-User** and copy and paste following JSON

```json
{
  "bold_folder_labels": true,
  "color_scheme": "Packages/Monokai Extended/Monokai Extended.tmTheme",
  "font_face": "Consolas",
  "font_size": 14,
  "highlight_line": true,
  "highlight_modified_tabs": true,
  "ignored_packages": ["Vintage"],
  "indent_to_bracket": true,
  "rulers": [79],
  "tab_size": 2,
  "translate_tabs_to_spaces": true,
  "word_wrap": false
}
```

---

#### Create a shortcut to launch Sublime Text in terminal

```bash
 cd ~
 mkdir bin
# change `schintha` to your user name
 ln -s "/Users/schintha/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/bin/subl
```

To open file in Sublime Text from terminal:

`$ ~/bin/subl file.name`

---

## iTerm2 More

#### iTerm2 setup for day-to-day use

1. enable iterm2 Session [Restoration](https://iterm2.com/documentation-restoration.html)

> in iTerm2

2. split screen horizontally
3. go to the bottom screen and split it vertically

I was using top screen for the work with yaml files and kubectl.

Left bottom screen was running:

    watch kubectl get pods

Right bottom screen was running:

    watch "kubectl get events --sort-by='{.lastTimestamp}' | tail -6"

With such setup it was easy to observe in real time how my pods are being created.

---

## SDKMan

Go to terminal and run:

`$ curl -s "https://get.sdkman.io" | bash`

Then execute contents in file via:

`$ source "$HOME/.sdkman/bin/sdkman-init.sh"`

Verify the installation went well

`$ sdk version`

---

## SDKman Software Installations

To get a list of current or candidate versions for gradle:

`sdk list java`

To install the following software, go to terminal and run:

```bash
# if you want to manage java version with `sdkman`
# java  `11.0.X.hs-adpt` is current long-term support (LTS). 
sdk install java 11.0.7.hs-adpt

sdk install gradle
sdk install maven

#optional
sdk install kotlin
sdk install scala
sdk install springboot
```

When you prompted to set the newly installed software as default enter 'Y'

How to use [sdkman](http://sdkman.io/usage.html)

To see what is outdated for all Candidates

`sdk upgrade`

To remove old version e.g., gradle 5.6.2:

`$ sdk remove gradle 5.6.2`

---

## Docker

Download Docker at [https://docs.docker.com/docker-for-mac/](https://docs.docker.com/docker-for-mac/)

Follow instructions [here](https://gist.github.com/xmlking/62ab53753c0f0f5247d0e174b31dab21) to setup Docker and kubernetes

---

## Kubernetes

Go to [Kubernetes for MacOS](https://gist.github.com/xmlking/62ab53753c0f0f5247d0e174b31dab21)
and follow instructions to setup **Kubernetes** with **Docker for Mac** for local development

---

## Istio

Go to [Istio for MacOS](https://gist.github.com/xmlking/e248bc094ccd6452fb5bac03b91c70f1)
and follow instructions to setup **Istio** with **Kubernetes** for local development

---

## Cloud SDK (optional)



Install Google cloud SDK using your favourite method, e.g.

`brew cask install google-cloud-sdk`

Log in to Google Cloud and select your project, region, etc.

```bash
gcloud init # --console-only if in a remote shell
```

gcloud has an interactive shell if you wish to use it:

```bash
gcloud components install beta
gcloud beta interactive

# Testing The CLI Setup
gcloud auth login
gcloud auth list


# List the sdk configuration
gcloud config list
gcloud info

# hook it up to GCR so you can push containers:
gcloud auth configure-docker
```


## Setup Profile

All the above setting already backed into following dot(.) files

> copy `zshrc`, `alias` etc., files to your home directory to make life easy.

to finish this task, run the following commands in terminal:

```bash
# go to your home dir
cd ~
curl -O https://raw.githubusercontent.com/xmlking/macbooksetup/master/home/.zshrc
curl -O https://raw.githubusercontent.com/xmlking/macbooksetup/master/home/.p10k.zsh
# change `name` and `email` in `.gitconfig` after copy
curl -O https://raw.githubusercontent.com/xmlking/macbooksetup/master/home/.gitconfig
mkdir ~/my && cd ~/my
curl -O https://raw.githubusercontent.com/xmlking/macbooksetup/master/home/my/.gitattributes
curl -O https://raw.githubusercontent.com/xmlking/macbooksetup/master/home/my/.gitignore
curl -O https://raw.githubusercontent.com/xmlking/macbooksetup/master/home/my/aliases.zsh
curl -O https://raw.githubusercontent.com/xmlking/macbooksetup/master/home/my/exports.zsh
curl -O https://raw.githubusercontent.com/xmlking/macbooksetup/master/home/my/extra.zsh
curl -O https://raw.githubusercontent.com/xmlking/macbooksetup/master/home/my/functions.zsh
curl -O https://raw.githubusercontent.com/xmlking/macbooksetup/master/home/my/paths.zsh
```


> If you want to add **paths** or **exports** use respective files in `~/my` folder instead of editing  `~/.zshrc` 

---

## References

- https://sourabhbajaj.com/mac-setup/
- https://sandor-nemeth.github.io/2017/09/30/setup-mackbook-pro-for-development.html
- https://gist.github.com/kevin-smets/8568070
- https://medium.com/@Clovis_app/configuration-of-a-beautiful-efficient-terminal-and-prompt-on-osx-in-7-minutes-827c29391961
- https://github.com/micro/micro/blob/master/network/config/kubernetes/gcloud.md

