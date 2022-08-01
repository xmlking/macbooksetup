# YubiKey

Guide to setup **[YubiKey](https://developers.yubico.com/PGP/)** for encryption, SSH authentication and signing Git commits. 

Store the **passphrase** of all of your SSH keys securely in **iCloud Keychain**, from which _ssh-agent_ will read them on startup.

## Prerequisites 

- YubiKey 5 key
- YubiKey Manager [Software](https://www.yubico.com/support/download/yubikey-manager/)
- YubiKey Personalization Tool [Software](https://www.yubico.com/support/download/yubikey-personalization-tools/)

Verify a **YubiKey** is genuine, open a browser to https://www.yubico.com/genuine/

## Install

```shell
brew install gnupg yubikey-personalization hopenpgp-tools ykman pinentry-mac
```

> There is a private key file stored on your machine, but your private SSH key is a reference to the security key device itself.<br/>
> If your private key file on your computer is stolen, it would be useless without the security key.

```shell
# where the “sk” suffix is short for “security key.”
 ssh-keygen -t ecdsa-sk -C <email address> 
 ssh-keygen -t ecdsa-sk -O verify-required # password-less
 ssh-keygen -t ed25519-sk
```

### passphrase

Configure **SSH-agent** to always use the Keychain

Add the following lines to your `~/.ssh/config` file:
```shell
Host foo
  HostName foo.com
  User fooUser
  IdentityFile ~/.ssh/foo

Host bar
  HostName bar.com
  User barUser
  IdentityFile ~/.ssh/bar
########################
# Keep the default configuration 
#  as the last item in this file
Host *
  UseKeychain yes
  AddKeysToAgent yes
  #IdentityFile ~/.ssh/id_rsa
  IdentityFile ~/.ssh/foo
  IdentityFile ~/.ssh/bar
```

Any key you add to the **ssh-agent** using the `ssh-add --apple-use-keychain ~/.ssh/[your-private-key]` command will be automatically added to the **keychain**, and should be `automatically loaded` upon reboot.

You should be able to see the keys in the Keychain Access app, as well as from the command line via:
```shell
ssh-add -l
```

### Static secrets

The Yubikey can be configured to type in a string when its button is long-pressed.<br/>
To setup, follow [Yubikeys for Static Secrets](https://www.engineerbetter.com/blog/yubikey-static-secret/) blog

To auto type secret, **Press and hold the Yubikey button for 3-4 seconds.**

## Reference 
- [YubiKey-Guide](https://github.com/drduh/YubiKey-Guide)
- [Git SSH Authentication on macOS](https://medium.com/codex/git-authentication-on-macos-setting-up-ssh-to-connect-to-your-github-account-d7f5df029320)
- [How can I permanently add my SSH private key to Keychain so it is automatically available to ssh?](https://apple.stackexchange.com/questions/48502/how-can-i-permanently-add-my-ssh-private-key-to-keychain-so-it-is-automatically)
- [Storing the same SSH key on multiple Yubikeys?](https://www.reddit.com/r/yubikey/comments/qt9hye/storing_the_same_ssh_key_on_multiple_yubikeys/)
- [Store SSH keys in the Secure Enclave](https://github.com/maxgoedjen/secretive)