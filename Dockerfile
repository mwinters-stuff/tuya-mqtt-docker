FROM node:lts-alpine
RUN apk add --no-cache git
WORKDIR /home/node
RUN git clone --depth 1 --single-branch https://github.com/TheAgentK/tuya-mqtt 
WORKDIR /home/node/tuya-mqtt
RUN rm -rf .git .github && npm install
VOLUME /config
COPY run.sh run.sh
RUN apk del --rdepends git && rm -rf /var/cache/apk /root/.npm
CMD [ "sh", "/home/node/tuya-mqtt/run.sh" ]
