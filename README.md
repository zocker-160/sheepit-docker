# A simple dockerized SheepIt render farm client

This is a fork of @AGSPhoenix docker image.

After being appalled by @dapor2000's monstrous [1.2 GB SheepIt client](https://hub.docker.com/r/dapor/docker_sheepit_renderfarm/) image, I took it upon myself to build a somewhat more lightweight client, and after a few hours, came up with this Debian-based image that is a fifth the size, acts as a drop-in replacement, and auto-updates the client on container startup.

There's probably a little more room for fat trimming, since this was adapted from an old Ubuntu VM setup script, but I'm satisfied with where things are currently.

## Instructions
Pretty similar to @dapor2000's, just swap out your username and password.

```
docker run -it \
 --name "Sheepit-Renderclient" \
 -e user_name=<username> \
 -e user_password=<password_or_public_key> \
 zocker160/sheepit-slim:latest
```

#### Usage

- `-e user_name` / `-e user_password` specify usename and password of your sheepit account
- `-e cpu=4` *(optional)* number of CPU cores being used for rendering - if not set: *autodetection*
- `-d` *(optional)* run docker image in background; use `docker attach <container_name>` to get into the running container
- `-h` *(optional)* set hostname
- `-e ui <text/oneLine>` *(optional)* change the CLI mode; options: `text`(default), `oneLine`

#### Get into the server terminal

```
docker attach <Container_name>
```
press `Ctrl + c` in order to exit after finishing the current frame

press `Ctrl + p` and then `Ctrl + q` in order to deattach from the terminal

## Extra bits
[Docker Hub page](https://hub.docker.com/r/agsphoenix/sheepit-docker/)  
[GitHub page](https://github.com/AGSPhoenix/sheepit-docker)

[SheepIt client GitHub repo](https://github.com/laurent-clouet/sheepit-client)  
[SheepIt site](https://www.sheepit-renderfarm.com/)
