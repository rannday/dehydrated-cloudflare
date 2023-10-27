FROM alpine:latest
RUN \
  echo 'http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories && \
  apk update && apk add --update bash darkhttpd dehydrated curl openssl && \
  mkdir -p /var/www/dehydrated && \
  touch /var/www/dehydrated/index.html && \
  echo '<h1>Working!</h1>' > /var/www/dehydrated/index.html && \
  rm -rf /var/cache/apk/*

VOLUME /etc/dehydrated
VOLUME /etc/cron.d/dehydrated-crontab

EXPOSE 80

CMD ["darkhttpd", "/var/www/dehydrated"]