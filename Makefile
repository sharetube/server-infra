COMPOSE_ENV ?= dev
COMPOSE_FILE=compose.$(COMPOSE_ENV).yaml

.PHONY: gen-env-example
gen-env-example:
	sed 's/=.*/=/' .env > .env.example

.PHONY: down
down:
	docker compose -f ${COMPOSE_FILE} down

.PHONY: up
up:
	docker compose -f ${COMPOSE_FILE} up

.PHONY: upd
upd:
	docker compose -f ${COMPOSE_FILE} up -d

.PHONY: build
build:
	docker compose -f ${COMPOSE_FILE} build

.PHONY: run
run:
	docker compose -f ${COMPOSE_FILE} up --build

.PHONY: rund
rund:
	docker compose -f ${COMPOSE_FILE} up --build -d