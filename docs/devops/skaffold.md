# Skaffold


## Install

```bash
brew install skaffold
```

## Setup

```bash
skaffold init --XXenableBuildpacksInit
# or 
skaffold init \
  -a '{"builder":"buildpacks","payload":{"path":"leeroy-app/Dockerfile"},"image":"gcr.io/k8s-skaffold/leeroy-app"}' \
  -a '{"builder":"buildpacks","payload":{"path":"leeroy-web/Dockerfile"},"image":"gcr.io/k8s-skaffold/leeroy-web","context":"path/to/context"}'
```

## Use

```bash
skaffold dev --port-forward
```

## Reference

- [Spring Boot on Kubernetes with Buildpacks and Skaffold](https://piotrminkowski.com/2020/12/18/spring-boot-on-kubernetes-with-buildpacks-and-skaffold/)
