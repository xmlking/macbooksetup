# Homebrew

[Homebrew](https://brew.sh) is the package manager for macOS and is an essential tool for any developer.

## Prerequisites

Verify installation of **Command Line Tools for Xcode**

```shell
sudo xcode-select --install
```

## Install

The ~/.zshrc doesn’t exist by default in macOS, so you need to create it.

Go to *Terminal* and run:

```shell
touch ~/.zshrc
```

Not install brew from *Terminal*

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

For first time only, run following commands  

> *This will create `~/.zprofile` file if it not exists or append `eval "$(/opt/homebrew/bin/brew shellenv)"` line to existing `~/.zprofile` file*

```shell
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

Once the installation is successful, run the following command:

```shell
brew doctor
```

If you get `Your system is ready to brew.`, you can move on to the next step.

Brew anonymously collect *User Behaviour* data. To prevent analytics from ever being sent, run:

```shell
brew analytics off
```

### Homebrew Shell Completion

Brew installs *completions* and *functions*  into: `/opt/homebrew/share/zsh/site-functions` when a formula offers them.

[Shell completions](https://docs.brew.sh/Shell-Completion) for external Homebrew commands are not automatically installed. To opt-in to using completions for external commands (if provided), they need to be linked to `HOMEBREW_PREFIX` by running `brew completions link`.

To make Homebrew’s completions available in **zsh**, you must insert the Homebrew-managed `zsh/site-functions` path into your `FPATH` before initialising zsh’s completion facility. Add the following to your `~/.zshrc`:

```shell
if type brew &>/dev/null
then
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

autoload -Uz compinit
compinit
fi
```

> Note that, this snippet must be added in the top if `~/.zshrc`

### non-admin

> [!CAUTION]
> Installing homebrew in non-standared location like below, will cause some packages not work properly.

If you don't have **admin/sudo** access to your laptop(e.g., company issued laptop), recomend installing **brew** in your home directory.
In this case follow these steps

```shell
cd $HOME
mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew
```

Then add brew to front of PATH by editing your shell profile file: `.zprofile` and adding below line:

```shell
eval "$($HOME/homebrew/bin/brew shellenv)"
```

## Usage

Troubleshooting:

```shell
brew config
brew doctor
brew update # self update brew
brew --prefix # show brew home
brew --cellar # show where brew install software
```

Example usage:

```shell
brew install <formula> # to install a package (or Formula in Homebrew vocabulary) 
brew search TEXT|/REGEX/ # to search for formulas
brew info <formula> # to get more information about a formula
brew install --verbose --debug <formula>
brew list # to see what you have installed
brew list --versions # To see what you have installed
brew outdated # to see if any of your formulas need to be updated
brew upgrade <formula> # to upgrade a specific formula 
brew uninstall<formula> # to uninstall a formula 
```

Homebrew keeps older versions of formulas installed on your system, in case you want to roll back to an older version.
That is rarely necessary, so you can do some cleanup to get rid of those old versions:

```shell
brew cleanup
# If you want to see what formulae Homebrew would delete without actually deleting them, you can run:
brew cleanup --dry-run 
```
