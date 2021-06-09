#!/bin/bash

if [[ ${GET_HOSTS_FROM:-dns} == "env" ]]; then
  redis-server --replicaof ${REDIS_LEADER_SERVICE_HOST} 6379
else
  redis-server --replicaof redis-leader 6379
fi
