FROM ubuntu:latest
MAINTAINER fnndsc "dev@babymri.org"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip \
  && apt-get install -y git libprotobuf-dev libprotobuf-c-dev protobuf-c-compiler protobuf-compiler python-protobuf
  # && pip3 install cryptography \
  # && pip3 install requests \
  # && pip3 install --upgrade google-api-python-client


RUN mkdir /app

COPY . /app
# # COPY ./mightylib/ /mightylib/

WORKDIR /app

RUN pip3 install -r requirements.txt


RUN python setup.py build

# ENTRYPOINT ["python3"]
CMD python3