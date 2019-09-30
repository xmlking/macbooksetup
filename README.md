# Mac Developer Setup

- [Mac Admin Privileges](#mac-admin-privileges)
- [macOS Setup Guide](#mac-setup)
- [Self Service Installations](#self-service-installations)
- [xcode](#post-xcode-install)
- [Enable Developer Mode](#developer-mode)
- [Homebrew](#homebrew)
- [zsh](#zsh)
- [iTerm2](#iterm2)
- [Fonts](#fonts)
- [Node](#node)
- [Angular CLI](#angular-cli)
- [Setup work directories](#setup-work-directories)
- [Intellij](#intellij)
- [VSCode](#vscode)
- [Sublime Text 3](#sublime-text-3)
- [Postman](#postman)
- [SDKman](#sdkman)
- [RVM](#rvm)
- [Ruby](#ruby)
- [Java](#java)
- [Docker](#docker)
- [Kubernetes](#kubernetes)
- [Homebrew Software Installations](#homebrew-software-installations)
- [SDKman Software Installations](#sdkman-software-installations)
- [File References](#file-references)
- [Setup Profile](#setup-profile)
- [Setup Anaconda3](#setup-anaconda3)
- [Setup Citrix](#setup-citrix)

**Installation steps below assume that you are have Admin Access currently enabled**

## Mac Setup

First follow sourabhbajaj's [mac setup](https://sourabhbajaj.com/mac-setup/) Guide

Then, follow this guide for [iTerm2](#iterm2), [Sublime Text 3](#sublime-text-3) setup.

---

## Self Service Installations

If not already installed on your Macbook, you can install the following apps via **jamf** Self-Service App:

> **jamf** Self-Service App is used by Enterprises to let developers install software on managed MacBooks

- Microsoft Office
- Chrome
- Xcode

`Xcode/ Xcode Command Line Tools` is requred even if you don't use xcode, for `NodeJS`, `GoLang` etc to work.

---

## Post xcode install

Check if the full Xcode package is already installed:

`$ xcode-select -p`

If you see:

`/Applications/Xcode.app/Contents/Developer`

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
brew install zsh
brew install watch
brew install jq
brew install git
brew install git-flow-avh
brew install ack
brew install tree
brew install vim
# a better `cat`
brew install bat

## languages
# node
brew install node
brew install yarn

brew install python

# GoLang
brew install protobuf
brew install go

# Developer IDE Fonts
brew tap caskroom/fonts && brew cask install font-source-code-pro
brew untap caskroom/fonts && brew tap homebrew/cask-fonts && brew cask install font-fira-code

## kubernetes
# if you are going to install `docker-for-mac`, it comes with `kubectl` and don't need install it again via brew.
brew install kubernetes-cli
brew install skaffold
brew install kustomize
brew install kubernetes-helm
# virtualbox for minikube
brew cask install virtualbox

brew cask install minikube
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

we will be using `powerlevel10k` theme and following plugins with `Oh My Zsh`

```bash
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
	git
	golang
	brew
	osx
	kubectl
	colored-man-pages
	zsh-completions
	zsh-autosuggestions
	zsh-syntax-highlighting
)
```

> when you copy [home](./home) to your \$HOME directory, you will got all the above configuration.

### update oh_my_zsh

> you can upgrade `oh_my_zsh` any time with

```bash
upgrade_oh_my_zsh
```

---

## iTerm2

Reference [iTerm](https://sourabhbajaj.com/mac-setup/iTerm/) for detailed instructions.

Follow [iTerm2 Configuration](https://medium.com/@Clovis_app/configuration-of-a-beautiful-efficient-terminal-and-prompt-on-osx-in-7-minutes-827c29391961)
for applying the color scheme, install fonts, `Oh my Zsh` add-ons. Note: use `Powerlevel10k` instead of `Powerlevel9k`

### Powerlevel10k

Follow [Offical Powerlevel10k](https://github.com/romkatv/powerlevel10k) or [Opinionated Powerlevel10k](https://gist.github.com/kevin-smets/8568070) instructions

```bash
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
```

Then edit your `~/.zshrc` and set `ZSH_THEME="powerlevel10k/powerlevel10k".`

After Powerlevel10k setup, when you restart iTerm2 first time, it will ask you to install `MesloLGS NF` font and sequence of questions to customize prompt. To customize prompt again, run `p10k configure` or edit ~/.p10k.zsh.

### plugins

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
```

Optinally download and install following patched fonts for terminal use(try which one best suite you)

1. [MesloLGS NF Regular](https://github.com/romkatv/dotfiles-public/raw/master/.local/share/fonts/NerdFonts/MesloLGS%20NF%20Regular.ttf)
2. [Meslo LG M Regular for Powerline](apps/iterm2/fonts/Meslo-LG-M-Powerline.ttf)
3. [Source Code Pro for Powerline](apps/iterm2/fonts/SourceCodePro-Powerline.otf)
4. [SourceCodePro+Powerline+Awesome+Regular](apps/iterm2/fonts/SourceCodePro-Powerline-Awesome.ttf)

Recommended to use **MesloLGS NF Regular** font all terminals and adjust terminal font size e.g., terminal.integrated.fontSize=14

1. iTerm2: Open iTerm2 → Preferences → Profiles → Text and set Font to _MesloLGS NF Regular_
2. Visual Studio Code: Open File → Preferences → Settings, enter `terminal.integrated.fontFamily` in the search box and set the value to _MesloLGS NF Regular_

   e.g., `"terminal.integrated.fontFamily": "MesloLGS NF, 'SourceCodePro+Powerline+Awesome Regular', Source Code Pro for Powerline, monospace, Meslo LG M for Powerline"`

Download and install following color schema for iTerm2

1. [Clovis-iTerm2-Color-Scheme](apps/iterm2/colors/Clovis-iTerm2-Color-Scheme.itermcolors)
2. [Dracula](apps/iterm2/colors/Dracula.itermcolors)
3. [Solarized Dark](apps/iterm2/colors/Solarized-Dark-Patched.itermcolors)

Recommended to set iTerm2 Color Scheme to `Clovis-iTerm2-Color-Scheme`

### Status Bar Customization (Optional)

> Add kubecontext Status Bar component

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

## Fonts

We recommend also downland and install following fonts.
They are using by `VSCode` and `Sublime Text`

1. Source Code Pro
   `brew tap caskroom/fonts && brew cask install font-source-code-pro`
2. [FiraCode-Retina](https://github.com/tonsky/FiraCode/wiki/Installing#macos)
   `brew untap caskroom/fonts && brew tap homebrew/cask-fonts && brew cask install font-fira-code`

## Setup Work Directories

Go to terminal and run the following commands:

To go your root directory:

> if you don't have admin privilege, then use your home directory (`$ cd ~/`) in place of root directory (`$ cd /`) for the rest of this document.

`$ cd /`

Make 'Developer' directory:

`$ sudo mkdir Developer`

Make yourself the owner of 'Developer' directory:

`$ sudo chown -R $USER:admin Developer/`

Change directory to /Developer

`$ cd Developer`

Make 'Work' directory under /Developer:

`$ mkdir Work`

Make 'Applications' directory under /Developer:

`$ mkdir Apps`

Change directory to /Developer/Work

`$ cd Work`

Make 'SPA' directory under /Developer/Work:

`$ mkdir SPA`

Make 'go' directory under /Developer/Work:

`$ mkdir go`

---

## Git

Reference [Git](https://sourabhbajaj.com/mac-setup/Git/) for detailed instructions.

copy [.gitconfig](home/.gitconfig) to your home and change `name` and `email`

---

## IntelliJ/WebStorm/GoLand

---

## Android Studio

---

## VSCode

Go to [VSCode](https://code.visualstudio.com/) and install VSCode if you prefer VSCode instead of Intellij

### Create a shortcut to launch Visual Studio Code in terminal

```bash
cd ~
mkdir bin
ln -s "/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code" ~/bin/code
```

To open dir in `Visual Studio Code` from terminal:

`$ ~/bin/code dir.name`

1. Downlaod and install [FiraCode-Retina](https://github.com/tonsky/FiraCode/wiki/VS-Code-Instructions) font
2. install source-code-pro font via `brew tap caskroom/fonts && brew cask install font-source-code-pro`
3. Use [rest-client](https://marketplace.visualstudio.com/items?itemname=humao.rest-client]) plugin for REST API UAT Testing

### Workspace Settings

Recommended [johnpapa's angular-essentials](https://marketplace.visualstudio.com/items?itemName=johnpapa.angular-essentials) plugin and its settings for **Angular**

Recommended workspace [settings](https://github.com/xmlking/micro-starter-kit/tree/master/.vscode) for **GoLang**

Recommended workspace [settings](https://github.com/xmlking/ngx-starter-kit/tree/master/.vscode) for **Angular**

you can install a plugin with command line : `code --install-extension johnpapa.angular-essentials`

for Source Code Pro: "terminal.integrated.fontFamily": "Source Code Pro for Powerline"
for Meslo: "terminal.integrated.fontFamily": "Meslo LG M for Powerline"
You can also set the fontsize e.g.: "terminal.integrated.fontSize": 14

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
 ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/bin/subl
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

#### Add some color to your terminal

In **iTerm > Preferences...**, under the tab **Profiles**, section **Text**, change both fonts to **Consolas 13pt**.

Go to [Solarized](http://ethanschoonover.com/solarized), scroll down, download, and unzip solarized.

Afterwards, in **iTerm2 Preferences**, under **Profiles** and **Colors**, go to **Load Presets > Import**, find and open the two **.itermcolors** files we downloaded and unzipped.

Go back to **Load Presets** and select **Solarized Dark** to activate it.

---

## Postman

To install Postman go to [https://www.getpostman.com/](https://www.getpostman.com/)

After you install Postman, setup your account

---

## SDKMan

Go to terminal and run:

`$ curl -s "https://get.sdkman.io" | bash`

Then execute contents in file via:

`$ source "$HOME/.sdkman/bin/sdkman-init.sh"`

Verify the installation went well

`$ sdk version`

---

## RVM

Go to terminal and run:

`$ curl -sSL https://get.rvm.io | bash -s stable`

---

## Ruby

Go to terminal and run:

`$ curl -L https://get.rvm.io | bash -s stable --ruby`

After installation is completed, remove .profile and .bashrc files created from the Ruby installion. Also, remove ruby related line from .bash_profile at the bottom of the file.

---

## Java

> Node: we recommend use [SDKMAN](#sdkman-software-installations) to install and upgrade java.

### Traditional installation procedure

Download Java version at least jdk8 [here](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)

> don't install JRE. developers need JDK

---

## GoLang

> Install `go` and `protobuf`

```bash
brew install go
brew install protobuf
```

```bash
cd ~
mkdir go
```

set `GOPATH` in `~/.path`

```bash
export GOPATH=$HOME/go

export PATH=${PATH}:${GOPATH}/bin
```

> keep your GoLang projects outside `GOPATH`, i.e., in `/Developer/Work/go`

---

## Docker

Download Docker at [https://docs.docker.com/docker-for-mac/](https://docs.docker.com/docker-for-mac/)

> edge version is currently needed for local kubernetes env.

Follow instructions [here](https://gist.github.com/xmlking/62ab53753c0f0f5247d0e174b31dab21) to setup Docker and kubernetes

---

## Kubernetes

Go to [Kubernetes for MacOS](https://gist.github.com/xmlking/62ab53753c0f0f5247d0e174b31dab21)
and follow instructions to setup **Kubernetes** with **Docker for Mac** for local development

---

## Angular CLI

Go to terminal and run:

`npm install -g @angular/cli`

## Nrwl's nx CLI

`npm install -g @nrwl/schematics`

---

## SDKman Software Installations

To get a list of current or candidate versions for gradle:

`sdk list java`

To install the following software, go to terminal and run:

```bash
# if you want to manage java version with `sdkman`
# java  `11.0.2-open` is current long-term support (LTS). next best version is `8.0.201-oracle` if you need java8
sdk install java 12.0.1-open
sdk install gradle

#optional
sdk install maven
sdk install kotlin
sdk install scala
sdk install springboot
```

When you prompted to set the newly installed software as default enter 'Y'

How to use [sdkman](http://sdkman.io/usage.html)

To see what is outdated for all Candidates

`sdk upgrade`

To remove old version e.g., gradle 4.8:

`$ sdk remove gradle 4.8`

---

## File References

The following are files should be downloaded from this repository.

The hidden files below are files that should be in your home directory by the end of the setup.

- .bash_profile
- .aliases
- .bash_prompt
- .extra
- .path

The files below are files you can open in sublime text to verify that all settings for sublime are configured correctly (you should hopefully see colorful text) :

- mark.md
- sss.scss
- type.ts

---

## Setup Profile

> copy developer tested `zshrc`, `alias` etc., files to your home directory to make life easy.

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

---

## References

- https://sourabhbajaj.com/mac-setup/
- https://sandor-nemeth.github.io/2017/09/30/setup-mackbook-pro-for-development.html
- https://gist.github.com/kevin-smets/8568070
- https://medium.com/@Clovis_app/configuration-of-a-beautiful-efficient-terminal-and-prompt-on-osx-in-7-minutes-827c29391961
