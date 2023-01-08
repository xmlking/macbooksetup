# Kustomize

**[Kustomize](https://kustomize.io)** is a Kubernetes native configuration management tool.

[Why Kustomize?](https://whyk8s.substack.com/p/why-kustomize)

## Help vs. Kustomize

Helm templates consist of:

- Templated YAML files (the template)
- A values file (template variables)

Kustomized files consist of:

- Base YAML files (the base)
- A modifications file (the overlay)

On the surface, these two approaches seem similar. However, they’re fundamentally different.


![helm-kustomize](../images/helm-kustomize.png)

## Style Guide

### Project Layout
![Kustomize-code-structure](../images/Kustomize-code-structure.png)

## Reference 
- [Applied GitOps with Kustomize](https://codefresh.io/about-gitops/applied-gitops-with-kustomize/)