#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5ea254bea19f5e001c769b81/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5ea254bea19f5e001c769b81
curl -s -X POST https://api.stackbit.com/project/5ea254bea19f5e001c769b81/webhook/build/ssgbuild > /dev/null
hugo
curl -s -X POST https://api.stackbit.com/project/5ea254bea19f5e001c769b81/webhook/build/publish > /dev/null
