docker-logstash-ec2
===================

Docker agent with ec2 discovery

The following environment variables can be used to configure the container:

    ES_AWS_REGION				The aws region to be used for discovery, default is "us-east-1".
    ES_CLUSTER_NAME    	The name of the elasticsearch cluster, default is "elasticsearch".  This is also
    									  the ec2 group name that is used for discovery.
    LOGSTASH_OPTS   		Any additional logstash options such as --verbose to change the logging level to verbose.

The container can be built using

    docker build -t balsamiq/docker-logstash-ec2 .

The container can be run using

    docker run -p 9200:9200 -p 9300:9300 -v /var/log:/var/hostlogs -e CLUSTER_NAME=docker -e LOGSTASH_OPTS=--verbose balsamiq/docker-logstash-ec2
