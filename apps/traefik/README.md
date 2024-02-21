# Docker Compose Kafka Lab with Traefik

This doc outlines how to run `backend services` needed to develop following solutions, locally on your laptop with `docker-compose`:

1. Implement `Change Data Capture (CDC)` solution to send **Postgres Database** changes to Kafka or [Redpanda](https://redpanda.com/) using [Debezium](https://debezium.io/)
2. **Streaming ETL**: To `filter`, `transform` and `route` messages from **Producer** topic to **Consumer** topic using [KSQLDB](https://ksqldb.io/) as processing engine and [Redpanda](https://redpanda.com/) as message broker.
3. **Streaming Analytics**: Implement [Real-Time Materialized Views](https://www.confluent.io/blog/how-real-time-materialized-views-work-with-ksqldb/) using **ksqlDB**
4. Explore new _Hybrid Messaging + Database_ products like [Proton](https://docs.timeplus.com/proton-architecture) and [Materialize](https://materialize.com/product/)

## Local Environment Setup

### First Time Setup

1. Unpack `localhost.direct.zip`.

   > HINT: password: `localhost`

   ```shell
   unzip -P localhost apps/traefik/certs/localhost.direct.zip -d apps/traefik/certs/
   ```

2. Install **Redpanda** CLI to interact with kafka clusters

   Follow instructions at: [rpk cli](https://redpanda.com/blog/homebrew)

### Start

```shell
docker compose up

# to pass environment variables into compose.yml
#docker compose --env-file .env --env-file .secrets up ksqldb

# then connect with ksql
ksql -u admin -p admin https://ksqldb.localhost.direct

# to ssh to container for troubleshooting
docker compose exec ksqldb sh

# verify compose file
docker compose ps
docker compose config
```

### Stop

> Make sure you stop all services after your work, otherwise you will get `port-in-use` error when you try to start `docker-compose` in other repos.

```shell
docker compose down
# if you want to shutdown all services and remove volumes, run:
docker compose down -v
```

### Web Access

After app process are UP and healthy (verify with `docker compose ps`), You can open each web UI:

```shell
open https://traefik.localhost.direct/dashboard/#/
open https://console.localhost.direct/
open https://connect.localhost.direct/
open https://ksqldb.localhost.direct/info
```

## References
