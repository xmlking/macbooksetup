# Helm

## Install

```shell
brew install helm
```

## Using
```shell
# update charts repo
helm repo update

# install postgre chart
# helm install --name nginx stable/nginx-ingress
helm install --name pg --namespace default --set postgresPassword=postgres,persistence.size=1Gi stable/postgresql
kubectl get pods -n default

# list installed charts
helm ls

# delete postgre
$ helm delete my-postgre

# delete postgre and purge
$ helm delete --purge my-postgre
```

### You can also create your own Chart by using the scaffolding command
```bash
helm create mychart
```
This will create a folder which includes all the files necessary to create your own package :
```
├── Chart.yaml
├── templates
│   ├── NOTES.txt
│   ├── _helpers.tpl
│   ├── deployment.yaml
│   ├── ingress.yaml
│   └── service.yaml
└── values.yaml
```

### optionally add `helm-secrets` [plugin](https://developer.epages.com/blog/tech-stories/kubernetes-deployments-with-helm-secrets/)

```bash
helm plugin install https://github.com/futuresimple/helm-secrets 
```
