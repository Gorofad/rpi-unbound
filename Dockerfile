FROM resin/raspberry-pi-alpine:3.6

MAINTAINER Gorofad "gorofad@posteo.de"

<<<<<<< HEAD
RUN apk update \
  && apk upgrade \
  && apk add unbound apk-cron \
  && rm -rf /var/cache/apk/* 

RUN addgroup _unbound && \
    adduser -S -H -G _unbound _unbound && \
    mkdir -p -m 700 /data/unbound && \
    chown _unbound:_unbound /data/unbound

COPY unbound.conf root.hints /data/unbound/

COPY unbound_updates.sh /etc/cron.weekly

COPY docker-entrypoint.sh /usr/local/bin/
=======
RUN apk update && \
    apk upgrade && \
    apk add unbound && \
    rm -rf /var/cache/apk/*

COPY unbound.conf root.hints /etc/unbound/

COPY docker-entrypoint.sh /usr/local/bin/

RUN chmod a+x /usr/local/bin/docker-entrypoint.sh && \
    unbound-anchor -v && \
    chown -R unbound:unbound /usr/share/dnssec-root/
>>>>>>> develop

EXPOSE 53/udp

ENTRYPOINT ["docker-entrypoint.sh"]

<<<<<<< HEAD
CMD ["unbound", "-c /data/unbound/unbound.conf"]
=======
CMD ["unbound"]
>>>>>>> develop
