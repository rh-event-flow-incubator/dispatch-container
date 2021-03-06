#!/bin/bash

#Need to login first
OPENSHIFT_TOKEN=$(oc whoami -t)
docker login -u system -p ${OPENSHIFT_TOKEN} 172.30.1.1:5000

echo 'Building Qpid Dispatch Router'
docker build -t sjwoodman/dispatch-a .
docker tag sjwoodman/dispatch-a:latest 172.30.1.1:5000/myproject/dispatch-a:latest
docker push 172.30.1.1:5000/myproject/dispatch-a:latest
