docker-logstash
===============

Docker logstash agent with ec2 discovery

The following environment variables can be used to configure the container:

    ES_CLUSTER_NAME     The name of the elasticsearch cluster, default is "elasticsearch".
    										This is also the ec2 group name that is used for discovery.
    ES_DISCOVERY        The type of discovery to use with elasticsearch, if not set will 
                        use multicast. Setting to "ec2" will enable ec2 discovery using
                        ES_CLUSTER_NAME in ES_AWS_REGION.
    ES_AWS_REGION       The aws region to be used for discovery, default is "us-east-1".
    LOGSTASH_OPTS       Any additional logstash options such as --verbose to change the 
    										logging level to verbose.

To build:

    docker build -t balsamiq/docker-logstash .

To run on ec2:

    docker run -p 9200:9200 -p 9300:9300 -e ES_DISCOVERY=ec2 -v /var/log:/var/host/log balsamiq/docker-logstash

To run locally:

    docker run -v /var/log:/var/host/log balsamiq/docker-logstash
