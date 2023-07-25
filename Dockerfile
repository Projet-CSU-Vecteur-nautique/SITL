FROM ubuntu:jammy

RUN apt-get update

RUN apt-get install vim git sudo -y

RUN git clone --recursive https://github.com/ArduPilot/ardupilot.git


RUN useradd -m -G sudo,dialout -s /bin/bash sitl && chown -R sitl:sitl ardupilot
RUN echo "sitl	ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
ENV USER=sitl
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Cayenne

RUN apt-get install tzdata -y

USER sitl


RUN cd ardupilot && Tools/environment_install/install-prereqs-ubuntu.sh -y
RUN . ~/.profile

RUN cd ardupilot && ./waf configure && ./waf rover
