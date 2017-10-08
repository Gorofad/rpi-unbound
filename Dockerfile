FROM resin/raspberry-pi-alpine:3.6

MAINTAINER Gorofad "gorofad@posteo.de"

RUN apk add --update unbound apk-cron; rm -rf /var/cache/apk/* ;

COPY conf-ct/unbound.conf /etc/unbound/unbound.conf
COPY conf-ct/01_CacheForwarder.conf /etc/unbound/unbound.conf.d/
COPY conf-ct/02_Validate.conf /etc/unbound/unbound.conf.d/
COPY conf-ct/03_DumbFirewalls.conf /etc/unbound/unbound.conf.d/
COPY conf-ct/root.hints /etc/unbound/

RUN unbound-checkconf

COPY conf-ct/unbound_updates.sh /etc/cron.weekly

RUN unbound-anchor -v

CMD ["unbound"]
