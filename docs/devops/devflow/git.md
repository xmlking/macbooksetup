# git

**Git** installed via brew `brew install git`<br/>
And `which git` should output `/opt/homebrew/bin/git`.

Copy `.gitconfig` file as described in [Dotfiles](../../essentials/dotfiles.md) to your home directory. i.e., `~/.gitconfig`<br/>
Next, we'll define your Git user (should be the same name and email you use for GitHub):
```shell
git config --global user.name "Your Name Here"
git config --global user.email "your_email@company.com"
```

Also copy `.gitattributes` and `.gitignore` files as described in [Dotfiles](../../essentials/dotfiles.md) to your home's `my` directory. i.e., `~/my`<br/>
Customize your `.gitignore` by visiting [gitignore.io](https://www.toptal.com/developers/gitignore?templates=macos) and fill it what you need.

##  autocrlf

**Why do you want this ?**

Because _Git_ will see diffs between files shared between _Linux_ and _Windows_ due to differences in line ending handling ( Windows uses _CR_ and Unix _LF_)

TL;DR,  Using `git config core.autocrlf true` can help, but **not** on a multi-developers(Windows and MacOS) projects.
This setting has to be the same on each developer machine, and that's not always the case.

### Recommendations
1. Global settings for line endings
   - Set `core.autocrlf` to **input** on **MacOS** 
       ```
       git config --global core.autocrlf input
       ```
   - Set `core.autocrlf` to **true** on **Windows**
       ```
       git config --global core.autocrlf true
       ```
       
2. Set a _global_ [.gitattributes](../../../dotfiles/my/.gitattributes) to your home directory, as described in [Dotfiles](../../essentials/dotfiles.md).
3. Pick a platform specific `.gitattributes` from [here](https://github.com/alexkaratarakis/gitattributes) and `.gitignore`  from [gitignore.io](https://www.toptal.com/developers/gitignore?templates=macos), add them to your project root. 
    > Explore **Web** project template [Web.gitignore](../../../apps/git/Web.gitignore) and [Web.gitattributes](../../../apps/git/Web.gitattributes).


### Normalize line endings

If you have any binary files in the repository that:
1. are not correctly marked as binary in `gitattributes`, and 
2. happen to contain both CRLFs and LFs files,

Then follow the instructions [here](https://stackoverflow.com/questions/1510798/trying-to-fix-line-endings-with-git-filter-branch-but-having-no-luck/1511273#1511273) (echoed on [GitHub's help pages](https://help.github.com/articles/dealing-with-line-endings/)) to convert the repository to contain only LF line-endings

This Gist normalizes repo by forcing everything to use Unix style.


```shell
# From the root of your repository remove everything from the index
git rm --cached -rf .

# Change the autocrlf setting of the repository (you may want to use `true` on windows):
git config core.autocrlf input

# Re-add all the deleted files to the index
# (You should get lots of messages like:
#   warning: CRLF will be replaced by LF in <file>.)
git diff --cached --name-only -z | xargs -n 50 -0 git add -f

# Commit
git commit -m "Normalize all the line endings"

# If you're doing this on a Unix/MacOS clone then optionally remove
# the working tree and re-check everything out with the correct line endings.
git ls-files -z | xargs -0 rm
git checkout .
```

## Using HTTPS for GitHub (recommended)

These instructions are from [the official documentation](https://help.github.com/en/github/using-git/which-remote-url-should-i-use#cloning-with-https-urls-recommended).

### Clone repositories using HTTPS

After creating a new repo on GitHub, clone it using:

```sh
git clone https://github.com/<username>/<repo-name>.git
```

\- if you had initialized with a README.

If you did not, follow the instructions in the section below.

### Set up a new or existing repo with HTTPS for GitHub

If you are setting up a new repo, add at least one file and commit first. Then, configure the remote and push to GitHub by running:

```sh
git remote add origin https://github.com/<username>/<repo-name>.git
git push -u origin master
```

## SSH Config for GitHub

These instructions are for those who wish to use SSH and not HTTPS, and are from [the official documentation](https://help.github.com/articles/generating-ssh-keys).

### Check for existing SSH keys

First check for existing SSH keys on your computer by running:

```sh
ls -al ~/.ssh
# Lists the files in your .ssh directory, if they exist
```

Check the directory listing to see if you have files named either `id_rsa.pub` or `id_dsa.pub`. If you don't have either of those files then read on, otherwise skip the next section.

### Generate a new SSH key

If you don't have an SSH key you need to generate one. To do that you need to run the commands below, and make sure to substitute the placeholder with your email. The default settings are preferred, so when you're asked to enter a file in which to save the key, just press Enter to continue.

```sh
ssh-keygen -t rsa -C "your_email@example.com"
# Creates a new ssh key, using the provided email as a label
```

### Add your SSH key to the ssh-agent

Run the following commands to add your SSH key to the `ssh-agent`.

```sh
eval "$(ssh-agent -s)"
```

If you're running macOS Sierra 10.12.2 or later, you will need to modify your `~/.ssh/config` file to automatically load keys into the ssh-agent and store passphrases in your keychain:

```ssh-config
Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_rsa
```

No matter what operating system version you run you need to run this command to complete this step:

```sh
ssh-add -K ~/.ssh/id_rsa
```

### Adding a new SSH key to your GitHub account

The last step is to let GitHub know about your SSH key so GitHub can recognize you. Run this command to copy your key to your clipboard:

```sh
pbcopy < ~/.ssh/id_rsa.pub
```

Then go to GitHub and [input your new SSH key](https://github.com/settings/ssh/new). Paste your key in the "Key" text-box and pick a name that represents the computer you're currently using.

We are now ready to use SSH with GitHub!

### Clone repositories using SSH

After creating a new repo on GitHub, clone it using

```sh
git clone git@github.com:<username>/<repo-name>.git
```

\- if you had initialized with a README.

If you did not, follow the instructions in the section below.

### Set up a new or existing repo with SSH for GitHub

If you are setting up a new repo, add at least one file and commit first. Then, configure the remote and push to GitHub by running:

```sh
git remote add origin git@github.com:<username>/<repo-name>.git
git push -u origin master
```