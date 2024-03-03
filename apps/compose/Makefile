envfiles := --env-file .env --env-file .secrets

check:
	@docker compose $(envfiles) --profile all config

ps:
	@docker compose $(envfiles) ps

boot:
	@docker compose $(envfiles) up update-certs-helper

up:
	@docker compose $(envfiles) up -d
	@docker compose $(envfiles) logs -f

down:
	@docker compose $(envfiles) down update-certs-helper
	@docker compose $(envfiles) down

teardown:
	@docker compose $(envfiles) down update-certs-helper -v
	@docker compose $(envfiles) down -v
