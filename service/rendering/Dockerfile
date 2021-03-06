FROM ubuntu:18.04

RUN perl -p -i.bak -e 's%https?://(?!security)[^ \t]+%http://jp.archive.ubuntu.com/ubuntu/%g' /etc/apt/sources.list

RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install --yes --no-install-recommends \
    ca-certificates \
    chromium-browser \
    fonts-ipaexfont \
    fonts-ipafont \
    git \
    tzdata \
    wget \
  && rm -rf /var/lib/apt/lists/*

RUN git clone --branch v1.3.0 --depth 1 https://github.com/nodenv/nodenv.git ~/.nodenv \
  && echo 'export PATH="${HOME}/.nodenv/bin:${PATH}"' >> ~/.bash_profile \
  && echo 'eval "$(nodenv init -)"' >> ~/.bash_profile
SHELL ["/bin/bash", "--login", "-c"]
RUN mkdir --parents $(nodenv root)/plugins \
  && git clone --branch v4.6.3 --depth 1 https://github.com/nodenv/node-build.git "$(nodenv root)"/plugins/node-build
RUN nodenv install 12.8.0 \
  && nodenv global 12.8.0

COPY package.json /root/
COPY package-lock.json /root/
RUN cd /root/ \
  && npm install

COPY src/ /root/src/

ENV TZ Asia/Tokyo

EXPOSE 8080
WORKDIR /root/
ENTRYPOINT ["/bin/bash", "--login", "-c"]
CMD ["npm start"]
