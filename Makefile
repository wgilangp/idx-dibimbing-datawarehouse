include .env

docker-build:
	@docker network inspect data-network >/dev/null 2>&1 || docker network create data-network

postgres: postgres-init postgres-create postgres-restore

postgres-init:
	@docker compose -f docker/docker-compose-pgadmin.yml --env-file .env up -d
	@echo 'Postgres Docker Host	: ${POSTGRES_CONTAINER_NAME}' &&\
		echo 'Postgres Account	: ${POSTGRES_USER}' &&\
		echo 'Postgres password	: ${POSTGRES_PASSWORD}' &&\
		echo 'Postgres Db		: ${POSTGRES_DB}'
	@sleep 5
	@echo '==========================================================='

postgres-create:
	@docker exec -it ${POSTGRES_CONTAINER_NAME} psql -U ${POSTGRES_USER} -d ${POSTGRES_DB} -c  "CREATE DATABASE ${POSTGRES_DB_NEW};"

postgres-restore:
	@docker exec -it ${POSTGRES_CONTAINER_NAME} pg_restore -U ${POSTGRES_USER} -d ${POSTGRES_DB_NEW} data/dvdrental.tar

postgres-psql:
	@docker exec -it ${POSTGRES_CONTAINER_NAME} psql -U ${POSTGRES_USER} -d ${POSTGRES_DB_NEW}

docker-down:
	@docker compose -f docker/docker-compose-pgadmin.yml down 

clean-up:
	@docker system prune --all --volumes --force

