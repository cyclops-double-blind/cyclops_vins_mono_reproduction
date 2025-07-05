FROM ros:melodic-ros-core-bionic

RUN apt-get update -y \
    && apt-get install -y --no-install-recommends \
        gosu \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update -y \
    && apt-get install -y --no-install-recommends \
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

COPY container/init.sh /entry/init.sh
COPY container/entry.sh /entry/entry.sh
ENTRYPOINT ["/entry/entry.sh"]
