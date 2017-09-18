FROM debian

RUN apt-get update && apt-get install -y make \
    zlibc \
    zlib1g-dev \
    cabal-install \
    && rm -rf /var/lib/apt/lists/*

ENV PANDOC_VERSION 1.19.2.1

RUN cabal update && \
    cabal install pandoc-${PANDOC_VERSION} --global

RUN apt-get purge -y zlibc\
    zlib1g-dev \
    cabal-install \
    && apt-get clean \
    && apt-get autoremove
