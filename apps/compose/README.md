# Docker Compose Lab

This doc outlines how to run `backend services` needed to develop following solutions, locally on your laptop with `docker-compose`:

1. Implement `Change Data Capture (CDC)` solution to send **Postgres Database** changes to Kafka or [Redpanda](https://redpanda.com/) using [Debezium](https://debezium.io/)
2. **Streaming ETL**: To `filter`, `transform` and `route` messages from **Producer** topic to **Consumer** topic using [KSQLDB](https://ksqldb.io/) as processing engine and [Redpanda](https://redpanda.com/) as message broker.
3. **Streaming Analytics**: Implement [Real-Time Materialized Views](https://www.confluent.io/blog/how-real-time-materialized-views-work-with-ksqldb/) using **ksqlDB**
4. Explore new _Hybrid Messaging + Database_ products like [Proton](https://docs.timeplus.com/proton-architecture) and [Materialize](https://materialize.com/product/)

## Prerequisites

- [rpk cli](https://docs.redpanda.com/current/get-started/rpk/)
- [ksql cli](https://docs.ksqldb.io/en/latest/operate-and-deploy/installation/cli-config/)
- [kcctl cli](https://github.com/kcctl/kcctl) (optional)

## Start

start `redpanda`, `connect`, `ksqldb` and `console` services for local development

```sh
# Start up to start the service and get the certificates. When that finishes, start the containers.
docker compose up update-certs-helper \
docker compose --env-file .env --env-file .secrets up -d \
docker compose --env-file .env --env-file .secrets logs -f

# Or, utilize the Makefile.
# stat all services in background and show logs
make up # for first time use `make boot` then `make up`
# verify status/health of services
make ps
# shotdown all services
make down
# DANGER: run this if you want to reset database and other persistent volumes
make teardown
# verify if docker `compose` getting correctly resolved application config from .env files
make check

# ssh to container (if needed to debug)
docker compose --env-file .env --env-file .secrets exec -it ksqldb /bin/bash
# debug: check for files in image
crane export confluentinc/cp-ksqldb-server:7.6.0 - | tar -tvf - | grep -v zoneinfo
```

### Web Access

After app process are UP and healthy (verify with `make ps`), You can open each web UI:

| Service     | URL                                               |
| ----------- | ------------------------------------------------- |
| Postgres    | postgres://postgres:postgres@localhost:5432/local |
| Traefik     | https://traefik.traefik.me/dashboard/#/           |
| Console     | https://console.traefik.me                        |
| Connect     | https://connect.traefik.me/connectors             |
| KsqlDB      | https://ksqldb.traefik.me/healthcheck             |
| Redpanda    | https://redpanda.traefik.me/topics                |
| ~~Proton~~  | https://proton.traefik.me                         |
| ~~Grafana~~ | https://grafana.traefik.me                        |

## Testing

> **rpk** command examples:

```shell
rpk profile use local
rpk topic list
rpk topic describe default_ksql_processing_log
```

> **kcctl** command examples:

```shell
# set context for first time
kcctl config set-context local --cluster https://connect.traefik.me

kcctl info
kcctl get plugins
kcctl get connectors
kcctl get offsets

kcctl get loggers
kcctl get logger root

kcctl describe plugin io.debezium.connector.postgresql.PostgresConnector
kcctl describe connector xyz

kcctl restart task ???
kcctl pause task ???
kcctl stop task ???
kcctl delete task ???
```

> Connecting to **ksqldb** via `ksql cli`

```shell
ksql https://ksqldb.traefik.me
#ksql -u admin -p admin https://ksqldb.traefik.me

ksql> show streams;
ksql> show connectors;
```

## References

- [ksqldb-go client](https://github.com/thmeitz/ksqldb-go)
- [ksqldb basic auth](https://github.com/mpistrang/cp-all-in-one/blob/ksqldb-server-basic-auth-example/cp-all-in-one-community/docker-compose.ksqldb-server-basic-auth.yml)
