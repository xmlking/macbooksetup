# Mac Developer Setup

* [Mac Admin Privileges](#mac-admin-privileges)
* [Xcode Request](#xcode)
* [Self Service Installations](#self-service-installations)
* [Homebrew](#homebrew)
* [Upgrade Bash](#upgrade-bash)
* [Node](#node)
* [Angular CLI](#angular-cli)
* [Setup work directories](#setup-work-directories)
* [Intellij](#intellij)
* [VSCode](#vscode)
* [Sublime Text 3](#sublime-text-3)
* [iTerm2](#iterm2)
* [Postman](#postman)
* [SDKman](#sdkman)
* [RVM](#rvm)
* [Ruby](#ruby)
* [Java](#java)
* [Docker](#docker)
* [Kubernetes](#kubernetes)
* [Homebrew Software Installations](#homebrew-software-installations)
* [SDKman Software Installations](#sdkman-software-installations)
* [File References](#file-references)
* [Setup Profile](#setup-profile)
* [Setup Anaconda3](#setup-anaconda3)
* [Setup Citrix](#setup-citrix)

**Installation steps below assume that you are have Admin Access currently enabled**

---
## Xcode

---
## Self Service Installations

If not yet already installed on your Macbook, you can install the following apps:

  * Microsoft Office
  * Chrome
  * Xcode

---
## Post XCode install

### Install XCode

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

``$ gcc --version``

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
## Homebrew

Go to terminal and run:

`$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

Once the installation is successful, run the following command:

`$ brew doctor`

If you get Your system is ready to brew, you can move on to the next step.

---
## Homebrew Software Installations

To update brew:

`$ brew update`

To install the following software, go to terminal and run:

>  Highly recommended to upgrade bash to [v5+](https://itnext.io/upgrading-bash-on-macos-7138bd1066ba). and follow [Upgrade Bash](#upgrade-bash) instructions  

```bash
# tools
brew install bash
brew install watch
brew install jq
brew install git

# languages 
brew install node
brew install python
brew install go

# optional
brew install openshift-cli
# if you are going to install `docker-for-mac`, it comes with `kubectl` and don't need install it again via brew.
brew install kubernetes-cli
```

---
## Upgrade Bash

Follow: [How to install Bash 5.0 on macOS](https://www.ioannispoulakas.com/2019/03/10/how-to-install-bash-5-on-macos/)

1. upgrade bash to [v5+](https://itnext.io/upgrading-bash-on-macos-7138bd1066ba) following instructions on the link 
2. [Change the default shell via the terminal gui with the literal path of your new bash](https://apple.stackexchange.com/questions/193411/update-bash-to-version-4-0-on-osx)

after following above instructions, you can conform your default shell is upgraded to Bash v5+
  
```bash
bash --version
GNU bash, version 5.0.2(1)-release (x86_64-apple-darwin17.7.0)

```

### Bonus: install bash-completion

#### Install bash-completion for MacOS (Bash v5+)

```bash
brew install bash-completion@2
```
Paste this into your ~/.extra  file:
```bash
# bash-completion used with Bash v5+
export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
```

#### Enable kubectl auto-completion for MacOS (Bash v5+)
```bash
kubectl completion bash > $(brew --prefix)/etc/bash_completion.d/kubectl
alias k=kubectl
complete -F __start_kubectl k
```

> Node: we add the above settings in [.extra](home/.extra) and [.aliases](home/.aliases) for you. follow [Setup Profile](#setup-profile) section later.

---
## Setup Work Directories

Go to terminal and run the following commands:

To go your root directory:

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

`$ mkdir Applications`

Change directory to /Developer/Work

`$ cd Work`

Make 'SPA' directory under /Developer/Work:

`$ mkdir SPA`

Make 'go' directory under /Developer/Work:

`$ mkdir go`

---

## Git

>  Tell Git who you are
```bash
git config --global user.name "Your Full Name"
git config --global user.email "you@example.com"
```

> Global settings for line endings
```bash
# On macOS and Linux:
git config --global core.autocrlf input
# And on Windows:
git config --global core.autocrlf = true
```

> (Optional)To push code to your GitHub repositories, we're going to use the recommended HTTPS method (versus SSH). So you don't have to type your username and password everytime, let's enable Git password caching:

```bash
git config --global credential.helper osxkeychain
```

---
## IntelliJ/WebStorm/GoLand

---
## Android Studio

---
## VSCode

Go to [VSCode](https://code.visualstudio.com/) and install VSCode if you prefer VSCode instead of Intellij

#### Create a shortcut to launch Visual Studio Code in terminal

```bash
 cd ~
 mkdir bin
ln -s "/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code" ~/bin/code
 ```

To open dir in `Visual Studio Code` from terminal:

`$ ~/bin/code dir.name`

---
## Sublime Text 3

Install Sublime Text at [www.sublimetext.com](www.sublimetext.com).

---

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


Afterwards, go to **Preferences ->  Settings-User** and copy and paste following JSON

```json
{
	"bold_folder_labels": true,
	"color_scheme": "Packages/Monokai Extended/Monokai Extended.tmTheme",
	"font_face": "Consolas",
	"font_size": 14,
	"highlight_line": true,
	"highlight_modified_tabs": true,
	"ignored_packages":
	[
		"Vintage"
	],
	"indent_to_bracket": true,
	"rulers":
	[
		79
	],
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
## iTerm2

To install iTerm2, from [http://iterm2.com/](http://iterm2.com/)

#### iTerm2 setup for day-to-day use 
1. enable iterm2 Session [Restoration]( https://iterm2.com/documentation-restoration.html)

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

* .bash_profile
* .aliases
* .bash_prompt
* .extra
* .path

The files below are files you can open in sublime text to verify that all settings for sublime are configured correctly (you should hopefully see colorful text) :

* mark.md
* sss.scss
* type.ts

---
## Setup Profile
> copy developer tested `profile`, `alias` etc., files to your home directory to make life eazy.

to finish this task, run the following commands in terminal:
```bash
# go to your home dir
cd ~
curl -O https://raw.githubusercontent.com/xmlking/macbooksetup/master/home/.bash_profile
curl -O https://raw.githubusercontent.com/xmlking/macbooksetup/master/home/.aliases
curl -O https://raw.githubusercontent.com/xmlking/macbooksetup/master/home/.bash_prompt
curl -O https://raw.githubusercontent.com/xmlking/macbooksetup/master/home/.extra
curl -O https://raw.githubusercontent.com/xmlking/macbooksetup/master/home/.path
curl -O https://raw.githubusercontent.com/xmlking/macbooksetup/master/home/.exports
```

---
## References
* https://sandor-nemeth.github.io/2017/09/30/setup-mackbook-pro-for-development.html
