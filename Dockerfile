FROM node:16.10-alpine AS build

WORKDIR /duckyapi
RUN apk update
RUN apk add git
RUN git clone https://github.com/louis-lau/DuckyAPI /duckyapi

RUN npm install
RUN npm run clean
RUN npm run build

RUN mv /duckyapi/config/example.env /duckyapi/config/production.env

COPY ./entrypoint.sh /duckyapi/entrypoint.sh
RUN chmod +x /duckyapi/entrypoint.sh

FROM node:16.10-alpine

WORKDIR /duckyapi
COPY --from=build /duckyapi /duckyapi

ENTRYPOINT ["sh", "/duckyapi/entrypoint.sh"]