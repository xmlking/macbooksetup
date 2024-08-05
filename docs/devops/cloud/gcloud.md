# gcloud

**Google Cloud SDK** are tools and libraries for interacting with Google Cloud products and services. 
Examples include: “gcloud”, “gsutil”, and “bq” among others.

## Install

Install Google cloud SDK using your favourite method, e.g. `Brew` or download `macOS 64-bit(arm64, Apple M1 silicon)` directly from [google](https://cloud.google.com/sdk/docs/install)

```shell
brew install --cask google-cloud-sdk
# Note: if you see failures (e.g., 503) during the google-cloud-sdk installation, you may need to set your python proxy and re-run the command. e.g.,
# export HTTP_PROXY="http://user:password@hostname:port"
# export HTTPS_PROXY="http://user:password@hostname:port"
```

## Configuration 

Log in to Google Cloud and select your project, region, etc.

```shell
# initialize the SDK
gcloud init # --console-only if in a remote shell
```

Link _gcloud CLI_ with your **GCP Project**

```shell
# list configurations 
gcloud config configurations list
gcloud info
# create new configurations
gcloud config configurations create env-sumo
# switch configurations
gcloud config configurations activate env-sumo

# set auth for your `env-sumo` 
gcloud auth login
gcloud auth list

# select your project_id from `gcloud projects list`
export PROJECT_ID=ngx-starter-kit
# set default account 
export ACCOUNT=<my_gcp_email@gmail.com>
# Set default region from `gcloud compute regions list`
export COMPUTE_REGION=us-west1
# select default zone from `gcloud compute zones list --filter=region:us-west1`
export COMPUTE_ZONE=us-west1-a

gcloud config set project $PROJECT_ID
gcloud config set account $ACCOUNT
gcloud config set compute/region $COMPUTE_REGION
gcloud config set compute/zone $COMPUTE_ZONE
```

## Usage

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

# To install or remove components at your current SDK, run:
gcloud components install COMPONENT_ID
gcloud components remove COMPONENT_ID
```

### Network

(Optional) VPC network
```shell
gcloud compute networks create ${NETWORK_NAME} \
  --project ${PROJECT_ID} \
  --subnet-mode custom
```


### Docker Artifact Registry

Create GCP Docker Artifact Registry
```shell
gcloud artifacts repositories create docker --repository-format=docker \
--location=us-west1 --description="Docker repository"
gcloud artifacts repositories list
# hook it up to GCP `Artifact Registry` so you can push containers:
gcloud auth configure-docker us-west1-docker.pkg.dev
# after you publish a docker image, check with:
gcloud artifacts docker images list us-west1-docker.pkg.dev/ngx-starter-kit/docker
```

## Cloud Run

Deploy on Cloud Run
```shell
gcloud run deploy grpc-starter-kit \
   --image us-west1-docker.pkg.dev/onyx-course-330904/docker/xmlking/grpc-starter-kit:v0.6.1 \
   --port=8080 --use-http2 --region us-west1 \
   --update-env-vars CONFY_LOG_LEVEL=debug,CONFY_LOG_FORMAT=gcp,CONFY_FEATURES_SERVER_TLS_ENABLED=false,CONFY_FEATURES_CLIENT_TLS_ENABLED=false \
   --allow-unauthenticated
```

 