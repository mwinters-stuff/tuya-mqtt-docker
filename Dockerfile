FROM node:lts-alpine
RUN apk add git
WORKDIR /home/node
RUN git clone https://github.com/TheAgentK/tuya-mqtt
WORKDIR /home/node/tuya-mqtt
RUN npm install
VOLUME /config
COPY run.sh run.sh
CMD [ "sh", "/home/node/tuya-mqtt/run.sh" ]
