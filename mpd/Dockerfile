FROM armhf/alpine:latest
MAINTAINER @actuino

RUN apk add --no-cache ca-certificates

# docker run -p 6600:6600 --net arm_music --name mpd -d -v /var/lib/mpd:/var/lib/mpd actuino/mpd-armhf:dev

#ENV MPD_VERSION 0.19.12-r0
#ENV MPC_VERSION 0.27-r0

ARG user=mpd
ARG group=audio

RUN set -ex \
    && apk add --no-cache mpd mpc \
    && rm -rf /var/cache/apk/*

RUN mkdir -p /var/lib/mpd/music \
    && mkdir -p /var/lib/mpd/playlists \
    && mkdir -p /var/lib/mpd/database \
    && mkdir -p /var/log/mpd/mpd.log \
    && chown -R ${user}:${group} /var/lib/mpd \
    && chown -R ${user}:${group} /var/log/mpd/mpd.log

# Declare a music , playlists and database volume (state, tag_cache and sticker.sql)
VOLUME ["/var/lib/mpd"]
COPY mpd.conf /etc/mpd.conf

# Entry point for mpc update and stuff
EXPOSE 6600

CMD ["mpd", "--stdout", "--no-daemon"]