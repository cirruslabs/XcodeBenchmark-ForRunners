#!/usr/bin/env bash

set -e

tart clone benchmark-seed benchmark

# configure the VM
tart set $IMAGE --disk-size 200
tart run $IMAGE --no-graphics $@ &

tart ip --wait 60 $IMAGE
# run the test
sshpass -p admin ssh -o "StrictHostKeyChecking no" admin@$(tart ip $IMAGE) < test-local.sh

tart stop $IMAGE
tart delete $IMAGE