FROM python:3.7-alpine
MAINTAINER Marina Lobina

ENV PYTHONUNBUFFERED 1

RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt --no-cache-dir

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user
USER user