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

# [START container_helloapp_redis_print_errorrate]
#!/bin/bash
# Usage: watch ./print_error_rate.sh

TOTAL=$(cat output | wc -l);
SUCCESS=$(grep "200" output |  wc -l);
ERROR1=$(grep "000" output |  wc -l)
ERROR2=$(grep "503" output |  wc -l)
ERROR3=$(grep "500" output |  wc -l)
SUCCESS_RATE=$(($SUCCESS * 100 / TOTAL))
ERROR_RATE=$(($ERROR1 * 100 / TOTAL))
ERROR_RATE_2=$(($ERROR2 * 100 / TOTAL))
ERROR_RATE_3=$(($ERROR3 * 100 / TOTAL))
echo "Success rate: $SUCCESS/$TOTAL (${SUCCESS_RATE}%)"
echo "App network Error rate: $ERROR1/$TOTAL (${ERROR_RATE}%)"
echo "Resource Error rate: $ERROR2/$TOTAL (${ERROR_RATE_2}%)"
echo "Redis Error rate: $ERROR3/$TOTAL (${ERROR_RATE_3}%)"
# [END container_helloapp_redis_print_errorrate]
