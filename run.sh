#!/bin/sh
CONFIG_FILE=/config/config.json
DEVICES_FILE=/config/devices.conf
cd /home/node/tuya-mqtt

# test for config in /config
if [ ! -e ${CONFIG_FILE} ]
then
  cp config.json.sample ${CONFIG_FILE}
fi

if [ ! -e ${DEVICES_FILE} ]
then
  touch ${DEVICES_FILE}
fi

ln -sf ${CONFIG_FILE}
ln -sf ${DEVICES_FILE}

DEBUG=tuya-mqtt:* node tuya-mqtt.js
