#!/bin/bash


docker network create -d bridge arm_music

docker run -d -p 6600:6600 --net music_stack -v /var/lib/mpd:/var/lib/mpd--name mpd actuino/mpd-armhf:dev

docker run -d -p 8080:8080 --net music_stack --name=ympd -d actuino/ympd-armhf:dev