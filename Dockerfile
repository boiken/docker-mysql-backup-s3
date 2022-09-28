FROM node:alpine
MAINTAINER BSDev

RUN apk add --update py-pip mysql-client curl bash apk-cron && \
  pip install awscli && \
  npm install -g slack-cli && \
  rm -fR /var/cache/apk/*

# this prevent "TERM environment variable not set.""
ENV TERM dumb

RUN mkdir -p /backup
ADD . /backup
RUN chmod +x /backup/bin/*

WORKDIR /backup/bin/

ENTRYPOINT ["/backup/bin/entrypoint"]
