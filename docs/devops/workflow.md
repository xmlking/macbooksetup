#Development Workflow

Adopting best practices for Git **Branching, Versioning, Conventional Commits**, and **Release** process.<br/>
Simplify **Developer Workflow** and provide a great **Developer Experience (DX)**

**Highlights**
- Fully automated release
- Enforce [Semantic Versioning](https://semver.org) specification
- Use formalized commit message convention to document changes in the codebase
- Publish on different distribution channels i.e, __SNAPSHOT__ on `develop, hotfix` branches and __Stable__ in `main` branch
- Avoid potential errors associated with manual releases

Here, we’ve standardised on:

- [GitFlow](https://nvie.com/posts/a-successful-git-branching-model/) as git branching model
- [Semantic-Release](https://semantic-release.gitbook.io/semantic-release/) for release process
- [Semantic Versioning 2.0.0](https://semver.org/) for versioning
- [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) for commit messages


## Install

1. [convco](https://convco.github.io/) git extension

    ```shell
     # install and configure `convco` git extension
     brew install convco/formulae/convco
    ```

    Recommend Git alias: (TODO: [Not supported yet](https://github.com/ttys3/git-cz))
    ```shell
    # use "git cc" for quick commit
    git config --global alias.cc 'convco commit'
    git config --global alias.ck 'convco check'
    git config --global alias.cl 'convco changelog'
    git config --global alias.cv 'convco version'
    ```

2. [gitflow](https://github.com/petervanderdoes/gitflow-avh) git extension

   Check installation [instructions](https://github.com/petervanderdoes/gitflow-avh/wiki/Installation) for your platform.
    ```shell
    brew install git-flow-avh
    ```

3. [git-chglog](https://github.com/git-chglog/git-chglog)

    ```shell
    # CHANGELOG generator
    brew tap git-chglog/git-chglog
    brew install git-chglog
    ```

## Usage

### Convco
A git subcommand for creating conventional-friendly commit messages.

[Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) is a specification for adding _human_ and _machine-readable_ meaning to commit messages.

It provides the following commands:
  * **convco changelog**: Create a changelog file.
  * **convco check**: Checks if a range of commits is following the convention.
  * **convco commit**: Helps to make conventional commits.
  * **convco version**: Finds out the current or next version.

```shell
# commit a new feature and then run git commit with the interactive patch switch
convco commit --feat -- --patch
# check logs
git log --pretty=oneline
# Check a range of revisions for compliance.
convco check $remote_sha..$local_sha
convco version --bump
# It is useful to use it with release tools, such as cargo-release:
cargo release $(convco version --bump)
# changelog
convco changelog > CHANGELOG1.md
```

### Gitflow
[Gitflow](http://nvie.com/posts/a-successful-git-branching-model/) is a branching model for Git, created
by [Vincent Driessen](https://nvie.com/about/).  
It has attracted a lot of attention because it is very well suited to collaboration and scaling the development team.

![Gitflow](../images/gitflow-overview.webp)

Follow [Gitflow Usage](./gitflow.md)

### Changelog

On release branch, generate __CHANGELOG.md__ and commit it, before merging back to develop & main.

Generate changelog using [git-chglog](https://github.com/git-chglog/git-chglog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and adheres
to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

```shell
# first time
git-chglog --init
# on release branch, generate CHANGELOG.md and commit before merging back to develop & main.
git-chglog -c .github/chglog/config.yml -o CHANGELOG.md --next-tag 2.0.0
```


 