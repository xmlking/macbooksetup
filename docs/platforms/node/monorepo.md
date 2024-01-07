# Monorepo

Monorepos are very popular in modern application development because of their immense benefits.
A monorepo is a single repository having multiple distinct projects with well-defined associations.
Note that monorepo is not a monolith; in fact, it is the opposite of a monolith.

It is very easy to make cross-cutting code changes across different applications (/backend, /frontend) in a single atomic commit.

Learn more about monorepo at [monorepo.tools](https://monorepo.tools/)

In this document, we will using [Turborepo](https://turbo.build/) to implement Monorepos


**Turborepo** is a high performant and blazing-fast build tool for monorepo for *Typescript* and *Javascript* projects.  
It provides some powerful features like:

- Fast incremental build.
- Local computational caching.
- Distributed computation caching.
- Local task orchestration.
- Dependency graph visualization.
- Source code sharing.

## Why Turborepo?
The main idea behind monorepo is to never recompute the work that has already been done before. It keeps a cache of previous builds for each project and then uses it for subsequent builds. . It keeps track of the output of any task you execute and then skips the work that is already done.

Some of the other features of *Turborepo* include:
- **Incremental builds** - Turborepo will remember what you have built and skip the existing computations
- C**ontext-aware hashing** - Turborepo keeps track of the contents of your files, not date/time, to identify what needs to be built.
- **Zero runtime overhead** - Turborepo will not interfere with your runtime code or alter your sourcemaps
Pruned subsets. 
- **Profile in your browser** - You can create build profiles and import them in Edge or chrome browser to identify which tasks are running the longest.

## Turborepo project structure
- apps/**web**
- apps/**docs**
- apps/**store**
- packages/**components** (Shared codebase. Design system, shared react components, custom libraries, …)
- packages/**tsconfig** (Typescript configuration)
- packages/**eslint-config-custom **(Linter configuration)

## How to use Turborepo?
Following are some of the commands to use Turborepo:

- `npx create-turbo@latest turbo-demo` scaffolds a monorepo with apps (`docs`, `web`) and packages (design system and shared configs (`eslint`, `tsconfig)
- `turbo run build`  builds all apps simultaneously. When you execute this command again, the second build completes in just 100ms because everything is cached. There are many [variations](https://turborepo.org/docs/reference/command-line-reference) of `turbo run` command.
- `turbo prune --scope=<target>` creates a sparse/partial monorepo with a pruned lockfile for a target package.
- Remote Caching commands: `turbo login` and `turbo link`

### Prerequisites

1. Turbo CLI
  ```shell
  pnpm add -g turbo@latest
  ```
2. VS Code monorepo plugin: [Monorepo Focus Workspace](https://marketplace.visualstudio.com/items?itemName=alberto-varela.monorepo-focus-workspace)
  ```shell
  code --install-extension alberto-varela.monorepo-focus-workspace
  ```

## Playbook  
```shell
# create a fresh svelte turborepo
pnpm dlx create-turbo@latest -e with-svelte
# update all dependencies 
 pnpm up --latest -r

```

## Maintenance  
```shell
# update all dependencies 
 pnpm up --latest -r
```

```shell
turbo run dev --filter=./apps/web
```

## Reference

- [Monorepo Handbook](https://turbo.build/repo/docs/handbook)
- [Supercharging Your Dev Experience With Turborepo](https://portal.gitnation.org/contents/supercharging-your-dev-experience-with-turborepo)
- [Setup a Monorepo with Turborepo, Next.js, and Tailwind CSS](https://mrizkiaiman.medium.com/setup-a-monorepo-with-turborepo-next-js-and-tailwind-css-5cd751d34bc9)
- [Turborepo example](https://medium.com/@bogdansikora/turborepo-example-9e3f446215df)
- [SvelteKit (w/ Houdini) x Tailwind CSS x Storybook x Nhost x Turborepo (pnpm)](https://github.com/usagizmo/webapp-template/tree/main)