FROM alpine:edge

MAINTAINER infiniteproject@gmail.com

RUN apk add --update make perl git automake autoconf g++ && \
    git clone https://github.com/savonet/liquidsoap-full.git liquidsoap && \
    cd liquidsoap && make init && ./bootstrap && ./configure && \
    cp PACKAGES.minimal PACKAGES && make

RUN adduser liquidsoap && mkdir -p /srv/liquidsoap && chown -R liquidsoap:liquidsoap /srv/liquidsoap

USER liquidsoap
ENTRYPOINT ["liquidsoap", "/srv/liquidsoap/radio.liq"]
