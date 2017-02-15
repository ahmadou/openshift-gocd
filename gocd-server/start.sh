#!/bin/bash
set -e

java -jar /usr/share/go-server/go.jar &
pid=$!

until curl -s -o /dev/null 'http://localhost:8153'
do
  sleep 1
done

if [ -n "$GOCD_AGENT_SECRET" ]
then
  sed -i -e 's/agentAutoRegisterKey="[^"]*" *//' -e 's#\(<server\)\(.*artifactsdir.*\)#\1 agentAutoRegisterKey="'$GOCD_AGENT_SECRET'"\2#' /var/lib/go-server/config/cruise-config.xml
fi

wait $pid
