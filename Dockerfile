# Use the official Ubuntu LTS image
FROM ubuntu:24.04

# Avoid interactive prompts during package install
ENV DEBIAN_FRONTEND=noninteractive

# Install required packages for Buildroot
RUN apt-get update && apt-get install -y \
    build-essential git wget curl unzip xz-utils bc cpio \
    python3 rsync patch ncurses-dev bison flex gettext \
    libssl-dev file gawk vim make gperf diffutils sudo \
    ca-certificates curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Optional: create a non-root user
RUN useradd -ms /bin/bash buildroot \
    && echo "buildroot ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER buildroot
WORKDIR /home/buildroot

# Mount your project repo here when running the container
VOLUME ["/home/buildroot/work"]