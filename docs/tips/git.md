# Git


- 5 steps to change GitHub default branch from master to main

    ```bash
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
    Ref: https://stevenmortimer.com/5-steps-to-change-github-default-branch-from-master-to-main/

- When to use Rebase vs merge?
  - When merging `feature -> main` or `release -> main` use **merge**
  - When merging `main --> feature` to keep your _feature_ branch up-to-date, use **rebase**
  Read to jeffkreeftmeijer's [Rebase vs merge](https://jeffkreeftmeijer.com/git-rebase/) blog
