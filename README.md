docker-logstash
===============

Docker logstash agent with ec2 discovery

The following environment variables can be used to configure the container:

    ES_CLUSTER_NAME     The name of the elasticsearch cluster, default is "elasticsearch".  This is also
                        the ec2 group name that is used for discovery.
    ES_DISCOVERY        The type of discovery to use with elasticsearch, if not set will use multicast. Setting to "ec2"
                                            will enable ec2 discovery using ES_CLUSTER_NAME in ES_AWS_REGION.
    ES_AWS_REGION       The aws region to be used for discovery, default is "us-east-1".
    LOGSTASH_OPTS       Any additional logstash options such as --verbose to change the logging level to verbose.

The container can be built using

    docker build -t balsamiq/docker-logstash .

The container can be run as an agent on ec2 using

    docker run -p 9200:9200 -p 9300:9300 -v /var/log:/var/hostlogs -e CLUSTER_NAME=docker -e LOGSTASH_OPTS=--verbose balsamiq/docker-logstash

To run the container locally alongside an elasticsearch master node instead of on ec2 you need to set the ES_DISCOVERY env var to something other
than "ec2", for instance:

    docker run -v /var/log:/var/hostlogs -e ES_DISCOVERY=multicast balsamiq/docker-logstash
