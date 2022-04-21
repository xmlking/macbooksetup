# Identity
With Digital identify using OpenPGP keys, you can:
- Authentication(SSH) to remote VMs(Cloud or on-Prem)
- Authentication(SSH) to **GitHub**
- sign Git **tags** and **commits**
- Sign **docker** images 
- Sign **SBOM** / CICD Build Stages

GPG sign

[comment]: <> (Your comment text)


## Store

key passphrase should be generated and stored by a password manager.
## Prerequisites
```shell
brew install gpg
```


## Install

Creating SSH keys
```shell
cd ~/.ssh
ssh-keygen -t rsa -b 4096 -C "your@email.com" -f id_whatever

# On Mac, copy the public key to clipboard
cat id_whatever.pub | pbcopy
```

The SSH-agent
vim ~/.ssh/config

```shell
Host ssh-ex
    HostName 104.236.90.57
    User root
    Port 22
    IdentitiesOnly yes
    IdentityFile ~/.ssh/id_sshex
```
Then
```shell
# Should work:
ssh ssh-ex
```
We can use this with any SSH-based tool:
```shell
# For example, scp:
scp -r ~/Downloads ssh-ex:/path/to/files

# Or a one-off command, list home directory
# on remote server:
ssh ssh-ex ls -lah
```
Executing a command on a remote server using SSH

Some topics that I'd like to be covered:


Good info to have is also how to copy ssh key to my server and troubleshooting "why my ssh key does not work":

- home folder (on remote) needs to have 755 permissions (or .ssh folder, not really sure)
- authorized_keys file needs to be set to 600

https://serversforhackers.com/s/ssh-usage-tips-and-tricks



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