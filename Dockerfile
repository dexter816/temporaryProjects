FROM node:9-alpine
#FROM alpine:3.8

ONBUILD RUN apk add --update \
    python \
    python-dev \
    py-pip \
    bash \
  && rm -rf /var/cache/apk/*


WORKDIR /app
ONBUILD COPY . /app

EXPOSE 8080

#CMD [ "npm", "run", "start" ]

#for python
ONBUILD RUN pip install -r requirements.txt
ONBUILD RUN chmod +x run.sh
ONBUILD CMD ["sh", "run.sh"]
