# Docker Compose Tips

## Features

- [ ] [Profiles](https://docs.docker.com/compose/profiles/)
  - Is there any way to disable a service in `docker-compose.yml`? [Ref](https://stackoverflow.com/questions/37254881/is-there-any-way-to-disable-a-service-in-docker-compose-yml)
  - Use `profiles` to store multiple variants of same service in one compose file. e.g., `[local, dev, prod]`
  - Services without a `profiles` attribute are always enabled
  - Auto-starting profiles and dependency resolution
  
    When a service with assigned `profiles` is explicitly targeted on the command line its profiles are started automatically so you don't need to start them manually. This can be used for one-off services and debugging tools. As an example consider the following configuration:

    ```yaml
    services:
      backend:
        image: backend

      db:
        image: mysql

      db-migrations:
        image: backend
        command: myapp migrate
        depends_on:
          - db
        profiles:
          - tools
    ```

    ```sh
      # Only start backend and db
      $ docker compose up -d

      # This runs db-migrations (and,if necessary, start db)
      # by implicitly enabling the profiles `tools`
      $ docker compose run db-migrations
    ```

- [ ] **docker-compose.override.yaml**
  - Use to selectively `desable` on of the service in default `compose.yml`. [Ref](https://stackoverflow.com/questions/37254881/is-there-any-way-to-disable-a-service-in-docker-compose-yml/54214179#54214179)
    - Scale the service to `0 replicas` with

      ```yaml
      deploy:
        replicas: 0
      ```

  - Use to `docker-compose.override.yml` to override labels

      ```yaml
      my_local_app:
        labels:
          - "traefik.http.routers.app1.rule=Host(`amazing.traefik.me`)"
      ```

- [ ] `traefik.me` is a magic domain name that provides wildcard DNS for any IP address. [Ref](https://github.com/pyrou/traefik.me/tree/master)
  - [ ] To reach the container from another device on your local network, use the following docker label :

    ```yaml
      - "traefik.http.routers.app1.rule=HostRegexp(`app1.{ip:.*}.traefik.me`)"
    ```

  - [ ] Use <https://traefik.me> SSL certificates for local HTTPS without having to touch your /etc/hosts or your certificate CA. [Ref](https://gist.github.com/pyrou/4f555cd55677331c742742ee6007a73a)
  - [ ] TLS for on-laptop and local network access your services
- [ ] reuse top-level config in compose.yaml
- [ ] top-level secrests in compose.yaml
- [ ] use **Github Actions** `secrets and variables` in Dockerfile during docker build on `Github Runners`

## TODO

- [ ] traefik:v3.0 <https://github.com/mannuelf/Traefik-and-Docker-VPS-setup>
- [ ] [Traefik without domain name](https://stackoverflow.com/questions/54511454/traefik-without-domain-name)
- [ ] [Docker-compose with Let's Encrypt: TLS Challenge](https://doc.traefik.io/traefik/user-guides/docker-compose/acme-tls/)
- [ ] Traefik gRPC Examples [With HTTP (h2c)](https://doc.traefik.io/traefik/user-guides/grpc/)

## Reference

- [traefik.me](https://github.com/pyrou/traefik.me/tree/master)
- [Use https://traefik.me SSL certificates for local HTTPS without having to touch your /etc/hosts or your certificate CA.](https://gist.github.com/pyrou/4f555cd55677331c742742ee6007a73a)
- traefik.me with Minor tweaks to the original - a Makefile and a 'donotstart' profile for the wget helper. [Ref](https://gist.github.com/pyrou/4f555cd55677331c742742ee6007a73a)
