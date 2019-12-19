# base image
FROM node:latest

# workspace
WORKDIR /home/service/

# node packages
COPY package.json       /home/service/
COPY yarn.lock          /home/service/
RUN yarn && yarn cache clean

# copy app
COPY bin/               /home/service/bin/
COPY routes/            /home/service/routes
COPY app.js             /home/service/

ENTRYPOINT ["yarn", "start"]