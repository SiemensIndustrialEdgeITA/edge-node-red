ARG NODE_RED_VERSION=latest

FROM nodered/node-red:${NODE_RED_VERSION}

USER root

# Install os packages
RUN apk add --update-cache \
        cifs-utils \
    && rm -rf /var/cache/apk/*


# Copy package.json to the WORKDIR so npm builds all
# of your added nodes modules for Node-RED
COPY package.json .
RUN npm install --unsafe-perm --no-update-notifier --no-fund --only=production

# copy custom settings, start script and default flows file
COPY settings.js .
COPY start.sh .
COPY flows.json .

RUN chown -R node-red:node-red .

USER node-red

ENTRYPOINT ["/bin/sh", "start.sh"]