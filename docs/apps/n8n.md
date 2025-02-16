# n8n

Running **n8n** workflow automation tool in `docker-compose` with [OrbStack](https://docs.orbstack.dev/docker/domains)

Refer [agentic github repo](https://github.com/xmlking/agentic.git) for full setup instructions and `compose.yml` file

## Install

*Optically* install n8n cli

```shell
# install CLI (one-time)
pnpm add -g n8n@next
# to update to latest version
pnpm update -g n8n@next  
```

## Start

To start **n8n** with **PostgreSQL** simply start `docker-compose` by executing the following
command in the current folder.

> [!IMPORTANT]  
> But before you do, copy [`.env.example`](.env.example) as `.env` in the project root directory,
> then change the default postgres `username` and `password` in the [`.env`](.env) file, if you prefer.

```shell
# for first time
docker compose --profile first-time-only up
# for next time
docker compose up
# if you want to ssh to n8n container 
docker compose exec -it n8n sh
```

Access n8n dashboard at:

```shell
open https://n8n.agentic.orb.local
```

Access qdrant dashboard at:

```shell
open https://qdrant.agentic.orb.local/dashboard#/welcome
```

> [!NOTE]  
> First time when you access, you will see: `Set up owner account` page.
> Enter some fake data, then you will be redirected to Dashboard

### To Stop

```shell
docker compose down
# DANGER: if you want stop and also want to remove all data, to reset database:
docker compose down -v
```

## Configuration

The default name of the database, user and password for PostgreSQL can be changed in the [`.env`](.env) file in the current directory.

### For Mac users running OLLAMA locally

If you're running [Ollama locally](./ollama.md) on your Mac (not in Docker), make sure `OLLAMA_HOST` environment variable set to `host.docker.internal:11434` in the n8n service configuration in [compose.yaml](../compose.yml) .

Additionally, verify ollama base URL is set to <http://host.docker.internal:11434> :

Head to <https://n8n.agentic.orb.local/home/credentials>  
Click on "Local Ollama service"  
Change the base URL to <http://host.docker.internal:11434>

> [!NOTE]  
> If you are using [LM Studio](./lm-studio.md), use [OpenAI Model integration](https://n8n.io/integrations/?q=openai) and use lms url: <http://host.docker.internal:1234/v1> URL instead of ollama url: <http://host.docker.internal:11434>

> [!IMPORTANT]  
> If you are using  **OpenAi** models, also verify `OpenAi account`  credentials are set properly.

## Usage

Quick start and usage

- Open <http://n8n.agentic.orb.local> in your browser to set up n8n. You’ll only have to do this once.
- Open the included workflow: <http://n8n.agentic.orb.loca/workflow/srOnR8PAY3u4RSwb>
- Select **Test workflow** to start running the workflow.
- If this is the first time you’re running the workflow, you may need to wait until `Ollama` finishes downloading `Llama3.2`.

## n8n cli

use [n8n-cli](https://docs.n8n.io/hosting/cli-commands/) to manage n8n server metadata

default location of n8n CLI config file: `~/.n8n/config`

```shell
# First export env. NOTE: adjust db username/password as needed 
export DB_TYPE=postgresdb DB_POSTGRESDB_HOST=localhost DB_POSTGRESDB_PORT=5432 DB_POSTGRESDB_DATABASE=n8n DB_POSTGRESDB_USER=user_postgres DB_POSTGRESDB_PASSWORD=user_password
```

### credentials

```shell
# Export all the credentials to a specific directory using the --backup flag (details above):
n8n export:credentials --backup --output=config/n8n/credentials/
# Export all the credentials in plain text format.
n8n export:credentials --backup --decrypted --output=config/n8n/credentials/
# Import all the credentials files as JSON from the specified directory:
n8n import:credentials --separate --input=config/n8n/credentials/
```

### workflow

```shell
# Export all your workflows to the standard output (terminal):
n8n export:workflow --all
# Export all the workflows to a specific directory using the --backup flag (details above):
n8n export:workflow --backup --output=config/n8n/workflows/
# Import all the workflow files as JSON from the specified directory:
n8n import:workflow --separate --input=config/n8n/workflows/
```

### security audit

```shell
n8n audit
```

## Reference

- [Self-hosted AI starter kit](https://github.com/coleam00/ai-agents-masterclass/tree/main/local-ai-packaged), [video](https://www.youtube.com/watch?v=V_0dNE-H2gw)
- [Deploy n8n with Docker Compose for Automating AI Workflows](https://autoize.com/deploy-n8n-with-docker-compose-for-automating-ai-workflows/)
- [Install n8n The Right Way for You](https://www.youtube.com/watch?v=OWa9Qse3ow0)
- Local AI with Docker, n8n, Qdrant, and Ollama - [Video](https://www.datacamp.com/tutorial/local-ai)
- [Extract personal data with self-hosted LLM Mistral NeMo](https://n8n.io/workflows/2766-extract-personal-data-with-self-hosted-llm-mistral-nemo/)
- [Building RAG Chatbot for Movie Recommendations with Qdrant and Open AI](https://n8n.io/workflows/2440-building-rag-chatbot-for-movie-recommendations-with-qdrant-and-open-ai/)
- [Build a custom knowledge RAG chatbot using n8n](https://blog.n8n.io/rag-chatbot/)
- [Scaling n8n](https://docs.n8n.io/hosting/scaling/overview/), [video](https://www.youtube.com/watch?v=PnoE0xV8BX8)
- [Auth with n8n webhooks](https://please-open.it/blog/n8n-openid-client/)
