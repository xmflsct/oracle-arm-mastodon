#!/bin/bash

cp -R /plugins/analysis-ik /usr/share/elasticsearch/plugins
cp -R /plugins/analysis-stconvert /usr/share/elasticsearch/plugins

exec /usr/local/bin/docker-entrypoint.sh elasticsearch
