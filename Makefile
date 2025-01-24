include .env

help:
	@echo "## postgres			- Run a Postgres container  "

postgres: postgres-init postgres-create postgres-restore

postgres-init:
	@docker network inspect data-network >/dev/null 2>&1 || docker network create data-network
	@docker compose -f docker/docker-compose-pgadmin.yml --env-file .env up -d
	@echo 'Postgres Docker Host	: ${POSTGRES_CONTAINER_NAME}' &&\
		echo 'Postgres Account	: ${POSTGRES_USER}' &&\
		echo 'Postgres password	: ${POSTGRES_PASSWORD}' &&\
		echo 'Postgres Db		: ${POSTGRES_DB}'
	@sleep 5
	@echo '==========================================================='

postgres-create:
	@echo 'Starting Create Postgre User'
	@docker exec -it ${POSTGRES_CONTAINER_NAME} psql -U ${POSTGRES_USER} -d ${POSTGRES_DB} -c  "CREATE DATABASE ${POSTGRES_DB_NEW};"
	@sleep 5
	@echo '==========================================================='

postgres-restore:
	@echo 'Starting Restore Database'
	@docker exec -it ${POSTGRES_CONTAINER_NAME} pg_restore -U ${POSTGRES_USER} -d ${POSTGRES_DB_NEW} data/dvdrental.tar
	@sleep 15
	@echo 'NOW you can try to open PGADMIN'
	@echo '==========================================================='

postgres-psql:
	@docker exec -it ${POSTGRES_CONTAINER_NAME} psql -U ${POSTGRES_USER} -d ${POSTGRES_DB_NEW}

postgres-down:
	@docker compose -f docker/docker-compose-pgadmin.yml down 

clean:
	@docker system prune --all --volumes --force

