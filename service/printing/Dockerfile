FROM ubuntu:18.04

RUN perl -p -i.bak -e 's%https?://(?!security)[^ \t]+%http://jp.archive.ubuntu.com/ubuntu/%g' /etc/apt/sources.list

RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install --yes --no-install-recommends \
    build-essential \
    libjpeg-dev \
    python3-dev \
    python3-pip \
    python3-setuptools \
    tzdata \
    zlib1g-dev \
  && rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade pip

COPY requirements.txt /root/
RUN pip3 install -r /root/requirements.txt

COPY src /root/src/

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo

EXPOSE 8080
WORKDIR /root/src
CMD ["uwsgi", "--module=app", "--callable=app", "--http=:8080"]
