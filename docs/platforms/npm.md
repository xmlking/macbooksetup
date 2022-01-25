# npm

### Usage

```bash
# example installing packages globally. use `-g` flag
npm install -g npm-check-updates
npm install -g dynamodump --force 
```

#### Workspace

```bash
# Run "test" script on all packages
npm run test --workspaces

# Tip - this also works:
npm run test  -ws
```

```bash
# Runs "test" only on package-a
npm run test --workspace package-a

# Tip - this also works:
npm run test -w package-a
```

```bash
# Install `lodash` on `package-a`
npm install lodash --workspace package-a
npm install @nestjs/microservices --workspace apps/api

# Install `tap` on `package-b` as a dev dependency
npm install tap --workspace package-b --save-dev

# Install `package-a` on `package-b`
npm install package-a --workspace package-b

# Install `eslint` in all packages
npm install eslint --workspaces
```

## Update

```bash
# To install major updates globally
npm install -g npm-check-updates

# To see a list of outdated packages
npm outdated

# To update the packages to their latest versions in package.json
ncu -u

# To install the new updates
npm update 	or 	npm install
```

## References
- [Getting Started with npm Workspaces](https://ruanmartinelli.com/posts/npm-7-workspaces-1)
