# mysql backup image
FROM alpine:3.10
LABEL maintainer "Andrea Pellegrini <uschti@gmail.com>"

# install the necessary client
RUN apk add --update mysql-client bash python3 samba-client shadow && \
    rm -rf /var/cache/apk/* && \
    touch /etc/samba/smb.conf && \
    pip3 install awscli

# install the entrypoint
COPY functions.sh /
COPY entrypoint /entrypoint

# start
ENTRYPOINT ["/entrypoint"]
