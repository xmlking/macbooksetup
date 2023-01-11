# pnpm

## Install

```shell
brew install pnpm
```

Add following lines to [~/my/paths.zsh](../../../dotfiles/my/paths.zsh)
```shell
# pnpm
export PNPM_HOME=$HOME/Library/pnpm
export PATH=$PNPM_HOME:$PATH
```

## Commands

```shell
# add package to monorepo's root
pnpm add debug -W
# add package to global
pnpm add debug --global

# update package versions in a repo
pnpm up
pnpm up --latest

pnpm ls prune
pnpm ls

pnpm audit
pnpm why

# Publish all packages in topological order from the workspace.
pnpm publish -r
```

### Patching a node module

In your project repo directory, run:

```shell
pnpm patch @auth/core@0.2.4
```

Output:
> You can now edit the following folder: /private/var/folders/t_/2rzsqx111439_19vxd5f_p800000gp/T/f6f8c74999a108b642b97ab160392cd8
> Once you're done with your changes, run "pnpm patch-commit /private/var/folders/t_/2rzsqx111439_19vxd5f_p800000gp/T/f6f8c74999a108b642b97ab160392cd8"'

Edit the files you need to patch then run: `pnpm patch-commit "path-to-edited-module"`  as stated above.

### create SvelteKit workspace

```shell
pnpm create svelte@latest svelte-starter-kit
# select `yes` for TypeScript, ESLint, Prettier, Playwright and Vitest
```

## Reference

- <https://medium.com/pixel-and-ink/switching-an-nx-repo-to-pnpm-5b1cbd5c3797>
