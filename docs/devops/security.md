# Security 

This document outlines an overview of security considerations for `micro-apps` services, components, artifacts, as well as configuration options for Kubernetes cluster.

Safeguarding artifact integrity across any software supply chain.


## Supply Chain Security

### Goals

1. Adopt [SLSA](http://slsa.dev/) Framework _Level 4_ guideline for **DevSecOps**
2. Signed container images with [Sigstore](https://www.sigstore.dev/) **Cosign**
3. Software Bill of Materials (SBOM) with [Anchore](https://anchore.com/sbom) **Syft**
4. Static Code Analysis with [CodeQL](https://colinsalmcorner.com/custom-codeql/)
5. Vulnerabilities scanning with [Snyk](https://snyk.io/product/open-source-security-management/)
6. Software Composition Analysis (SCA) with [OWASP Dependency-Check](https://jeremylong.github.io/DependencyCheck/) and [Dependabot](https://github.com/features/security)
7. Risk and compliance as code ([RCaC](https://cloud.google.com/solutions/risk-and-compliance-as-code)) via [Open Policy Agent](https://www.openpolicyagent.org/) with [Gatekeeper](https://open-policy-agent.github.io/gatekeeper/website/docs/) Or [Kyverno](https://kyverno.io/)

### Binary Authorization

Binary Authorization is a deploy-time security control that ensures only trusted container images are deployed on Google Kubernetes Engine (GKE). 
With Binary Authorization, you can require images to be signed by trusted authorities during the development process and then enforce signature validation when deploying. 
By enforcing validation, you can gain tighter control over your container environment by ensuring only verified images are integrated into the build-and-release process.

### Cosign
All container images are signed using [Sigstore](https://www.sigstore.dev/) **Cosign** and _GitHub OIDC_

To verify the authenticity of container images, install cosign and run:

```bash
$ COSIGN_EXPERIMENTAL=1 cosign verify ghcr.io/xmlking/micro-apps/account-service:v0.3.1

Verification for ghcr.io/xmlking/micro-apps/account-service:v0.3.1 --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
```

### Gitsign
[Gitsign](https://github.com/sigstore/gitsign) enable Keyless Git/commits signing with your own GitHub / OIDC identity.

#### Install
```shell
go install github.com/sigstore/gitsign@latest
```
#### Configuration
Single Repository:
```shell
cd /path/to/my/repository
git config --local commit.gpgsign true  # Sign all commits
git config --local gpg.x509.program gitsign  # Use gitsign for signing
git config --local gpg.format x509  # gitsign expects x509 args
```
All respositories:
```shell
git config --global commit.gpgsign true  # Sign all commits
git config --global gpg.x509.program gitsign  # Use gitsign for signing
git config --global gpg.format x509  # gitsign expects x509 args
```
#### Usage
```shell
$ git commit --allow-empty --message="Signed commit"
[main cb6eee1] Signed commit
$ git --no-pager log --show-signature -1
```

### Software Bill of Materials 

For the _micro-apps_ project we publish a _Software Bill of Materials (SBOM)_ with each release. The SBOM is generated with [Syft](https://github.com/anchore/syft) in the [SPDX](https://spdx.dev/) format.

The `spdx.json` file is available for download on the GitHub release page e.g.:

```bash
curl -sL https://github.com/xmlking/micro-apps/releases/download/v0.3.1/micro_0.3.1_sbom.spdx.json | jq
```

### Pod security standard 

The  deployments are configured in conformance with the Kubernetes [restricted pod security standard](https://kubernetes.io/docs/concepts/security/pod-security-standards/#restricted):

- all Linux capabilities are dropped
- the root filesystem is set to read-only 
- the seccomp profile is set to the runtime default 
- run as non-root is enabled 
- the filesystem group is set to 1337 
- the user and group ID is set to 65534

### Kubernetes' security standard

- properly adheres to Kubernetes security model including RBAC
- implement policy-as-code via **OPA, Kyverno** admission controllers
