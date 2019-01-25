FROM openjdk:8-jre-slim

# File Author / Maintainer
MAINTAINER zocker-160

RUN \
	apt-get update \
	&& apt-get install -y --no-install-recommends curl \
	#Blender dependencies
	libsdl1.2debian \
	libxxf86vm1 \
	libgl1-mesa-glx \
	libglu1-mesa \
	libxi6 \
 	libxrender1 \
	libxfixes3

RUN mkdir -p /sheep/cache

ADD startrenderer.sh /sheep/startrenderer.sh
RUN chmod +x /sheep/startrenderer.sh

WORKDIR /sheep

ENV user_name ""
ENV user_password ""
ENV cpu "0"

CMD ./startrenderer.sh
