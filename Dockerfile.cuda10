FROM nvidia/cuda:10.1-base

MAINTAINER zocker-160

RUN \
# MAN folder needed for jre install
     mkdir -p /usr/share/man/man1 \
  && mkdir -p /sheep/cache \
# Install JRE and curl
  && apt-get update \
  && apt-get install -y --no-install-recommends \
	openjdk-8-jre \
	curl \
	#install Blender to get all dependencies
	#blender
	libsdl1.2debian \
	libxxf86vm1 \
	libgl1-mesa-glx \
	libglu1-mesa \
	libxi6 \
	libxrender1 \
	libxfixes3

WORKDIR /sheep
COPY startapp.sh /startapp.sh

ENV user_name "zocker_160"
ENV user_password "2Y6jA1SDCaOeu7lPq6xMLqG2faqaBhR4I4CfxyAz"
ENV cpu "0"
ENV gpu ""
ENV ui "text"

CMD /startapp.sh
