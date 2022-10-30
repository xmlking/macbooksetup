# GitHub CLI

[gh](https://cli.github.com/) is GitHub CLI brings GitHub to your terminal.

## Install

```shell
brew install gh
```

## Configuration

```shell
# authenticate with your GitHub account
# Alternatively, gh will respect the GITHUB_TOKEN environment variable
gh auth login 
# GitHub Enterprise
gh auth login --hostname <hostname>

# verify
gh auth status
```

```shell
# Print a list of configuration keys and values
gh config list [flags]
# rint the value of a given configuration key
gh config get <key> [flags]
# Update configuration with a value for the given key
gh config set editor "code --wait"
```

## Usage

### repos

```shell
# Cloning a repository
gh repo clone cli/cli
# Sync local repository from remote parent
gh repo sync
```

### alias

```shell
# Aliases can be used to make shortcuts for gh commands or to compose multiple commands.
gh alias set <alias> <expansion> [flags]
$ gh alias set homework 'issue list --assignee @me'
$ gh homework
```

### Miscellaneous

```shell
# Open the GitHub repository in the web browser.
gh browse
# run github actions
gh workflow view
gh workflow list
# publish file 'hello.py' as a public gist
gh gist create --public hello.py
# List all issues
gh issue list
# List all PRs
gh pr list
```

## Extensions

See the list of available extensions at <https://github.com/topics/gh-extension>

### Recommended Extensions

1. [gh-dash](https://github.com/dlvhdr/gh-dash)
2. [gh-releaser](https://github.com/carlsberg/gh-releaser)
3. [gh-dependency-report](https://github.com/andyfeller/gh-dependency-report)

```shell
gh extension install seachicken/gh-poi
gh extension install dlvhdr/gh-dash
gh extension install carlsberg/gh-releaser
gh extension install andyfeller/gh-dependency-report
```

Usage

```shell
# gh dependency-report xmlking
```

Viewing installed extensions

```shell
gh extension list
```

To install an extension in development from the current directory, use `.` as the value for the `repository` parameter.

```shell
gh extension install <repository> [flags]

gh extension install owner/gh-extension
gh extension install https://git.example.com/owner/gh-extension
gh extension install .
```

Updating extensions

```shell
gh extension upgrade `extension`
gh extension upgrade --all
```

Uninstalling extensions

```shell
gh extension remove `extension`
```

Extensions

```shell
gh dash
```
