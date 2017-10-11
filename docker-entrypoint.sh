#!/bin/bash

set -ex

echo ">> Check Unbound config files"
unbound-checkconf

echo ">> Load Anchor file"
unbound-anchor -v

echo ">> Start Unbound"
unbound
