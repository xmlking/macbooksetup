# Bun

[Bun](https://bun.sh/) is a fast JavaScript all-in-one toolkit

## Install

```shell
brew tap oven-sh/bun # for macOS and Linux
brew install bun
# Upgrading bun itself
bun upgrade
```

Add `~/.bun/bin` to your $PATH in the `~/.zshrc` file

```shell
# verify
bun --version
bun --help
```

## Uninstall

```shell
brew uninstall bun
rm -rf ~/.bun # for macOS, Linux, and WSL
```

## Scaffold

To scaffold a new project:

```shell
mkdir quickstart
cd quickstart
bun init
```

To install the TypeScript definitions for Bun's built-in APIs, install bun-types.

```shell
bun add -d bun-types # dev dependency
```

In the repo root, set `.gitattributes` and `git config` as documented [here](https://bun.sh/docs/install/lockfile)

## Utils

package manager

```shell
bun pm bin
bun pm bin -g
bun pm ls
bun pm cache
bun pm cache rm

bun update
```

```shell
bun run env
```
