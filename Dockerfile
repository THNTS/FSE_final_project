# syntax=docker/dockerfile:1

FROM nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04

WORKDIR /usr/src/app

COPY . .

RUN apt-get update -y && apt-get install -y software-properties-common \
    && add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update -y && apt-get install -y \
 && apt-get clean all
RUN apt-get install -y python3.6
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 1
RUN update-alternatives --config python3
RUN apt-get update -y
RUN apt-get install -y \
        python3-pip \
    && apt-get clean all



#RUN apt-get install python3.6
RUN apt-get install unzip
#RUN apt-get install python3-pip
#RUN apt-get install -U python3-setuptools
RUN python3 -m pip install --upgrade "pip < 21.0"
RUN pip install -U setuptools
RUN python3 -m pip install -r requirements.txt
RUN chmod +x eval.sh
RUN chmod +x train.sh
RUN chmod +x preprocessing.sh
RUN chmod +x download.sh



