ARG BASE_VERSION=22.10
FROM nvcr.io/nvidia/pytorch:${BASE_VERSION}-py3 as base

ENV DEBIAN_FRONTEND noninteractive

ARG USER_ID
ARG GROUP_ID
ARG USER_NAME
RUN apt-get clean
# this line change to ubuntu archive
RUN rm -rf /var/atp/lists/*
#RUN echo "nameserver 8.8.8.8"|tee /etc/resolv.conf > /dev/null
#RUN sed -i 's/archive.ubuntu/old-releases.ubuntu/' /etc/apt/sources.list
RUN apt-get update -y
RUN apt-get install vim -y
RUN apt-get install tmux -y
RUN apt-get install libgl1-mesa-glx -y
RUN apt-get install ffmpeg -y
RUN apt-get install libx264-dev -y
RUN apt-get install sudo -y
RUN apt-get install x11-xserver-utils -y
RUN apt-get install x11-apps -y

RUN echo ${GROUP_ID}
RUN addgroup --gid $GROUP_ID $USER_NAME
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID $USER_NAME --force-badname
RUN echo $USER_NAME:$USER_NAME|chpasswd
RUN adduser ${USER_NAME} sudo
RUN echo ${USER_NAME} 'ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER ${USER_NAME}
RUN pip install timm
RUN pip install yacs
RUN pip install pyhocon
RUN pip install -U fvcore
RUN pip install -U easydict
RUN pip install -U seaborn
RUN pip install -U loguru
#USER ${USER_NAME}
RUN git config --global user.name "pdh"
RUN git config --global user.email "pdh930105@gmail.com"

WORKDIR /home/${USER_NAME}


ENTRYPOINT ["/opt/nvidia/nvidia_entrypoint.sh"]

