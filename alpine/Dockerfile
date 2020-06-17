ARG ALPINE_VERSION
ARG NODE_VERSION

FROM node:${NODE_VERSION}-alpine${ALPINE_VERSION}
ENV NODE_ENV=production \
  APP_PORT=3000 \
  APP_HOME=/app

RUN mkdir -p ${APP_HOME}
WORKDIR ${APP_HOME}

RUN apk add --no-cache bash

ARG BUILD_DATE
ARG VCS_REF
ARG VCS_URL

LABEL org.label-schema.schema-version="1.0" \
  org.label-schema.vendor="Territory Embrace | Talentplatforms" \
  org.label-schema.vcs-url="${VCS_URL}" \
  org.label-schema.vcs-ref="${VCS_REF}" \
  org.label-schema.name="node.js" \
  org.label-schema.version="${NODE_VERSION}-alpine-${ALPINE_VERSION}" \
  org.label-schema.build-date="${BUILD_DATE}" \
  org.label-schema.description="the base node image for the frontend"
