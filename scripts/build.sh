#!/usr/bin/env bash

#rm -fvR build zooservice

if [ -z "${BUILDER_DOCKERIMAGE}" ]; then
  BUILDER_DOCKERIMAGE='eoepca/eoepca-build-cpp:1.0'
fi

if [ -z "${CMAKERELEASE}" ]; then
  CMAKERELEASE='Release'
fi

if [ -z "${LOCAL_IMAGE_NAME}" ]; then
  LOCAL_IMAGE_NAME='ems:build'
fi

HERE=$PWD

docker build --rm -t ${LOCAL_IMAGE_NAME} .
if [ $? -ne 0 ]; then
  echo "docker build --rm -t ${LOCAL_IMAGE_NAME} failed"
  exit 2
fi


