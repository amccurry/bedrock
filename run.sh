#!/bin/bash
set -ex

mkdir -p /bedrock-server/config

if [ ! -f "/bedrock-server/config/server.properties" ] ; then
  cp /bedrock-server/server.properties /bedrock-server/config
fi

if [ ! -f "/bedrock-server/config/permissions.json" ] ; then
  cp /bedrock-server/permissions.json /bedrock-server/config
fi

if [ ! -f "/bedrock-server/config/whitelist.json" ] ; then
  cp /bedrock-server/whitelist.json /bedrock-server/config
fi

rm -f /bedrock-server/server.properties /bedrock-server/permissions.json /bedrock-server/whitelist.json

ln -s /bedrock-server/config/server.properties /bedrock-server/server.properties
ln -s /bedrock-server/config/permissions.json /bedrock-server/permissions.json
ln -s /bedrock-server/config/whitelist.json /bedrock-server/whitelist.json

exec ./bedrock_server
