[![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-yellow.svg)](https://conventionalcommits.org)

# Node.js Frontend Image

This is an opinionated image for node-based frontend focused images.
It ships with a couple of tools and libraries found in the next section.

This now comes in two flavours: alpine and debian-slim.

## Tools and Libraries

* bash

## Specifics for Node.js

This image always runs with `NODE_ENV=production`. So be sure to override it when you want to install your dev dependencies.

## Workdir

Per convention the working directory is set to **/app**

# How to use this

The image comes with a Makefile that has everything abstracted away for you to easily customize it.

```bash
$ make make NODE_VERSION=13.10.1 ALPINE_VERSION=3.11 DEBIAN_VERSION_NAME=buster build push
```

## Available VARS

```bash
NODE_VERSION=13.12.0
ALPINE_VERSION=3.11
DEBIAN_VERSION_NAME=buster
REGISTRY=${REGISTRY:-ORGANIZATION/node-frontend}
VCS_URL=${VCS_URL:-https://THE_REPO_URL}
```

## Optional Setup

If you are into some tooling for keeping commit-messages clean and want to keep an automated CHANGELOG.md, feel free to `make init` ;).

It'll install the node_modules:
- standard-version,
- husky
- commit-lint

To make this work you need to have NODE.js installed.

# Contributing
In lieu of a formal styleguide, take care to maintain the existing coding style.

1. Fork it
2. Create your feature branch (git checkout -b feature/my-cool-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin feature/my-new-feature)
5. Create new Pull Request

# License
Copyright (c) 2020 Territory Embrace - Talent Platforms.
