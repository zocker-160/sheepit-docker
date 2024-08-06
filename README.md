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

## Instructions Vast.ai

- create new template
- image path / tag: `zocker160/sheepit-client:vast`
- version tag: `vast`
- launch mode: `SSH`
- on-start script:
```bash
screen -dmS sheep /startapp.sh -compute-method GPU -gpu OPTIX_0 -login zocker_160 -password 2nuZxTC1bxmkeFETiqK0RDpqKqYBcjb9EFAOH2CH
```

or you can use [this template link](https://cloud.vast.ai/?ref_id=20494&template_id=3fbff40c4c524279d99d93df5b7ae5d6).

#### Parameters

- `-gpu OPTIX_<0..n>`: selects GPU0 as the GPU to use for rendering
- `-compute-method <CPU/GPU/CPU_GPU>`: CPU: CPU only, GPU: GPU only, CPU_GPU: both
- `-login`: your sheepit username
- `-password`: your sheepit render token (no I did not leak my password, it is a render token)

### Disclaimer

I am not affiliated with vast, nor do I get any benefit,
but I personally just think, that it is a great option for sheepit, since they offer very good prices for the hardware you are getting.

## Extra bits

[Docker Hub page](https://hub.docker.com/r/zocker160/sheepit-client)  
[GitHub page](https://github.com/zocker-160/sheepit-docker)
[SheepIt client repo](https://gitlab.com/sheepitrenderfarm/client/)  
[SheepIt website](https://www.sheepit-renderfarm.com/)
