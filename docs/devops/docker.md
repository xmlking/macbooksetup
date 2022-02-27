# Docker

## Sign

### Generating Keys

```bash
# Generating Keys
docker trust key generate my-key
```

### Signing 

Sign and push 

```bash
export DOCKER_CONTENT_TRUST=1
docker push registry.example.com/my-image:latest
```

### Verifying

Verifying Trusted Images

```bash
export DOCKER_CONTENT_TRUST=1
docker pull registry.example.com/my-image:latest
```

## Scan

Vulnerability scanning for Docker local images

```bash
docker scan --dependency-tree debian:buster
# Excluding the base image
docker scan --file Dockerfile --exclude-base docker-scan:e2e
# Checking the dependency tree
docker scan --dependency-tree debian:buster
# Provider authentication
docker scan --login --token SNYK_AUTH_TOKEN
```


## Ref

- [How to Sign Your Docker Images to Increase Trust ](https://www.cloudsavvyit.com/12388/how-to-sign-your-docker-images-to-increase-trust/)
- [How to Secure Containers with Cosign and Distroless Images](https://www.infracloud.io/blogs/secure-containers-cosign-distroless-images/)
- [Docker Content Trust Gets Hardware Signing](https://www.docker.com/blog/docker-content-trust-yubikey/)
