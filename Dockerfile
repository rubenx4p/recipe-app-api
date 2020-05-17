FROM python:3.7-alpine
LABEL maintainer="Ruben Fefer Developer"
# tells python to run in unbuffered mode which is recommended when running python within Docker containers   
ENV PYTHONUNBUFFERED 1 

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app
# for security popuses
RUN adduser -D user
USER user