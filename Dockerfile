FROM alpine:3.10

ENV DOCKERIZE_VERSION v0.6.1

RUN apk add --no-cache curl \
                       jq \
                       bash \
                       openssl \
                       netcat-openbsd \
    && rm -rf /var/cache/apk/* \
    && wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz

COPY --from=gcr.io/google_containers/pause-amd64:3.1 /pause /

ENTRYPOINT ["/bin/bash"]
