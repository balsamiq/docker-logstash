docker-logstash-ec2
===================

Docker agent with ec2 discovery

The following environment variables can be used to configure the container:

CLUSTER_NAME		The name of the elasticsearch cluster, default is "elasticsearch".

LOGSTASH_OPTS		Any additional logstash options such as --verbose to change the logging level to verbose.

The container can be built using

docker build -t balsamiq:logstash-ec2 .

The container can be run using

docker run -i -t -v /var/log:/var/hostlogs -e CLUSTER_NAME=docker -e LOGSTASH_OPTS=--verbose balsamiq:logstash-ec2
