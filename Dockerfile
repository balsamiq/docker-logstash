
# BUILD: docker build -t balsamiq:logstash-ec2 .
# RUN: docker run -i -t -v /var/log:/var/hostlogs -e CLUSTER_NAME=docker -e LOGSTASH_OPTS=--verbose balsamiq:logstash-ec2
FROM stackbrew/ubuntu:saucy
MAINTAINER Luis Arias <luis@balsamiq.com>

RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install wget unzip

# Install logstash
RUN wget -O- http://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add -
RUN echo "deb http://packages.elasticsearch.org/logstash/1.4/debian stable main" > /etc/apt/sources.list.d/logstash.list
RUN apt-get update && apt-get -y install logstash

# Install elasticsearch ec2 plugin jars
WORKDIR /opt/logstash/vendor
RUN wget http://download.elasticsearch.org/elasticsearch/elasticsearch-cloud-aws/elasticsearch-cloud-aws-2.0.0.zip && unzip elasticsearch-cloud-aws-2.0.0.zip && rm elasticsearch-cloud-aws-2.0.0.zip 

# Install elasticsearch config
WORKDIR /opt/logstash
RUN ln -s /etc/elasticsearch/elasticsearch.yml

ADD run /opt/logstash/run
RUN chmod +x run

ADD config/etc /etc

ENV ES_CLUSTER_NAME elasticsearch
ENV ES_DISCOVERY ec2
ENV ES_AWS_REGION us-east-1
VOLUME ["/var/hostlogs"]

EXPOSE 9200 9300

CMD ./run