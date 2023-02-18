#FROM python:3.9.2-slim-buster
FROM fedora:rawhide
RUN mkdir /bot && chmod 777 /bot
WORKDIR /bot
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Africa/Lagos
RUN yum -qq -y update && yum -qq -y install git bash xz wget curl pv jq python3.10 python3-pip mediainfo && python3 -m pip install --upgrade pip
RUN wget https://github.com/BtbN/FFmpeg-Builds/releases/download/latest/ffmpeg-n5.1-latest-linux64-gpl-5.1.tar.xz && tar -xvf *xz && cp *5.1/bin/* /usr/bin
COPY . .
RUN pip3 install -r requirements.txt
CMD ["bash","run.sh"]
