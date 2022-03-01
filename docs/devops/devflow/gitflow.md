# Gitflow Usage

Refer well documented gitFlow [Cheat Sheet](http://danielkummer.github.io/git-flow-cheatsheet/) for details.

## Getting started

Read  __gitflow-avh__ [wiki](https://github.com/petervanderdoes/gitflow-avh/wiki) first.

### GitFlow Commands

![Gitflow](../../images/gitflow-commands.png)

### Initialization

```bash
# on a newly created git main branch, do:
git flow init -d
```

__Remember:__

- You have to do this every time you clone a repo.

### Features

1.  #### Create a Feature Branch

    If you are creating a new feature branch, do this:
    ```bash
    git flow feature start <feature-name> [<base>]
    ```

    If you are starting to work on an existing feature branch started by another developer, do this:
    ```bash
    git flow feature track <feature-name>
    ```

    __Remember:__
    - For feature branches, the `<base>` arg must be `develop` branch commit sha-1. when omitted it defaults to
      the `develop` branch head.
    - All new work (new features, non-emergency bug fixes) must be done in a new feature branch.
    - Give your feature branches sensible names. If you’re working on a ticket, use the ticket number as the feature
      branch name (e.g. ticket-1234).

2. #### Publish The Feature Branch changes to __remote__

   Publish a feature to the remote server so it can be used by other colleagues.
    ```bash
    git flow feature publish <feature-name>
    # or, if you already are into the feature/<feature-name> branch, just issue:
    git flow feature publish
    ```

3. #### Keep Up To Date

   You’ll need to bring down completed features & hotfixes from other developers, and merge them into your feature
   branch regularly. (Once a day, first thing in the morning, is a good rule of thumb).

    ```bash
    # pull down main and develop branches
    git pull --all
    # merge develop into your feature branch
    git merge develop
    # Push your comits back to remote feature branch
    git push
    ```

4. #### Create PR to merge your `feature` branch into `develop` branch

   From GitHub or BitBucket website, create a pull request to `develop` branch from`feature/<feature-name>`.

   Ask a colleague to review your pull-request; don’t accept it yourself unless you have to. Once the pull request has
   been accepted, close your feature using the HubFlow tools:
    ```bash
    git flow feature finish <feature-name>
    ```

### Releases

1. #### Start a release

   When you have enough completed features, create a release branch:
    ```bash
    git pull --all
    git flow release start <version-number> [<base>]
    # optionally publish release
    git flow release publish
    # commit any release related changes and push for CI to trigger actions
   ```

   Once you’ve created the release branch,
    - Create `Changelog`. Preferable automate this task in CI environment triggered on every push to __release/*__
      branch
    - Build the code in the release branch, deploy it into test environments, find bugs.
    - Fix the bugs directly inside the release branch.
    - `deploy -> test -> fix -> redeploy -> retest` cycle continues until you’re happy that the release is good enough
      to release to customers.


2. #### Finish up a release

   When you’re ready to tag the release and merge it back into `main` and `develop` branches, do this:
    ```bash
    git flow release finish <version-number>
    # Don't forget to push your tags, run
    git push --all
    git push origin --tags
    ```
   This closes the release branch and creates a tag called `<version-number>` against the __master__ branch.

   __Remember:__
    - For release branches, the `<base>` arg must be `develop` branch commit sha-1. when omitted it defaults to
      the `develop` branch head.
    - Release branches are given version numbers for name. For example:  `git flow release start 0.1.0`
    - Don't forget to push your tags after finishing the release

### Hotfixes

1. #### Creating Hotfix branch

   A __hotfix__ is a special kind of release. Unlike __features__ and __releases__ (which are branched from __develop__)
   , __hotfixes__ are branched from corresponding tag on the __master__ branch.<br/>
   Use __hotfix__  when you want to make and release an urgent change to your latest released code, and you don’t want
   the changes currently in __develop__ to ship yet.

    ```bash
    git pull --all
    git flow hotfix start <version-number> [<base>]
    # to create a hotfix off of an older tag
    git flow hotfix start 0.1.1 [0.1.0]
   ```

   Once you’ve created the __hotfix__ branch,
    - Create `Changelog`. Preferable automate this task in CI environment triggered on every push to __hotfix/*__ branch
    - Build the code in the hotfix branch, deploy it into test environments, find bugs.
    - Fix the bugs directly inside the hotfix branch.
    - `deploy -> test -> fix -> redeploy -> retest` cycle continues until you’re happy that the release is good enough
      to release to customers.

2. #### Finishing Hotfix

   When you’re ready to tag the hotfix and merge it back into __master__ and __develop__ branches, do this:
    ```bash
    git flow hotfix finish <version-number>
    # Don't forget to push your tags with
    git push --all
    git push origin --tags
    ```
   This closes the hotfix branch and creates a tag called `<version-number>` against the __master__ branch.

   __Remember:__
    - For hotfix branches, the `<base>` arg must be `main` branch, when omitted it defaults to the  `main` branch.
    - You can use `git flow hotfix start <version-number> <older-tag>` to create a hotfix off of an older tag.
    - However, if you look back at [Vincent’s original diagram](http://nvie.com/posts/a-successful-git-branching-model/)
      , notice how changes happen in __time__ order. When you finish this kind of hotfix, it gets merged back into the
      latest main branch; it does not get merged into just after the tag that you branched off. This can cause
      problems, such as __main__ ending up with the wrong version number, which you will have to spot and fix by hand
      for now.

## Reference

- https://vimeo.com/16018419
- https://vimeo.com/37408017
