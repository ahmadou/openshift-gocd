#!/bin/bash
set -e

mkdir -p /var/lib/go-agent/config

if [ -n "$GOCD_AGENT_SECRET" ]
then
  echo "agent.auto.register.key=$GOCD_AGENT_SECRET" > /var/lib/go-agent/config/autoregister.properties
fi

/usr/share/go-agent/agent.sh