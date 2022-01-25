# Rancher Desktop

**Rancher Desktop** is a replacement for **Docker for Mac**

It installs:
1. [k3s](https://k3s.io/)
2. [traefik](https://traefik.io/)
3. [lima](https://github.com/lima-vm/lima)
4. Kubernetes Image Manager (kim)
5. kubectl
6. nerdctl

## Prerequisites 

You **don't** need `Docker for Mac` installed as prerequisite

## Install

Download and install the latest binary for your OS from [here](https://github.com/rancher-sandbox/rancher-desktop/releases)

## Usage

```bash
nerdctl info 
nerdctl version
nerdctl stats
nerdctl top CONTAINER
nerdctl volume ls
nerdctl network ls
```

### Namespace management

```bash
nerdctl namespace ls
```

### Images

```bash
nerdctl build .
nerdctl tag
nerdctl tag SOURCE_IMAGE[:TAG] TARGET_IMAGE[:TAG]

nerdctl images
nerdctl -n k8s.io images

nerdctl login -u aaaa -p bbb

# inspect image 
nerdctl image inspect redislabs/redismod:edge

# Remove one or more images
nerdctl -n k8s.io rmi docker.vectorized.io/vectorized/redpanda:v21.11.2

# default from docker.io
nerdctl -n k8s.io pull jwsy/jade-shooter:v1.1

nerdctl -n k8s.io images | grep jwsy
nerdctl -n k8s.io run -d -p 8080:80 jwsy/jade-shooter:v1.1
nerdctl -n k8s.io run -d -p 80:80 --name=nginx --restart=always nginx

# `e2a5` is output from above command
nerdctl -n k8s.io exec -it e2a5 sh
nerdctl -n k8s.io images
# save load  
nerdctl -n k8s.io save -o local_jwsy_jade-shooter_v1.2.tar
nerdctl -n k8s.io load -i local_jwsy_jade-shooter_v1.2.tar
```

Encrypt image layers with [ocicrypt](https://github.com/containerd/nerdctl/blob/master/docs/ocicrypt.md).

```bash
openssl genrsa -out mykey.pem
openssl rsa -in mykey.pem -pubout -out mypubkey.pem
nerdctl image encrypt --recipient=jwe:mypubkey.pem --platform=linux/amd64,linux/arm64 foo example.com/foo:encrypted
nerdctl push example.com/foo:encrypted
```

### Compose

```bash
nerdctl compose -f infra/redis.yml up redis
nerdctl compose -f infra/redpanda.yml up redpanda
nerdctl compose -f infra/redpanda.yml logs
nerdctl compose -f infra/redis.yml down
nerdctl compose -f infra/redpanda.yml down
# this will stop redpanda and remove all volumes
nerdctl compose -f infra/redpanda.yml down -v 

nerdctl compose -f infra/redpanda.yml ps
# name of the container can be found from output of above command 
nerdctl exec -it infra_redpanda_1 /bin/bash
nerdctl exec -it infra_redpanda_1 rpk version
nerdctl exec -it infra_redpanda_1 rpk topic list
nerdctl exec -it infra_redpanda_1 rpk cluster info


nerdctl exec -it redpanda-1 \
rpk topic produce twitch_chat --brokers=localhost:9092
nerdctl exec -it redpanda-1 \
rpk topic consume twitch_chat --brokers=localhost:9092
```

### Kubernetes

```bash
kubectl apply -f jade-shooter
```

How to expose traefik v2 dashboard?

https://github.com/rancher-sandbox/rancher-desktop/issues/896

create `dashboard.yaml` route

```yaml
apiVersion: traefik.containo.us/v1alpha1
kind: IngressRoute
metadata:
  name: dashboard
spec:
  entryPoints:
    - web
  routes:
    - match: Host(`traefik.localhost`) && (PathPrefix(`/dashboard`) || PathPrefix(`/api`))
      kind: Rule
      services:
        - name: api@internal
          kind: TraefikService
```


```bash
kubectl -n kube-system apply -f dashboard.yaml
```

open dashboard in your favorite browser and **don't forget the second slash**

```bash
open http://traefik.localhost/dashboard/#/
```
