#!/bin/bash

set -ex

NODE_VERSIONS=(14.13.1 12.19.0)

for version in "${NODE_VERSIONS[@]}"
do
  echo "BUILDING Alpine NODE-VERSION: ${version}";
  make NODE_VERSION="${version}" build_alpine push_alpine
done

for version in "${NODE_VERSIONS[@]}"
do
  echo "BUILDING Debian NODE-VERSION: ${version}";
  make NODE_VERSION="${version}" build_debian push_debian
done
