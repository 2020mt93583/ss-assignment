# ss-assignment

## this repository contains the 3 services as submodules

## redis folder container a docker compose yml for setting up the required database infrastructure.

## Use the below commands to build a docker image containing all 3 required services and start them in a single container

>docker build . -t monolith:latest

>docker run -itd --network redis_default -p 8000:8000 -p 8001:8001 -p 8002:8002 --name monolith-container -e orders-db-name=orders-db -e orders-db-pass=ordersDbPass -e eventq-host-name=eventq -e eventq-pass=eventqPass -e inventory-service-url=localhost:8000 -e users-service-url=localhost:8002 -e inventory-db-name=inventory-db -e inventory-db-pass=invDbPass -e users-db-name=users-db -e users-db-pass=usersDbPass monolith:latest

## the services inventory-service, orders-service and users-service can be built into individual docker images using the Dockerfile (s) inside the respective folders and deployed into separate containers using the commands inside their respective readme(s)