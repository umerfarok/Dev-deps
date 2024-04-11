# Dockerfile
FROM node:14-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install --production


COPY ./pg-migrations/src ./src
COPY ./pg-migrations/.env ./.env
COPY ./pg-migrations/pg-sql-migrations ./pg-sql-migrations
COPY ./pg-migrations/index.js index.js

CMD [ "npm", "start" ]
