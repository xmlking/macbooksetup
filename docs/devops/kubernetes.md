# Kubernetes Cheat Sheet

To read more on kubectl, check out the [Kubectl Cheat Sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/).

## Usage

### kubectx + kubens

**kubectx** is a tool to switch between contexts (clusters) on kubectl faster.<br/>
**kubens** is a tool to switch between Kubernetes namespaces (and configure them for kubectl) easily.

```shell
# switch to another cluster that's in kubeconfig
kubectx rancher-desktop

# switch back to previous cluster
kubectx -

# change the active namespace on kubectl
kubens kube-system

# go back to the previous namespace
kubens -
```

### k9s

Kubernetes CLI To Manage Your Clusters In Style!

```shell
k9s
```

### Kubectl commands
>
> commonly used Kubectl commands

> you can pratice kubectl commands at [katacoda](https://www.katacoda.com/courses/kubernetes/playground) playground

```
kubectl version
kubectl cluster-info
kubectl get storageclass
kubectl get nodes
kubectl get ep kube-dns --namespace=kube-system
kubectl get persistentvolume
kubectl get  PersistentVolumeClaim --namespace default
kubectl get pods --namespace kube-system
kubectl get ep
kubectl get sa
kubectl get serviceaccount
kubectl get clusterroles
kubectl get roles
kubectl get ClusterRoleBinding
# Show Merged kubeconfig settings.
kubectl config view
kubectl config get-contexts
# Display the current-context
kubectl config current-context           
kubectl config use-context docker-desktop
kubectl port-forward service/ok 8080:8080 8081:80 -n the-project
# Delete evicted pods
kubectl get po --all-namespaces | awk '{if ($4 ~ /Evicted/) system ("kubectl -n " $1 " delete pods " $2)}'
```

### Namespaces and Context

> Execute the kubectl Command for Creating Namespaces

```shell
# Namespace for Developers
kubectl create -f namespace-dev.json
# Namespace for Testers
kubectl create -f namespace-qa.json
# Namespace for Production
kubectl create -f namespace-prod.json
```

> Assign a Context to Each Namespace

```
# Assign dev context to development namespace
kubectl config set-context dev --namespace=dev --cluster=minikube --user=minikube
# Assign qa context to QA namespace
kubectl config set-context qa --namespace=qa --cluster=minikube --user=minikube
# Assign prod context to production namespace
kubectl config set-context prod --namespace=prod --cluster=minikube --user=minikube
```

> Switch to the Appropriate Context

```
# List contexts
kubectl config get-contexts
# Switch to Dev context
kubectl config use-context dev
# Switch to QA context
kubectl config use-context qa
# Switch to Prod context
kubectl config use-context prod

kubectl config current-context
```

> see cluster-info

```shell
kubectl cluster-info
```

> nested kubectl commands

```shell
kubectl -n istio-system port-forward $(kubectl -n istio-system get pod -l app=servicegraph -o jsonpath='{.items[0].metadata.name}') 8082:8088
```

> kubectl proxy creates proxy server between your machine and Kubernetes API server.
By default it is only accessible locally (from the machine that started it).

```
kubectl proxy --port=8080
curl http://localhost:8080/api/
curl http://localhost:8080/api/v1/namespaces/default/pods
```

### Accessing logs

```shell
# get all the logs for a given pod:
kubectl logs my-pod-name
# keep monitoring the logs
kubectl -f logs my-pod-name
# Or if you have multiple containers in the same pod, you can do:
kubectl -f logs my-pod-name internal-container-name
# This allows users to view the diff between a locally declared object configuration and the current state of a live object.
kubectl alpha diff -f mything.yml
```

### Execute commands in running Pods

```shell
kubectl exec -it my-pod-name -- /bin/sh
```

### CI/CD
>
> Redeploy newly build image to existing k8s deployment

```
BUILD_NUMBER = 1.5.0-SNAPSHOT // GIT_SHORT_SHA
kubectl diff -f sample-app-deployment.yaml
kubectl -n=staging set image -f sample-app-deployment.yaml sample-app=xmlking/ngxapp:$BUILD_NUMBER
```

### Rolling back deployments
>
> Once you run `kubectl apply -f manifest.yml`

```shell
# To get all the deploys of a deployment, you can do:
kubectl rollout history deployment/DEPLOYMENT-NAME
# Once you know which deploy you’d like to roll back to, you can run the following command (given you’d like to roll back to the 100th deploy):
kubectl rollout undo deployment/DEPLOYMENT_NAME --to-revision=100
# If you’d like to roll back the last deploy, you can simply do:
kubectl rollout undo deployment/DEPLOYMENT_NAME
```

### Tips and Tricks

```shell
# Show resource utilization per node:
kubectl top node
# Show resource utilization per pod:
kubectl top pod
# if you want to have a terminal show the output of these commands every 2 seconds without having to run the command over and over you can use the watch command such as
watch kubectl top node
# --v=8 for debuging 
kubectl get po --v=8
```

#### troubleshoot headless services

```shell
k get ep
# ssh to one of the container and run dns check:
host <httpd-discovery>
```

#### Alias

```shell
alias k="kubectl"
alias watch="watch "
alias kg="kubectl get"
alias kgdep="kubectl get deployment"
alias ksys="kubectl --namespace=kube-system"
alias kd="kubectl describe"
alias bb="kubectl run busybox --image=busybox:1.30.1 --rm -it --restart=Never --command --"
```

> you can use `busybox` for debuging inside cluster

```shell
bb nslookup demo
bb wget -qO- http://demo:8888
bb sh
```

> after SSH to a container, you can use this command to check connectivity to external host

```shell
 # install netcat only if missing
apt update && apt -y install netcat
# example connectivity tests
nc -vz host.docker.internal 80
nc -zv some_egress_hostname 1433
```

#### Container Security
>
> for better security add following securityContext settings to manifest

```yaml
securityContext:
  # Blocking Root Containers
  runAsNonRoot: true
  # Setting a Read-Only Filesystem
  readOnlyRootFilesystem: true
  # Disabling Privilege Escalation
  allowPrivilegeEscalation: false
  # For maximum security, you should drop all capabilities, and only add specific capabilities if they’re needed:
    capabilities:
      drop: ["all"]
      add: ["NET_BIND_SERVICE"]
```

#### Debug k8s

For many steps here you will want to see what a `Pod` running in the k8s cluster sees. The simplest way to do this is to run an interactive busybox `Pod`:

```shell
kubectl run -it --rm --restart=Never busybox --image=busybox sh
```

#### Debugging with an ephemeral debug container

Ephemeral containers are useful for interactive troubleshooting when `kubectl exec` is insufficient because a container has crashed or a container image doesn't include debugging utilities, such as with `distroless` images.

This allows a user to inspect a running pod without restarting it and without having to enter the container itself to, for example, check the filesystem, execute additional debugging utilities, or initial network requests from the pod network namespace. Part of the motivation for this enhancement is to also eliminate most uses of SSH for node debugging and maintenance

```shell
# First, create a pod for the example: 
kubectl run ephemeral-demo --image=k8s.gcr.io/pause:3.1 --restart=Never
# add a debugging container 
kubectl alpha debug -it ephemeral-demo --image=busybox --target=ephemeral-demo
```

#### Generateing k8s YAML from local files using `--dry-run`

```shell
# generate a kubernetes tls secret from files
kubectl create secret tls keycloak-secrets-tls \
--key key.pem --cert cert.pem \
-o yaml --dry-run=client > keycloak-secrets-tls.yml
```

verify

```shell
# verify by getting from k8
kubectl get secret keycloak-secrets-tls-o jsonpath="{.data.tls.crt}" | base64 --decode
# verify from file 
yq '.data."tls.crt"' keycloak-secrets-tls.yml | base64 --decode
```

#### Ghostty tips
>
> in Ghostty

1. split screen horizontally
2. go to the bottom screen and split it vertically

I was using top screen for the work with yaml files and kubectl.

Left bottom screen was running:

  watch kubectl get pods

Right bottom screen was running:

  watch "kubectl get events --sort-by='{.lastTimestamp}' | tail -6"

With such setup it was easy to observe in real time how my pods are being created.
