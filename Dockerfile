FROM eclipse-temurin:11-jre
#based on Ubuntu 24.04 LTS as of 06.08.2024

MAINTAINER zocker-160

ENV DEBIAN_FRONTEND noninteractive
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES all

RUN \
    apt-get update \
    && apt-get install -y --no-install-recommends curl \
    # Blender dependencies
    libxi6 \
    libxrender1 \
    libglu1-mesa \
    libgl1 \
    libgl1-mesa-dri \
    libglx-mesa0 \
    libxxf86vm1 \
    libxkbcommon0 \
    libsm6 \
    # some useful utils
    xz-utils \
    netcat \
    screen \
    unzip \
    7zip \
    curl \
    vim

RUN \
    apt-get autoremove -y && \
    apt-get autoclean -y && \
    apt-get clean -y && \
    apt-get purge -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /sheep

COPY startapp.sh /startapp.sh
RUN chmod +x /startapp.sh

RUN mkdir -p /sheep/cache

ENV user_name "zocker_160"
ENV user_password "Re85CqEhKAx937dXP19wRf2yRkvAIBemYIVhVaAx"
ENV cpu "0"
ENV gpu ""
ENV ui "text"

ENTRYPOINT ["/startapp.sh"]
