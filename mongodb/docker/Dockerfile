FROM mongodb/mongodb-community-server:latest

USER root

RUN apt-get update && apt-get install -y vim
RUN mkdir -p /data/scripts
RUN chown -R mongodb:mongodb /data/scripts

USER mongodb

ENV MONGO_INITDB_ROOT_USERNAME=root
ENV MONGO_INITDB_ROOT_PASSWORD=secure

COPY scripts/restaurants/** /data/scripts

CMD ["mongod"]
