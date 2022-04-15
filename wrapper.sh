#!/bin/ash

cd inventory-service
uvicorn app.main:app --host 0.0.0.0 & 

cd ../orders-service
uvicorn app.main:app --port 8001 --host 0.0.0.0 & 

cd ../users-service
uvicorn app.main:app --port 8002 --host 0.0.0.0 & 

while true; do sleep 1; done;