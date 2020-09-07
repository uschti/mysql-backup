# mysql backup image
FROM alpine:3.12
LABEL maintainer "Andrea Pellegrini <uschti@gmail.com>"

# install the necessary client
RUN apk add --update 'mariadb-client>10.3.15' mariadb-connector-c bash python3 samba-client shadow cmd:pip3 && \
    rm -rf /var/cache/apk/* && \
    touch /etc/samba/smb.conf && \
    pip3 install awscli

# install the entrypoint
COPY functions.sh /
COPY entrypoint /entrypoint

# start
ENTRYPOINT ["/entrypoint"]
