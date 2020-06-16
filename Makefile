################################################################################
# start / stop / prepare
################################################################################

init:
	npm install

################################################################################
# releases
################################################################################

# patches a version
patch:
	npm run release:patch

# minor up
minor:
	npm run release:minor

# major up
release:
	npm run release

################################################################################
# docker building stuff
################################################################################
# you have to know what you're doing if your using this ;)

NODE_VERSION=14.4.0
ALPINE_VERSION=3.11
REGISTRY=talentplatforms/node-frontend
VCS_URL=https://github.com/talentplatforms/node-frontend

# DO NOT OVERRIDE!
_BUILD_DATE=$(shell echo $$(date -u +'%Y-%m-%dT%H:%M:%SZ'))
_VCS_REF=$(shell echo $$(git rev-parse --verify HEAD))
_IMAGE_LATEST=${REGISTRY}:latest
_IMAGE_TAGGED=${REGISTRY}:${NODE_VERSION}-alpine${ALPINE_VERSION}

# builds the image and tags it with the latest tag and the more specific tag defined in _IMAGE_TAGGED
build:
	docker build \
	--rm \
	--build-arg NODE_VERSION=${NODE_VERSION} \
	--build-arg ALPINE_VERSION=${ALPINE_VERSION} \
	--build-arg BUILD_DATE=${_BUILD_DATE} \
	--build-arg VCS_URL=${VCS_URL} \
	--build-arg VCS_REF=${_VCS_REF} \
	--build-arg BUILDKIT_INLINE_CACHE=1 \
	-t ${_IMAGE_LATEST} \
	-t ${_IMAGE_TAGGED} \
	.

# pushes the tagged image to the registry
# if no variables are set, it uses the defaults
push:
	docker push ${_IMAGE_LATEST}
	docker push ${_IMAGE_TAGGED}

# make NODE_VERSION=13.10.1 build push
