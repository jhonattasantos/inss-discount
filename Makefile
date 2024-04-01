DC = $(shell which docker-compose)

all: help

help:
	@echo "Available make commands:"
	@echo "  up           - subir ambiente de dev"
	@echo "  dev           - subir ambiente de dev em background"
	@echo "  down          - parar ambiente de dev"
	@echo "  ps            - mostrar containers"
	@echo "  logs          - mostrar logs"
	@echo "  s             - subir sidekiq"
	@echo "  console       - carregar console do rails"
	@echo "  test          - roda todos os testes"
	@echo "  build         - buildar containers"


up:
	${DC} up

dev:
	${DC} up -d

down:
	${DC} down --remove-orphans

ps:
	${DC} ps

logs:
	${DC} logs -f --tail=30

build:
	${DC} build

s:
	${DC} exec web sidekiq

console:
	${DC} exec web rails console

bash:
	${DC} exec web sh

test:
	${DC} exec web rspec spec $(spec)

debug:
	docker attach inss_discount-web-1

db-create:
	${DC} exec web rails db:create

db-migrate:
	${DC} exec web rails db:migrate

db-seed:
	${DC} exec web rails db:seed

db-drop:
	${DC} exec web rails db:drop

db-truncate:
	${DC} exec web rails db:truncate_all
