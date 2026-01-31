FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    make \
    libncurses-dev \
    sudo \
    udev \
    util-linux \
    usbutils \
    adb \
    nvme-cli \

    hdparm \
    bash \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /securewipe
COPY . .

# Build sentinel directly
RUN make

CMD ["./bin/sentinel"]

