FROM alpine:3.11.5
RUN apk upgrade --no-cache && apk add --no-cache postgresql-client bash openssl libgcc libstdc++ ncurses-libs bash

ARG APP_NAME
ARG MIX_ENV

ENV REPLACE_OS_VARS=true \
    MIX_ENV=${MIX_ENV} \
    APP_NAME=${APP_NAME}

WORKDIR /opt/app

COPY _build ./_build
CMD _build/prod/rel/moon/bin/moon start
