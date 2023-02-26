# GitOps

CI/CD workflow and tech stack.

![Gitflow](../../images/dev-sec-ops.drawio.svg)

## Development 

Main concepts of **Gitflow**:
- **main** branch will represent the currently developed release
- **main** branches will record the history of the project
- **feature** branch will contain the feature-developed changes. each feature will usually have a feature branch.
- **release** branch will represent the next phase of developed release before it is completed and merged to _master/main_ branch


## Deployment

### Develop flow

> Microservices monorepo — automatically build and deploy latest changes to dev environment.

Every change that will be pushed to develop branch on the microservices repositories will be seen automatically deployed to the **dev environment**.

CI-CD based on dockers implementation description:

1. **build** (automatic) — Any commit to **develop/main/master branch** will trigger a **docker image build** that will be pushed to a docker container registry. 
   If the change will be pushed to develop branch the docker image will be tagged with a tag **:latest**, otherwise, it will be tagged with the **:commit-id**
2. **deploy** (automatic)— The image tagged with **:latest** will be pulled automatically to the **dev environment.**

### Release flow

> Integration — deploy a release version to higher environments.

Every git tag that will be pushed to the **master/main branch** on the repository will be available to be deployed to the remote environments such as **stage** and **prod** by the following

CI-CD based on dockers implementation description:

1. **build** (automatic) — A **git tag** on the repository will represent all µService lib modules version together. 
   _Images for these commit ids are already made and wait to be deployed on the container registry since their development passed on develop flow._ 
   In kubernetes we use kustomize/helm representing these images with these commit-ids that will be built and pushed with the git tag to a remote **deploy registry.**
2. **deploy** (manual)— Images with the relevant commit ids will be pulled to the remote environment. In kubernetes we deploy by the kustomize/helm from the **deploy registry** to a remote environment.
