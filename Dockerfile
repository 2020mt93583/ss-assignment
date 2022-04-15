FROM alpine:3
RUN apk add --update python3 py3-pip gcc python3-dev linux-headers musl-dev
RUN pip install uvicorn

WORKDIR /code
RUN mkdir inventory-service
COPY ./inventory-service/requirements.txt /code/inventory-service/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /code/inventory-service/requirements.txt
COPY ./inventory-service/app /code/inventory-service/app


WORKDIR /code
RUN mkdir users-service
COPY ./users-service/requirements.txt /code/users-service/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /code/users-service/requirements.txt
COPY ./users-service/app /code/users-service/app

WORKDIR /code
RUN mkdir orders-service
COPY ./orders-service/requirements.txt /code/orders-service/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /code/orders-service/requirements.txt
COPY ./orders-service/app /code/orders-service/app

COPY ./wrapper.sh /code/wrapper.sh

RUN chmod +x wrapper.sh
CMD ./wrapper.sh