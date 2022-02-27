# gcloud

**Google Cloud SDK** are tools and libraries for interacting with Google Cloud products and services. 
Examples include: “gcloud”, “gsutil”, and “bq” among others.

## Install

Install Google cloud SDK using your favourite method, e.g. `Brew` or download `macOS 64-bit(arm64, Apple M1 silicon)` directly from [google](https://cloud.google.com/sdk/docs/install)

```shell
brew cask install google-cloud-sdk
# Note: if you see failures (e.g., 503) during the google-cloud-sdk installation, you may need to set your python proxy and re-run the command. e.g.,
# export HTTP_PROXY="http://user:password@hostname:port"
# export HTTPS_PROXY="http://user:password@hostname:port"
```

Log in to Google Cloud and select your project, region, etc.

```shell
gcloud init # --console-only if in a remote shell
```

### Usage

gcloud has an interactive shell if you wish to use it:

```shell
gcloud components install beta
gcloud beta interactive

# Testing The CLI Setup
gcloud auth login
gcloud auth list


# List the sdk configuration
gcloud config list
gcloud info

# hook it up to GCR so you can push containers:
gcloud auth configure-docker
```

 