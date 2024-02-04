# mkcert

[mkcert](https://github.com/FiloSottile/mkcert) is a simple tool for making locally-trusted development certificates. It requires no configuration.

> ** Alternative Method(Recommended)**: Use [localhost.direct](https://get.localhost.direct/) and certs provided at this site instead of **mkcert**
> This approach even works, when you don't have *admin* access to company issued *MacBook*.

## Install

```shell
brew install mkcert
```

## Setup

```shell
# NOTE: sudo is needed
mkcert -install
# this will create root CA cert into: `mkcert -CAROOT` output
mkcert -CAROOT
ls -1 ~/Library/Application\ Support/mkcert 
```

### Create Certs

for example if you want to create certs for `traefik`:
> Decide on your URL scheme like `*.nip.io`, `localhost.direct`, `*.localhost`, `*.vcap.me`, or even `*.bret.lol`

```shell
cd  infra/traefik
mkdir certs && cd certs 

mkcert -cert-file localhost.direct-cert.pem -key-file localhost.direct-key.pem \
"*.localhost.direct" localhost 127.0.0.1 ::1
```

> Reminder: X.509 wildcards only go one level deep, so this won't match `a.b.localhost.direct`


## Usage

Used to setup https on `localhost` for [Vite](https://github.com/liuweiGL/vite-plugin-mkcert), SvelteKit project 


## Reference 
- [Available Public Wildcard DNS Domains pointing to localhost (127.0.0.1)](https://gist.github.com/tinogomes/c425aa2a56d289f16a1f4fcb8a65ea65)
- [localhost.direct](https://github.com/Upinel/localhost.direct)