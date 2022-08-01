# Rust

Rust is a systems programming language that runs blazingly fast, prevents segfaults, and guarantees thread safety.

### Installation
For installation, it's advised to use `rustup` as it will (among other things) allow you to switch between versions of Rust without having to download anything additional.

```shell
brew install rustup
```

Use _rustup_ to install the Rust compiler (_rustc_) and the Rust package manager (_cargo_).

```shell
rustup-init
```

Above command will add `$HOME/.cargo/env` to `~/.zshenv` `~/.profile`  and `~/.bash_profile` files. 
we don't need this as we add `source "$HOME/.cargo/env"` to `~/my/extra.zsh` file.

when prompted `Modify PATH variable? (Y/n)` enter `n`

```shell
```shell
rm -f   .zshenv .profile  .bash_profile
```

To verify you can run:

```shell
rustc --version
```

To upgrade `rustup`

```shell
brew upgrade rustup
# or
rustup self update
```

Enable tab completion for Zsh
```shell
# rustup completions bash > $(brew --prefix)/etc/bash_completion.d/rustup.bash-completio
rustup completions zsh > ~/.zfunc/_rustup
```

To update `rust`

```shell
rustup update
rustup update stable
```