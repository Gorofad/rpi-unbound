#!/bin/bash

set -ex

echo "Check Unbound config files"
unbound-checkconf

echo "Start Unbound Server"
unbound
