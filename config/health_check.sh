#!/bin/sh

PUB_DNS=`/opt/sd/meta get public_dns`

until $(curl --output /dev/null --silent --head --fail http://$PUB_DNS:8000); do
    echo '.'
    sleep 5
done
