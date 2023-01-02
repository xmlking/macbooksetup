# mkcert

[mkcert](https://github.com/FiloSottile/mkcert) is a simple tool for making locally-trusted development certificates. It requires no configuration.

## Install

```shell
brew install mkcert
```

## Setup

```shell
# NOTE: sudo is needed
mkcert -install 
# this will create root CA cert into: `mkcert -CAROOT` output
mkcert -CAROOT
```

## Usage

Used to setup https on `localhost` for [Vite](https://github.com/liuweiGL/vite-plugin-mkcert), SvelteKit project 
