#!/bin/bash
# Updating Unbound resources.
# Place this into e.g. /etc/cron.weekly


###[ root.hints ]###
curl -o /etc/unbound/root.hints.new https://www.internic.net/domain/named.cache
if [[ $? -eq 0 ]]; then
  mv /etc/unbound/root.hints /etc/unbound/root.hints.bak
  mv /etc/unbound/root.hints.new /etc/unbound/root.hints
  unbound-checkconf >/dev/null
  if [[ $? -eq 0 ]]; then
    rm /etc/unbound/root.hints.bak
    service unbound reload >/dev/null
  else
    echo "Warning: Errors in newly downloaded root.hints file probably due to incomplete download:"
    unbound-checkconf
    mv /etc/unbound/root.hints /etc/unbound/root.hints.new
    mv /etc/unbound/root.hints.bak /etc/unbound/root.hints
  fi
else
  echo "Download of unbound root.hints failed!"
fi
