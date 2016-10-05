#!/bin/bash

port=33000

function start() {
  let port+=1
  docker run --label foo=bar --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro -d -P -h $1 -p 127.0.0.1:$port:22 --name $1 $2
}

start webserver01 centos
start webserver02 centos
start webserver03 ubuntu
start mysql01 centos
start mysql02 ubuntu
