# Node
[NodeJS](https://nodejs.org/en/) used for _Full-Stack Development_.

1. **Frontends:** Angular, React, Vue.js, [svelte](https://svelte.dev) - prefered. 
2. **Backends:** [nestjs](https://nestjs.com)

you can use [npm](npm.md) (default) or [pnpm](pnpm.md) as Node **Package Manager**.

## Install

```shell
brew install node
```

## Usage

```shell
node --version
npm --version
```

### Switching node version
```bash
# To see your current node version
node --version
# To see available node versions
brew search node
# To unlink from current version
brew unlink node
# Install any version e.g. 12
brew install node@12
# To link a different installed version
brew link node@12 
brew link --force --overwrite node@12 # some time u have to do this
# To see your current node version (again)
node --version
```

### Publish
Publishing to [GitHub Packages](https://github.com/features/packages)

With in your node project:

1. Use `publishConfig` option in your `package.json`
    ```json
    "publishConfig": { "registry": "https://npm.pkg.github.com/" }
    ```

2. Authenticate
    ```shell
    npm logout
    npm login --registry=https://npm.pkg.github.com --scope=@xmlking
    ```

3. Publish
    ```shell
    npm publish
    ```

You `~/.npmrc` might have multiple registries 
```
//registry.npmjs.org/:_authToken=${NPM_TOKEN}
```

## FAQ

How to Delete ALL `node_modules` folders on your machine

```
$ cd documents
$ find . -name "node_modules" -type d -prune -print | xargs du -chs
```
