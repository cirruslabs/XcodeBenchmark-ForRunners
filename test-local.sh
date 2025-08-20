#!/usr/bin/env bash

mkdir -p /tmp/fiotest

/opt/homebrew/bin/fio --name=write_throughput --directory=/tmp/fiotest --numjobs=8 --size=10G --time_based --runtime=60s --ramp_time=2s --direct=1 --verify=0 --bs=1M --iodepth=64 --rw=write --group_reporting=1

rm -rf /tmp/fiotest