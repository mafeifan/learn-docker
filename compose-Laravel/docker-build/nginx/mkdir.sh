#!/bin/bash
#
# windows用户如果报/bin/bash^M: bad interpreter: No such file or directory
# 需要打开git bash 执行 dos2unix mkdir.sh

p1='/opt'
p2='/opt/code'
p3='/opt/log'
p4='/opt/log/nginx'

for p in $p1 $p2 $p3 $p4
do
    if [ ! -d "$p" ]
    then
        mkdir "$p"
    fi
done

exec `chown -R www-data:www-data /opt/code /opt/log`

