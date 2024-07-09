# Makefile

# Define o comando padrão a ser executado
.DEFAULT_GOAL := help

# Comandos
run:
	@uvicorn workout_api.main:app --reload

create-migrations:
	SET PYTHONPATH=%PYTHONPATH%;%cd% & alembic revision --autogenerate -m "workout"

run-migrations:
	SET PYTHONPATH=%PYTHONPATH%;%cd% & alembic upgrade head

run-docker:
	docker-compose up -d

help:
	@echo "Para executar a aplicação, execute:"
	@echo "    make run"
	@echo ""
	@echo "Para criar uma nova migração, execute:"
	@echo "    make create-migrations"
	@echo ""
	@echo "Para aplicar as migrações, execute:"
	@echo "    make run-migrations"
	@echo ""
	@echo "Para executar Docker, execute:"
	@echo "    make run-docker"

