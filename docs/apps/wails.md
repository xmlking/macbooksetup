# Wails

[Wails](https://wails.io/) is a project that enables you to write desktop apps using Go and web technologies.

## Install

```shell
go install github.com/wailsapp/wails/v2/cmd/wails@latest
# optional
brew install upx
# verify
wails doctor
```

## Create

```shell
wails init -n myproject -t svelte-ts
cd myproject
```

## Run

```shell
cd myproject
wails dev
# Compiling your Project
wails build
```
