#!/bin/sh
SONAR_TOKEN=
PATH=$PATH:$PWD/build-wrapper-linux-x86/:$PWD/sonar-scanner-4.4.0.2170-linux/bin/

build-wrapper-linux-x86-64 --out-dir $PWD/bw-output gcc main.c

sonar-scanner \
  -Dsonar.organization=louisrubet-github \
  -Dsonar.login=${SONAR_TOKEN} \
  -Dsonar.projectKey=louisrubet_dev_analyze \
  -Dsonar.projectBaseDir=$PWD/ \
  -Dsonar.working.directory=$PWD/.scannerwork \
  -Dsonar.sources=$PWD/ \
  -Dsonar.cfamily.build-wrapper-output=$PWD/bw-output \
  -Dsonar.cfamily.threads=$(nproc --all) \
  -Dsonar.cfamily.cache.enabled=false \
  -Dsonar.host.url=https://sonarcloud.io
