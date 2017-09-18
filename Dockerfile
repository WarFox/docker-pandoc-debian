FROM debian

ENV PANDOC_VERSION 1.19.2.1

RUN apt-get update && apt-get install -y make \
    zlibc \
    zlib1g-dev \
    cabal-install \
    && cabal update \
    && cabal install pandoc-${PANDOC_VERSION} --global \
    && apt-get purge -y zlibc \
    zlib1g-dev \
    cabal-install \
    cpp \
    cpp-6 \
    gcc \
    gcc-6 \
    ghc \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/* \
