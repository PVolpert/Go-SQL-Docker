#!/bin/bash
set -e

for userfile in /run/secrets/*.env
do 
    source $userfile
    echo  "user $name on >$pw $rights" >> /app/redis-acl
done 

echo "user default off" >> /app/redis-acl
