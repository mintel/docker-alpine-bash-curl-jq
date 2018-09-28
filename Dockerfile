FROM alpine:3.8

RUN apk add --no-cache curl jq bash \
    && rm -rf /var/cache/apk/*

CMD ["/bin/bash"]
