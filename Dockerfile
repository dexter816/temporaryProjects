FROM debian:buster-slim

ENV NODE_VERSION=10
ENV PYTHON_VERSION=3.6.7-1
ENV PIP_VERSION=9.0.1-2.3

RUN apt-get update && apt-get install -y python3=${PYTHON_VERSION} \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-pip=${PIP_VERSION} \
    vim-tiny \
#for nodejs
    gnupg \
    curl \
    --no-install-recommends \
   && curl -sL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash  \
   && apt-get update && apt-get install -y nodejs \
   --no-install-recommends \ 
   && rm -rf /var/lib/apt/lists/*

WORKDIR /app

ONBUILD RUN chmod +x run.sh
ONBUILD CMD ["sh", "run.sh"]


