ARG DEBIAN_VERSION_NAME
ARG NODE_VERSION

FROM node:${NODE_VERSION}-${DEBIAN_VERSION_NAME}-slim

ENV PACK_LIBS="postgresql-client" \
  APP_HOME=/app

RUN mkdir ${APP_HOME} \
  && apt-get update \
  && apt-get install -fqq --no-install-recommends \
  ${PACK_LIBS} \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && truncate -s 0 /var/log/*log

WORKDIR ${APP_HOME}

ARG BUILD_DATE
ARG VCS_REF
ARG VCS_URL

LABEL org.label-schema.schema-version="1.0" \
  org.label-schema.vendor="Territory Embrace | Talentplatforms" \
  org.label-schema.vcs-url="${VCS_URL}" \
  org.label-schema.vcs-ref="${VCS_REF}" \
  org.label-schema.name="node.js" \
  org.label-schema.version="${NODE_VERSION}-${DEBIAN_VERSION_NAME}-slim" \
  org.label-schema.build-date="${BUILD_DATE}" \
  org.label-schema.description="the base node image for the frontend"
