#!/bin/bash

set -ex

chown -R _unbound:_unbound /data/unbound/

echo ">> Load Anchor file"
unbound-anchor -v -r "/data/unbound/root.hints"
cp /usr/share/dnssec-root/trusted-key.key /data/unbound/root.key

echo ">> Check Unbound config files"
unbound-checkconf /data/unbound/unbound.conf

echo ">> Start Unbound"
unbound -c /data/unbound/unbound.conf
