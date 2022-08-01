# dnsmasq
**dnsmasq** is a _lightweight_, easy to configure _DNS forwarder_, designed to provide DNS.<br/> 
It can serve the names of _local machines_ which are not in the **global DNS**.

This setup is **Optional**.<br/>
According to [RFC 2606 (1999)](https://www.rfc-editor.org/rfc/rfc2606) the TLD `.localhost` is reserved for use for testing locally.
**MacOS** by default support `.localhost` domain name i.e.,  `http://traefik.localhost` 
If you want to use any other custom TLD, follow next steps.

## Install

For this guide, we will be using `.test` as the TLD. Let’s start by installing it:

```shell
brew install dnsmasq
```

We edit the configuration file with:
```shell
# edit and add `address=/test/127.0.0.1`
subl /usr/local/etc/dnsmasq.conf
$ Or
echo 'address=/.test/127.0.0.1' > /opt/homebrew/etc/dnsmasq.conf
```


Now we only have to start it and add it to the resolvers:

```shell
sudo brew services start dnsmasq
```

> output

```
==> Tapping homebrew/services
Cloning into '/usr/local/Homebrew/Library/Taps/homebrew/homebrew-services'...
remote: Enumerating objects: 14, done.
remote: Counting objects: 100% (14/14), done.
remote: Compressing objects: 100% (9/9), done.
remote: Total 14 (delta 0), reused 7 (delta 0), pack-reused 0
Unpacking objects: 100% (14/14), done.
Tapped 1 command (44 files, 59.7KB).
Warning: Taking root:admin ownership of some dnsmasq paths:
  /usr/local/Cellar/dnsmasq/2.80/sbin
  /usr/local/Cellar/dnsmasq/2.80/sbin/dnsmasq
  /usr/local/opt/dnsmasq
  /usr/local/opt/dnsmasq/sbin
  /usr/local/var/homebrew/linked/dnsmasq
This will require manual removal of these paths using `sudo rm` on
brew upgrade/reinstall/uninstall.
==> Successfully started `dnsmasq` (label: homebrew.mxcl.dnsmasq)
```

## Test

You can try if it is correctly setup by pinging any **.test** domain like `test.test`

```shell
ping test.test
```

```bash
dig testing.testing.one.two.three.test @127.0.0.1
```

If the ping works congrats, you have finished configuring your environment!

### Configuring MacOS

```bash
sudo mkdir -p /etc/resolver
sudo tee /etc/resolver/test >/dev/null <<EOF
nameserver 127.0.0.1
EOF
```

## Reference
- https://passingcuriosity.com/2013/dnsmasq-dev-osx/

