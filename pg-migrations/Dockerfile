# Dockerfile
FROM node:14-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install --production
RUN ls -la

COPY ./pg-migrations/src ./src
COPY ./pg-migrations/.env ./.env
COPY ./pg-migrations/pg-sql-migrations ./pg-sql-migrations
COPY index.js index.js

CMD [ "npm", "start" ]