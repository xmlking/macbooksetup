# Homebrew

[Homebrew](https://brew.sh) is the package manager for macOS and is an essential tool for any developer.

## Prerequisites

Verify installation of **Command Line Tools for Xcode**

```shell
sudo xcode-select --install
```

## Install

Go to terminal and run:

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
```

Output should look like this:

```log
% /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
==> Checking for `sudo` access (which may request your password)...
Password:
==> This script will install:
/opt/homebrew/bin/brew
/opt/homebrew/share/doc/homebrew
/opt/homebrew/share/man/man1/brew.1
/opt/homebrew/share/zsh/site-functions/_brew
/opt/homebrew/etc/bash_completion.d/brew
/opt/homebrew
==> The following new directories will be created:
/opt/homebrew/bin
/opt/homebrew/etc
/opt/homebrew/include
/opt/homebrew/lib
/opt/homebrew/sbin
/opt/homebrew/share
/opt/homebrew/var
/opt/homebrew/opt
/opt/homebrew/share/zsh
/opt/homebrew/share/zsh/site-functions
/opt/homebrew/var/homebrew
/opt/homebrew/var/homebrew/linked
/opt/homebrew/Cellar
/opt/homebrew/Caskroom
/opt/homebrew/Frameworks
==> The Xcode Command Line Tools will be installed.

HEAD is now at 6661f5b14 Merge pull request #12904 from Homebrew/dependabot/bundler/Library/Homebrew/json_schemer-0.2.19
==> Tapping homebrew/core
remote: Enumerating objects: 1146232, done.
remote: Counting objects: 100% (63/63), done.
remote: Compressing objects: 100% (39/39), done.
remote: Total 1146232 (delta 38), reused 47 (delta 24), pack-reused 1146169
Receiving objects: 100% (1146232/1146232), 456.18 MiB | 10.26 MiB/s, done.
Resolving deltas: 100% (792672/792672), done.
From https://github.com/Homebrew/homebrew-core
 * [new branch]              master     -> origin/master
HEAD is now at 383269fb392 checkov: update 2.0.885 bottle.
Warning: /opt/homebrew/bin is not in your PATH.
  Instructions on how to configure your shell for Homebrew
  can be found in the 'Next steps' section below.
==> Installation successful!

==> Homebrew has enabled anonymous aggregate formulae and cask analytics.
Read the analytics documentation (and how to opt-out) here:
  https://docs.brew.sh/Analytics
No analytics data has been sent yet (nor will any be during this install run).

==> Homebrew is run entirely by unpaid volunteers. Please consider donating:
  https://github.com/Homebrew/brew#donations

==> Next steps:
- Run these two commands in your terminal to add Homebrew to your PATH:
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
- Run brew help to get started
- Further documentation:
    https://docs.brew.sh
```

For first time only, run following commands  

> _This will create `~/.zprofile` file if it not exists or append `eval "$(/opt/homebrew/bin/brew shellenv)"` line to existing `~/.zprofile` file_

```shell
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

Once the installation is successful, run the following command:

```shell
brew doctor
```

If you get `Your system is ready to brew.`, you can move on to the next step.

Brew anonymously collect _User Behaviour_ data. To prevent analytics from ever being sent, run:

```shell
brew analytics off
```

### Homebrew Shell Completion

Brew installs _completions_ and _functions_  into: `/opt/homebrew/share/zsh/site-functions` when a formula offers them.

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
