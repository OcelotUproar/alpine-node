FROM node:7.2.1-alpine

RUN apk add --update git && rm -rf /var/cache/apk/*
