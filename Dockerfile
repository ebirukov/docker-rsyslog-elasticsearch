FROM      ubuntu:trusty

RUN       apt-get -y update && \
          apt-get upgrade -y --no-install-recommends && \
          apt-get install -y --no-install-recommends \
          python-software-properties software-properties-common && \
          apt-get clean

RUN       sudo add-apt-repository ppa:adiscon/v8-stable

RUN       apt-get -y update && \
          apt-get -q -y --no-install-recommends install \
          rsyslog rsyslog-elasticsearch && \
          apt-get clean

COPY      entrypoint.sh                  /
COPY	  rsyslog.conf                   /etc/
COPY      rsyslog_elasticsearch.conf     /etc/rsyslog.d/

ENTRYPOINT ["/entrypoint.sh"]
CMD ["-n"]
