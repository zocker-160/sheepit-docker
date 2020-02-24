FROM openjdk:8-jre-slim

# File Author / Maintainer
MAINTAINER zocker-160

ENV DEBIAN_FRONTEND noninteractive


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

RUN \
	apt-get autoremove -y && \
	apt-get autoclean -y && \
	apt-get clean -y && \
	apt-get purge -y && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /sheep/cache

ADD startrenderer.sh /sheep/startrenderer.sh
RUN chmod +x /sheep/startrenderer.sh

WORKDIR /sheep

ENV user_name "zocker_160"
ENV user_password "2nuZxTC1bxmkeFETiqK0RDpqKqYBcjb9EFAOH2CH"
ENV cpu "0"
ENV ui "text"

CMD ./startrenderer.sh
