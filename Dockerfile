FROM ubuntu:trusty

ENV TERM=xterm-256color

RUN sed -i "s/http:\/\/archive./http:\/\/fi.archive./g" /etc/apt/sources.list

RUN apt-get update && \
	apt-get install curl -y && \
	curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash - && \
	apt-get install -y nodejs

COPY . /app
WORKDIR /app

RUN npm install -g mocha && \
	npm install

ENTRYPOINT ["mocha"]
