#! /bin/bash

set -e

cd spring-boot-restful-service

./build-docker.sh

cd ../spring-boot-webapp

./build-docker.sh
