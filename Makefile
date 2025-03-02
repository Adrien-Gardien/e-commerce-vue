stop:
	make stop-docker
	make pm2-stop
	make stop-swarm

stop-docker:
	docker stop $$(docker ps -a -q) || true

stop-swarm:
	if docker info | grep -q "Swarm: active"; then \
		docker swarm leave --force; \
	fi

build:
	make stop-docker
	make pm2-stop
	docker compose down -v
	docker compose up --build -d

start-swarm:
	make stop-docker
	make pm2-stop
	make stop-swarm
	docker swarm init --advertise-addr 127.0.0.1; \
	make secrets

pm2:
	pm2 start ecosystem.config.cjs

pm2-stop:
	pm2 stop ecosystem.config.cjs || true
	pm2 delete ecosystem.config.cjs || true

pm2-auth:
	pm2 logs auth-service

hub:
	docker login
	docker build -t kaliwarsteen/ecommercevuefrontend:latest ./frontend
	docker push kaliwarsteen/ecommercevuefrontend:latest
	docker build -t kaliwarsteen/ecommerceauthservice:latest ./services/auth-service
	docker push kaliwarsteen/ecommerceauthservice:latest
	docker build -t kaliwarsteen/ecommerceproductservice:latest ./services/product-service
	docker push kaliwarsteen/ecommerceproductservice:latest
	docker build -t kaliwarsteen/ecommerceorderservice:latest ./services/order-service
	docker push kaliwarsteen/ecommerceorderservice:latest

secrets:
	if docker secret ls | grep -q "env_production"; then \
		docker secret rm env_production; \
	fi
	docker secret create env_production .env.production