FROM debian:buster

WORKDIR /work

RUN apt-get update && apt-get install -y curl unzip sqlite3

ADD . .

RUN mkdir -p /app

RUN chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
