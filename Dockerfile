FROM alpine:3.11

ENV DOCKERIZE_VERSION v0.6.1-2

RUN apk add --no-cache bash \
                       curl \
                       jq \
                       httpie \
                       netcat-openbsd \
                       openssl \
                       py3-pip \
    && rm -rf /var/cache/apk/* \
    && wget https://github.com/primeroz/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && pip3 install yq==2.10.0

COPY --from=gcr.io/google_containers/pause-amd64:3.1 /pause /

ENTRYPOINT ["/bin/bash"]
