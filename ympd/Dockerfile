FROM armhf/alpine:latest
MAINTAINER @actuino

RUN apk add --no-cache ca-certificates

# docker run -p 8080:8080 --net arm_music --name ympd -d actuino/ympd-armhf:dev

ENV YMPD_VERSION 1.3.0

ENV LIBMPDCLIENT_INCLUDE_DIR /usr/lib/libmpdclient.so.2

RUN set -ex \
    && apk --no-cache add curl cmake libmpdclient gcc g++ libmpdclient-dev openssl-dev make

RUN curl -fsSlL https://github.com/notandy/ympd/archive/v$YMPD_VERSION.tar.gz -o ympd.tar.gz \
    && tar -xzf ympd.tar.gz \
    && mkdir ympd-$YMPD_VERSION/build \
    && rm ympd.tar.gz

WORKDIR ympd-$YMPD_VERSION/build

RUN cmake .. -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    && make \
    && make install

RUN apk -q --no-progress del cmake gcc g++ openssl-dev libmpdclient-dev curl \
    && rm -rf /var/cache/apk/*
 
EXPOSE 8080

CMD ["ympd", "-h", "mpd", "-p", "6600", "-w", "8080"]
