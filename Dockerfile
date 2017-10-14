FROM resin/raspberry-pi-alpine:3.6

MAINTAINER Gorofad "gorofad@posteo.de"

RUN apk update && \
    apk upgrade && \
    apk add unbound && \
    rm -rf /var/cache/apk/*

COPY unbound.conf root.hints /etc/unbound/

COPY docker-entrypoint.sh /usr/local/bin/

RUN chmod a+x /usr/local/bin/docker-entrypoint.sh && \
    unbound-anchor -v && \
    chown -R unbound:unbound /usr/share/dnssec-root/

EXPOSE 53/udp

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["unbound"]
