# A dockerized SheepIt Renderfarm client with Nvidia CUDA support

This docker image is based on [@AGSPhoenix's](https://github.com/AGSPhoenix/sheepit-docker) Docker image with additional support for Nvidia-GPUs.

## Instructions

In order to make this image work, you need Docker >= 19.03 and the latest [NVIDIA driver](https://github.com/NVIDIA/nvidia-docker/wiki/Frequently-Asked-Questions#how-do-i-install-the-nvidia-driver) driver installed on your host system.

You also need to have the [nvidia-container-toolkit](https://github.com/NVIDIA/nvidia-docker#ubuntu-16041804-debian-jessiestretchbuster) installed.

Start the image with:

```
docker run -it \
 --name "Sheepit-Nvidia" \
 --gpus all \
 -e user_name="<username>" \
 -e user_password="<password_or_public_key>" \
 -e gpu=CUDA_<0/1/2/...> \
zocker160/sheepit-nvidia:latest 
```

#### Usage

**important:** if you don't specify `-e gpu`,  a list of all avalilable (Nvidia)-GPUs will be shown

- `-e user_name` / `-e user_password` specify usename and password of your sheepit account
- `-e cpu` *(optional)* to override cpu core autodetection; e.g. `-e cpu=4`
- 
- `--gpus all` this enables the passthrough to the GPU(s)
- `-e gpu` specify the Nvidia GPU to use for rendering (only one at a time is possible / lanuch multiple clients for more GPUs)
- `-h` *(optional)* set hostname
- `-e ui=<text/oneLine>` *(optional)* change the CLI mode; default: `text`

**important:** you can also pass any **additional** argument directly to the sheepit-client by replacing `<additional_sheepit_arguments>` (e.g. `-memory 5G`)

*hint: if you are using a DockerGUI like Portainer, you put those arguments into the `CMD` or `Command` field*

#### Get into the server terminal

```
docker attach <Container_name>
```

press `Ctrl + c` in order to exit after finishing the current frame

press `Ctrl + p` and then `Ctrl + q` in order to **detach** from the terminal

## Tags

| Docker tag | CUDA version |
|:----------:|:------------:|
| `latest`   | 10.2         |
| `cuda_9`   | 9.2          |

## Extra bits

[Docker Hub page](https://hub.docker.com/r/zocker160/sheepit-docker-webui//)  
[GitHub page](https://github.com/zocker-160/sheepit-docker-webUI)
[SheepIt client GitHub repo](https://github.com/laurent-clouet/sheepit-client)  
[SheepIt site](https://www.sheepit-renderfarm.com/)
