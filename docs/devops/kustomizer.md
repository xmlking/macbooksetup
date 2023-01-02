# kustomizer

**[Kustomizer](https://kustomizer.dev)** is a `package manager` for distributing Kubernetes configuration as **OCI** artifacts.

## Install

```shell
brew install stefanprodan/tap/kustomizer
```

## Usage

```shell
# Login to GitHub Container Registry
export GITHUB_USER="YOUR-GITHUB-USERNAME"
echo <PAT> | docker login ghcr.io -u ${GITHUB_USER} --password-stdin

# Push image along with final Kubernetes artifacts to GHCR
export DOCKER_IMAGE="ghcr.io/${GITHUB_USER}/demo-app"
export DOCKER_VERSION="1.0.0"
kustomizer push artifact oci://${DOCKER_IMAGE}:${DOCKER_VERSION} \
    -k ./infra/deploy/
```