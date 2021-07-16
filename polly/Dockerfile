FROM amazon/aws-cli

RUN yum -y install \
  jq \
  && yum -y clean all \
  && rm -fr /var/cache

COPY polly.sh /opt/

ENTRYPOINT ["/opt/polly.sh"]
