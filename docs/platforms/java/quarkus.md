# quarkus

## Install

install the CLI with SDKMAN!
```shell
sdk install quarkus
```

## Create

```shell
quarkus create && cd code-with-quarkus
# or
quarkus create app   \
--kotlin --gradle-kotlin-dsl \
--package-name=com.example.app \
--app-config=key1=value1,key2=value2 \
--extensions=kotlin,config-yaml,resteasy-jsonb,jib \
--verbose --dry-run \
sumo && cd sumo
```

## Run

```shell
quarkus run
```

Boom! Your Quarkus app is now running at `localhost:8080`

## Development

### Dev Run
By default, quarkusDev sets the debug host to localhost
```shell
# run in development mode
quarkus dev
# run in debugging mode
quarkus dev -Dsuspend -Ddebug
```

### Build
```shell
quarkus build
# building a native executable
quarkus build --native
```

### Maintenance

```shell
# you can enable an extension using:
quarkus extension add 'hibernate-validator'
```

### Test
```shell
# running tests
gradle test
# running integration tests
gradle quarkusIntTest
# running native tests
gradle testNative
```
## Reference
- [BUILDING QUARKUS APPS WITH GRADLE](https://quarkus.io/guides/gradle-tooling#dev-mode)