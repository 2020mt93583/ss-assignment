#!/bin/ash

cd inventory-service
uvicorn app.main:app & 

cd ../orders-service
uvicorn app.main:app --port 8001 & 

cd ../users-service
uvicorn app.main:app --port 8002 & 

while true; do sleep 1; done;