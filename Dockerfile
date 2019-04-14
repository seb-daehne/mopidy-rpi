FROM arm32v6/alpine:3.9.3
LABEL maintainer "Sebastian Daehne <daehne@rshc.de>"

ADD qemu-arm-static /usr/bin
RUN adduser -S mopidy

RUN apk update && apk upgrade && \
    apk add --no-cache  \
            --repository http://dl-cdn.alpinelinux.org/alpine/edge/main \
            --repository  http://dl-cdn.alpinelinux.org/alpine/edge/community \
            --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
            gstreamer \
            mopidy=2.1.0-r1 \
            alpine-sdk \
            python3 \
            py3-yaml
RUN pip3 install Mopidy-GMusic Mopidy-Youtube youtube-dl pyasn1

COPY mopidy.conf /home/mopidy/.config/mopidy/mopidy.conf

USER mopidy
ENTRYPOINT ["/usr/bin/mopidy"]
