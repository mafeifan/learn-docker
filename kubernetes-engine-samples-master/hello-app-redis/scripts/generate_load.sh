# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# [START container_helloapp_redis_generate_load]
#!/bin/bash
# Usage: generate_load.sh <IP> <QPS>_

IP=$1
QPS=$2

while true
  do for N in $(seq 1 $QPS)
    do curl -I -m 5 -s -w "%{http_code}\n" -o /dev/null http://${IP}/ >> output &
    done
  sleep 1
done
# [END container_helloapp_redis_generate_load]
