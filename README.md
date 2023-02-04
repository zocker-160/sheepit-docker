# A dockerized SheepIt Renderfarm client with Nvidia CUDA support

**in order to update the sheepit client itself, you only need to restart the container, it will download the latest version on startup**

## Instructions (CPU)

Start the image with:
```bash
docker run -it \
 --name "Sheepit" \
 -e user_name="<username>" \
 -e user_password="<password_or_public_key>" \
 -e gpu=none \
zocker160/sheepit-client <additional_sheepit_arguments>
```

## Instructions (GPU)

In order to make this image work, you need 

- Docker >= 19.03 
- Nvidia GPU driver
- `nvidia-docker2`

An official guide by Nvidia can be found [here](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html).

Start the image with:

```bash
docker run -it \
 --name "Sheepit" \
 --gpus all \
 -e user_name="<username>" \
 -e user_password="<password_or_public_key>" \
 -e gpu=OPTIX_<0/1/2/...> \
zocker160/sheepit-client <additional_sheepit_arguments>
```

#### Usage

**important:** if you don't specify `-e gpu`,  a list of all supported GPUs will be shown

- `-e user_name` / `-e user_password` specify usename and password of your sheepit account
- `-e cpu` *(optional)* to override cpu core autodetection; e.g. `-e cpu=4`
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

## Extra bits

[Docker Hub page](https://hub.docker.com/r/zocker160/sheepit-client)  
[GitHub page](https://github.com/zocker-160/sheepit-docker)
[SheepIt client repo](https://gitlab.com/sheepitrenderfarm/client/)  
[SheepIt website](https://www.sheepit-renderfarm.com/)
