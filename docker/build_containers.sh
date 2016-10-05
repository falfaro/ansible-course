#!/bin/sh
set -e
docker build -t ubuntu ubuntu
docker build -t centos centos
