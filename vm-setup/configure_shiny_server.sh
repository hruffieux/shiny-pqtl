#!/bin/sh

ret=$(grep "disable_websockets;" /etc/shiny-server/shiny-server.conf | wc -l)

if [ $ret -eq 0 ]; then
    echo "disable_websockets;" >> /etc/shiny-server/shiny-server.conf
fi

ret=$(grep "disable_protocols xdr-streaming xhr-streaming iframe-eventsource iframe-htmlfile;" /etc/shiny-server/shiny-server.conf | wc -l)

if [ $ret -eq 0 ]; then
    echo "disable_protocols xdr-streaming xhr-streaming iframe-eventsource iframe-htmlfile;" >> /etc/shiny-server/shiny-server.conf
fi

