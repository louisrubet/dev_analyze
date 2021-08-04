#!/bin/sh
SONAR_TOKEN=8d909813cb06edffad8cda3ccc3a236c5e7b2496

build-wrapper-linux-x86-64--out-dir bw-output gcc main.c

sonar-scanner \
  -Dsonar.organization=louisrubet-github \
  -Dsonar.projectKey=louisrubet_dev_analyze \
  -Dsonar.sources=. \
  -Dsonar.cfamily.build-wrapper-output=bw-output \
  -Dsonar.host.url=https://sonarcloud.io
