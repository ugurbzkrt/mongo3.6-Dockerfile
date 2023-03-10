FROM ubuntu

RUN apt-get update
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5
RUN echo 'deb [ arch=amd64 ] http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/testing multiverse' | tee /etc/apt/sources.list.d/mongodb-org-3.6.list
RUN apt-get update
RUN apt-get install -y mongodb-org

RUN mkdir -p /data/db

EXPOSE 27017
ENTRYPOINT ["/usr/bin/mongod", "--bind_ip_all"]

# to run  
# docker build -t mongo-example .
# docker run --name mongo-example -p 27017:27017 -t mongo-example 
