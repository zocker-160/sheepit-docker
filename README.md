# A dockerized SheepIt Renderfarm client with Nvidia CUDA support

This docker image is based on [@AGSPhoenix's](https://github.com/AGSPhoenix/sheepit-docker) Docker image with additional support for Nvidia-GPUs.

## Instructions

In order to make this image work, you need to have [nvidia-docker2](https://github.com/NVIDIA/nvidia-docker) installed to enable passthru on the nvidia card(s).

You will also need to have the [Nvidia-CUDA-toolkit](https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64)  to be installed.

Start the image with:

```
docker run -it \
 --name "Sheepit-Nvidia" \
 --runtime=nvidia \
 -e user_name="<username>" \
 -e user_password="<password_or_public_key>" \
 -e gpu=CUDA_<0> \
zocker160/sheepit-nvidia:latest
```

#### Usage

**important:** if you don't specify `-e gpu`,  a list of all avalilable (Nvidia)-GPUs will be shown

- `-e user_name` / `-e user_password` specify usename and password of your sheepit account
- `-e cpu` to override cpu core autodetection; e.g. `-e cpu=4`
- `--runtime=nvidia` this enables the passthrough to the GPU(s)
- `-h` *(optional)* set hostname

#### Get into the server terminal

```
docker attach <Container_name>
```
press `Ctrl + c` in order to exit after finishing the current frame

press `Ctrl + p` and then `Ctrl + q` in order to deattach from the terminal

## Extra bits

[Docker Hub page](https://hub.docker.com/r/zocker160/sheepit-docker-webui//)  
[GitHub page](https://github.com/zocker-160/sheepit-docker-webUI)
[SheepIt client GitHub repo](https://github.com/laurent-clouet/sheepit-client)  
[SheepIt site](https://www.sheepit-renderfarm.com/)
