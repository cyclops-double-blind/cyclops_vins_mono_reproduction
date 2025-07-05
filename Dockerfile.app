FROM ros:melodic-ros-core-bionic

RUN apt-get update -y \
    && apt-get install -y --no-install-recommends \
        gosu \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update -y \
    && apt-get install -y --no-install-recommends \
        libgoogle-glog0v5 \
        ros-melodic-cv-bridge ros-melodic-tf \
        ros-melodic-message-filters ros-melodic-image-transport \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update -y \
    && apt-get install -y --no-install-recommends \
        avahi-daemon avahi-discover libnss-mdns \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /catkin
COPY catkin/install/* /catkin/

COPY etc/init.sh /etc/init.sh
COPY etc/entry.sh /etc/entry.sh
ENTRYPOINT ["/etc/entry.sh"]
