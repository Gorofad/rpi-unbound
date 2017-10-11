FROM resin/raspberry-pi-alpine:3.6

MAINTAINER Gorofad "gorofad@posteo.de"

RUN apk add --update unbound apk-cron; rm -rf /var/cache/apk/* ;

COPY unbound.conf /etc/unbound/unbound.conf
COPY root.hints /etc/unbound/

RUN unbound-checkconf

COPY unbound_updates.sh /etc/cron.weekly

RUN unbound-anchor -v

EXPOSE 53/udp
CMD ["unbound"]
