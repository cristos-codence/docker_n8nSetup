#!/bin/bash

curl -X POST \
  https://1csqhmda1aly9vhicgbpypla.hooks.n8n.cloud/webhook-test/b740ef2b-0f9b-4d17-8eb8-b6d3d3311e18 \
  -H 'Content-Type: application/json' \
  -d '{
    "key1": "value1",
    "key2": "value2"
}'
