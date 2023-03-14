#!/bin/bash

if [ ${SERVE_DUCKYPANEL:-"unset"} != "unset" ]; then
    sed -i -e "/SERVE_DUCKYPANEL=/ s/# //" /duckyapi/config/production.env
    sed -i -e "/SERVE_DUCKYPANEL=/ s/=.*/=$SERVE_DUCKYPANEL/" /duckyapi/config/production.env
f
if [ ${BASE_URL:-"unset"} != "unset" ]; then
    sed -i -e "/BASE_URL=/ s/# //" /duckyapi/config/production.env
    sed -i -e "/BASE_URL=/ s/=.*/=$BASE_URL/" /duckyapi/config/production.env
fii

if [ ${TOKEN_SECRET:-"unset"} != "unset" ]; then
    sed -i -e "/TOKEN_SECRET=/ s/=.*/=$TOKEN_SECRET/" /duckyapi/config/production.env
fi

if [ ${MONGODB_URL:-"unset"} != "unset" ]; then
    sed -i -e "/MONGODB_URL=/ s/=.*/=$MONGODB_URL/" /duckyapi/config/production.env
fi

if [ ${REDIS_URL:-"unset"} != "unset" ]; then
    sed -i -e "/REDIS_URL=/ s/=.*/=$REDIS_URL/" /duckyapi/config/production.env
fi

if [ ${WILDDUCK_API_URL:-"unset"} != "unset" ]; then
    sed -i -e "/WILDDUCK_API_URL=/ s/=.*/=$WILDDUCK_API_URL/" /duckyapi/config/production.env
fi

if [ ${WILDDUCK_API_TOKEN:-"unset"} != "unset" ]; then
    sed -i -e "/WILDDUCK_API_TOKEN=/ s/=.*/=$WILDDUCK_API_TOKEN/" /duckyapi/config/production.env
fi

if [ ${MX_RECORDS:-"unset"} != "unset" ]; then
    sed -i -e "/MX_RECORDS=/ s/=.*/=$MX_RECORDS/" /duckyapi/config/production.env
fi

if [ ${SPF_CORRECT_VALUE:-"unset"} != "unset" ]; then
    sed -i -e "/SPF_CORRECT_VALUE=/ s/=.*/=$SPF_CORRECT_VALUE/" /duckyapi/config/production.env
fi

if [ ${SPF_REGEX:-"unset"} != "unset" ]; then
    sed -i -e "/SPF_REGEX=/ s/=.*/=$SPF_REGEX/" /duckyapi/config/production.env
fi

if [ ${DEFAULT_DKIM_SELECTOR:-"unset"} != "unset" ]; then
    sed -i -e "/DEFAULT_DKIM_SELECTOR=/ s/=.*/=$DEFAULT_DKIM_SELECTOR/" /duckyapi/config/production.env
fi

if [ ${QUEUE_UI} == "true" ]; then
    sed -i -e "/QUEUE_UI=/ s/# //" /duckyapi/config/production.env
    sed -i -e "/QUEUE_UI=/ s/=.*/=$QUEUE_UI/" /duckyapi/config/production.env
    sed -i -e "/QUEUE_UI_USER=/ s/# //" /duckyapi/config/production.env
    sed -i -e "/QUEUE_UI_USER=/ s/=.*/=$QUEUE_UI_USER/" /duckyapi/config/production.env
    sed -i -e "/QUEUE_UI_PASSWORD=/ s/# //" /duckyapi/config/production.env
    sed -i -e "/QUEUE_UI_PASSWORD=/ s/=.*/=$QUEUE_UI_PASSWORD/" /duckyapi/config/production.env
else
    sed -i -e "/QUEUE_UI=/ s/^QUEUE/# QUEUE/" /duckyapi/config/production.env
    sed -i -e "/QUEUE_UI_USER=/ s/^QUEUE/# QUEUE/" /duckyapi/config/production.env
    sed -i -e "/QUEUE_UI_PASSWORD=/ s/^QUEUE/# QUEUE/" /duckyapi/config/production.env
fi

npm start