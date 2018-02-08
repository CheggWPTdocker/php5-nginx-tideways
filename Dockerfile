FROM cheggwpt/php5-nginx:0.0.1

# Tideways ENVs
ENV TIDEWAYS_PORT_UDP 8135
ENV TIDEWAYS_PORT_TCP 9135
ENV tideways_version 1.5.3

RUN cd /tmp && \
    wget https://s3-eu-west-1.amazonaws.com/tideways/daemon/${tideways_version}/tideways-daemon-v${tideways_version}-alpine.tar.gz && \
    tar -zxf tideways-daemon-v${tideways_version}-alpine.tar.gz && \
    mv build/dist/tideways-daemon /usr/bin && \
    ls -l /usr/bin/tideways-daemon && \
    mkdir -p /var/run/tideways && \
    rm -rf build/ tideways-daemon-v${tideways_version}-alpine.tar.gz

# Add the config
COPY container_confs /

