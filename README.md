# ARM Music Server
A music server stack with Docker on ARM
WIP, don't use yet.

## Applications used in the stack

- [mpd](http://mpd.wikia.com/wiki/Music_Player_Daemon_Wiki)
- [ympd](https://www.ympd.org/): A minimal Web GUI for mpd.

MPD outputs audio to the Pi audio output.

## Music files

    Create a /var/lib/mpd/music

## Execution

You have two options to execute all the stack, using [docker-compose](https://docs.docker.com/compose/) or
launching the containers one-by-one, your choice. 

The default access to applications are:

- mpd: `http://localhost:6600` or `http://docker_machine_ip:6600`
- ympd gui: `http://localhost:8080` or `http://docker_machine_ip:8080`

### Docker Compose

Clone this repo. **Edit docker-compose.yml** and add your host volumes for your music, playlists and/or database, then:

    docker-compose up -d
    
    
How to install [docker-compose](https://github.com/docker/compose/releases)
