
FROM bitnami/minideb:stretch

#operational directory
ENV OP_DIR=/app
ENV NODE_VERSION=10

RUN install_packages python3-all \
    build-essential \
    libssl-dev \
    libffi-dev \
#for nodejs
    curl \
    gnupg \
   && curl -sL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash  \
   && install_packages nodejs 
   

#Should volume be used? "Can't find command for docker right now"
COPY . ${OP_DIR} 
WORKDIR "${OP_DIR}"

RUN chmod +x run.sh
CMD ["sh", "run.sh"]


