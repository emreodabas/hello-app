FROM node:alpine

COPY package*.json ./

RUN npm i
COPY . .
USER nobody
EXPOSE 8080
CMD [ "node", "app.js" ]