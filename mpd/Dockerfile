FROM armhf/alpine:latest
MAINTAINER @actuino

RUN apk add --no-cache ca-certificates

# docker run -p 6600:6600 --net arm_music --name mpd -d -v /var/lib/mpd/music:/var/lib/mpd/music -v /var/lib/mpd/playlists:/var/lib/mpd/playlists actuino/mpd-armhf:dev

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

VOLUME ["/var/lib/mpd/music", "/var/lib/mpd/playlists"]
COPY mpd.conf /etc/mpd.conf

#RUN chown -R ${user}:${group} /var/lib/mpd

# Entry point for mpc update and stuff
EXPOSE 6600

#CMD ["/bin/sh"]
CMD ["mpd", "--stdout", "--no-daemon"]
