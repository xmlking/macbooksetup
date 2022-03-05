# dnsmasq

## Install

```bash
brew install dnsmasq

# edit and add `address=/test/127.0.0.1`
subl /usr/local/etc/dnsmasq.conf
```

```bash
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
```bash
dig testing.testing.one.two.three.test @127.0.0.1
```

### Configuring OS X

```bash
sudo mkdir -p /etc/resolver
sudo tee /etc/resolver/test >/dev/null <<EOF
nameserver 127.0.0.1
EOF
```


## Reference
- https://passingcuriosity.com/2013/dnsmasq-dev-osx/

