# Git

Git tips and FAQ

- Show contributors

  ```shell
  git shortlog -s -n
  ```

- Reverting a failed update

  ```shell
  git reset --hard # Reset any changes
  git clean -fd # Delete newly added files and directories
  ```

- Prune local branches

  ```shell
  git remote prune origin --dry-run
  ```
  
- GitHUb: change remote from `http` (<https://github.com/xmlking/yeti.git>) to `ssh`

  ```shell
  git remote set-url origin git@github.com:xmlking/yeti.git
  ```

- Set git global config (which are already set for you in [dotfiles](../../dotfiles/.gitconfig))

  ```shell
  git config --global init.defaultBranch develop
  git config --global pull.rebase false
  ```

- Rename git tags

  ```shell
  git tag new old
  git tag -d old
  git push origin :refs/tags/old
  git push --tags
   
  git pull --prune --tags
  ````

- Undoing the Last Commit:

  ```shell
  git reset --soft HEAD~1
  # If you don't want to keep these changes, simply use the --hard flag. 
  git reset --hard HEAD~1
  ```

- Tags

  ```shell
  git describe --tags
  
  # Delete Tags
  ## local
  git tag --delete v0.1.3
  ## remote
  git push --delete origin v0.1.3
  ```

- setup ssh keys for github and signing GPG key for commits and tags

  TODO **YubiKey**

- 5 steps to change GitHub default branch from master to main

    ```shell
    # Step 1 
    # create main branch locally, taking the history from master
    git branch -m master main
    
    # Step 2 
    # push the new local main branch to the remote repo (GitHub) 
    git push -u origin main
    
    # Step 3
    # switch the current HEAD to the main branch
    git symbolic-ref refs/remotes/origin/HEAD refs/remotes/origin/main
    
    # Step 4
    # change the default branch on GitHub to main
    # https://docs.github.com/en/github/administering-a-repository/setting-the-default-branch
    
    # Step 5
    # delete the master branch on the remote
    git push origin --delete master
    ```

    Ref: [5-steps-to-change-github-default-branch-from-master-to-main](https://stevenmortimer.com/5-steps-to-change-github-default-branch-from-master-to-main/)

- When to use Rebase vs merge?
  - When merging `feature -> main` or `release -> main` use **merge**
  - When merging `main --> feature` to keep your _feature_ branch up-to-date, use **rebase** <br/>
  Read jeffkreeftmeijer's [Rebase vs Merge](https://jeffkreeftmeijer.com/git-rebase/) blog
