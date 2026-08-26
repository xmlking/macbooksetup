# vite-plus

[Vite+](https://viteplus.dev/) Manage your runtime, package manager, and frontend stack with one tool.

## Why Vite+?

Instead of learning a different combination of tools and commands in every repository, developers can use a consistent workflow:

- **vp dev** — start a development server with hot module replacement, powered by [Vite](https://vite.dev/) 8.
- **vp check** — format your code with [Oxfmt](https://oxc.rs/docs/guide/usage/formatter.html), lint it with [Oxlint](https://oxc.rs/docs/guide/usage/linter.html), and type check it at once.
- **vp test** — run unit tests powered by [Vitest](https://vitest.dev/).
- **vp build** — build your project for production, powered by Vite 8.
- **vp pack** — bundle libraries with best practices baked in, powered by [tsdown](https://tsdown.dev/).
- **vp run** — run any npm script or task through the built-in monorepo-aware task runner with intelligent caching.

We are using Vite+ [Monorepo](https://viteplus.dev/guide/monorepo) project structure

- The root `vite.config.ts` consist shared linting, formatting, testing, staged checks, and task definitions. For project-specific dev server, development, build, and preview behavior, use sub module specific `vite.config.ts` file i.e., `apps/web/vite.config.ts` etc

## Quick Start

Create a project, install dependencies, and use the default commands:

```shell
vp create   # Create a new project
vp install  # Install dependencies
vp dev      # Start the dev server
vp check    # Format, lint, type-check
vp test     # Run JavaScript tests
vp build    # Build for production
```

**Options**

_flag is available for all commands_

```shell
-r, --recursive         # Select all packages in the workspace
-t, --transitive        # Select the current package and its transitive dependencies
-w, --workspace-root    # Select the workspace root package.
-v, --verbose           # Show full detailed summary after execution.
```

## Root Workspace Commands

> [!TIP]
> Pass a folder to **built-in** Vite commands when you want to target one app:

```shell
vp dev apps/web    # starts the `web` dev server powered by Vite.

vp check            # runs format, lint, and type checks together.
vp check --fix      # runs format, lint, and type checks together and fix
# `vp lint`, `vp fmt`, and `vp test` let you run those tools directly.
vp staged           # o run checks against the files currently staged in Git

vp run -r clean     # remove all generated directories and node_modules

vp run -r build     # builds all apps.
vp run -r preview   # previews the production build locally.

vp env doctor       # check vite+ is setup properly
vp cache clean      # when you need to clear cached task results.
vp env clean        # to remove unused managed Node.js runtimes and package-manager caches
# The task cache is stored in `node_modules/.vite/task-cache`
```

Testing

> [!IMPORTANT]
> The snapshot artifact (`__snapshots__`) should be committed alongside code changes, and reviewed as part of your code review process.

```shell
vp test
vp test watch
vp test path/to/file.test.ts #  run a single test file
vp test -t "renders correctly and matches snapshot" # run tests whose name matches
vp test --coverage
vp test watch --ui
```

if you want to add new app module to `apps/`, run this command from project root

```shell
vp create @tanstack/start
```

if you want to add new library module to `packages/`, run this command from project root

```shell
vp create vite:library
```

## Sub Module Commands

```shell
vp dev apps/web
vp build apps/web
vp preview apps/web

vp run @workspace/db#studio
vp run @workspace/db#generate
vp run @workspace/db#migrate
vp run @workspace/db#seed
```

## Manage Dependencies

wrap package-manager workflows

`vp add`, `vp remove`, `vp update`, `vp dedupe`, `vp outdated`, `vp why`, and `vp info`

```shell
vp install --filter web #  scopes install work in monorepos
```

# Maintain

- `vp upgrade` updates the vp installation itself.
- `vp implode` removes vp and related Vite+ data from your machine.

## References

- [Vite+ Core Commands](https://viteplus.dev/guide/)
