#! /bin/sh
nginx 
nginx -s reload

nohup python demo.py 8001 > /dev/null 2>&1 &
nohup python demo.py 8002 > /dev/null 2>&1 &
nohup python demo.py 8003 > /dev/null 2>&1 &

# within a Docker container
# load balancer has to be hit with requests 
# before round-robin behavior activates
i=0
while [ "$i" != 50 ]
do
  curl localhost:8080 > /dev/null 2>&1
  i=$((i+1))
done

tail -f /dev/null