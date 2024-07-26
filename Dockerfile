FROM mirror.gcr.io/library/debian:bookworm

RUN apt update && apt upgrade -y && apt install -y \
    azure-cli \
    python3-venv \
    git \
    sudo \
    iputils-ping \
    iputils-tracepath \
    traceroute \
    iproute2 \
    whois \
    file \
    net-tools \
    bind9-utils \
    openssh-server \
    tmux \
    picocom \
    telnet \
    curl \
    unzip \
    libarchive-tools \
    nmap && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*
RUN useradd -m -s /bin/bash user && \
    echo "user ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/user
RUN curl https://rclone.org/install.sh | bash
USER user