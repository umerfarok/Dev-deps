# Dockerfile
FROM node:14-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install --production
RUN ls -la

COPY src ./src
COPY .env ./.env
COPY pg-sql-migrations ./pg-sql-migrations
COPY index.js index.js

CMD [ "npm", "start" ]