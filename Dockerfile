FROM node:20-alpine

RUN npm config set strict-ssl=false

RUN mkdir -p /home/node/app && chown node:node /home/node/app

WORKDIR /home/node/app

USER node

RUN mkdir tmp

COPY --chown=node:node ./package*.json ./

RUN mkdir -p /home/node/app/node_modules

RUN npm install

COPY --chown=node:node . .

ENTRYPOINT ["npm", "run", "start"]