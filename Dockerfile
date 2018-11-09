#TODO:making docker non root && studying why it's needed

FROM bitnami/minideb:stretch

#operational directory
ENV OP_DIR=/app

RUN install_packages python3-minimal \
    build-essential \
    libssl-dev \
    libffi-dev \
    #bash \
#for nodejs
    curl \
    gnupg \
   && curl -sL https://deb.nodesource.com/setup_10.x | bash \
   && install_packages nodejs \
   && npm install
   

#Should volume be used? "Can't find command for docker right now"
COPY . ${OP_DIR} 
WORKDIR "${OP_DIR}"

RUN chmod +x run.sh
CMD ["sh", "run.sh"]


