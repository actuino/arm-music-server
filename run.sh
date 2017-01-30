#!/bin/bash


docker network create -d bridge arm_music

docker run -d -p 6600:6600 --net arm_music -v /var/lib/mpd/music:/var/lib/mpd/music -v /var/lib/mpd/playlists:/var/lib/mpd/playlists --name mpd actuino/mpd-armhf:dev

docker run -d -p 8080:8080 --net arm_music --name=ympd -d actuino/ympd-armhf:dev