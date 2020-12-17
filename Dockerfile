FROM debian:buster

WORKDIR /work

apt-get update && apt-get install -y curl unzip sqlite3

ADD . .

RUN chmod +x entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
