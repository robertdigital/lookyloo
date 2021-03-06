FROM ubuntu:bionic
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install wget python3-pip nodejs git python3-venv
RUN pip3 install poetry

WORKDIR lookyloo

COPY lookyloo lookyloo/
COPY client client/
COPY bin bin/
COPY website website/
COPY setup.py .
COPY pyproject.toml .
COPY poetry.lock .

RUN mkdir cache user_agents scraped

RUN poetry install
RUN echo LOOKYLOO_HOME="'`pwd`'" > .env
