# pnpm

## Install

```shell
brew install pnpm
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

### create SvelteKit workspace

```shell
pnpm create svelte@latest svelte-starter-kit
# select `yes` for TypeScript, ESLint, Prettier, Playwright and Vitest
```

## Reference

- <https://medium.com/pixel-and-ink/switching-an-nx-repo-to-pnpm-5b1cbd5c3797>
